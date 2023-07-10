package com.turtle.www.loadmap.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.kohsuke.github.GHCommit;
import org.kohsuke.github.GHCommit.File;
import org.kohsuke.github.GHRepository;
import org.kohsuke.github.GHTree;
import org.kohsuke.github.GHTreeEntry;
import org.kohsuke.github.GitHub;
import org.kohsuke.github.GitHubBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turtle.www.common.util.json.JsonMaker;
import com.turtle.www.loadmap.model.dao.LoadmapDAO;
import com.turtle.www.loadmap.model.vo.GitCommit;
import com.turtle.www.loadmap.model.vo.Loadmap;

@Service
public class LoadmapServiceImpl implements LoadmapService{

	
	@Autowired
	private LoadmapDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(LoadmapServiceImpl.class);

	
	
	
	
	@Override
	public String insertGit(Loadmap loadmap) {

		// 로드맵 주소 세팅
		List<Map<String, Object>> paths = new ArrayList<>();
		
		System.out.println("if전" + loadmap.getGitRepo());
		
		if(loadmap.getGitRepo() == null) {
			System.out.println("if 이면 실패(insertGit serviceImpl) = " + loadmap.getGitRepo());
			return "fail";
		}
		
		// 워크스페이스 번호와 일치하는 이전의 로드맵 기록 조회
		Loadmap beforeLoadmap = dao.selectLoadmapByWorkspaceNo(loadmap.getWorkspaceNo());
		GitCommit gitCommit = null;
		
		// 로드맵 조회
		System.out.println("로드맵 조회 : " + beforeLoadmap);
		
		// 워크스페이스 번호의 로드맵 기록이 존재
		if(beforeLoadmap != null) {
			// 조회 후 기록이 있으면 기존 기록 제거
			dao.deleteLoadmapByworkspaceNo(beforeLoadmap.getWorkspaceNo());
		}
		
	
		try {
			logger.debug("repo 전");
			GHRepository repo = getGitRepo(loadmap);
			logger.debug("repo = " + repo);
			
			makeGitTree(repo, loadmap);
			
			logger.debug("makeGitTree 수행 후 = " + repo);
			
			gitCommit = getCommitFileShaList(repo);
			
			logger.debug("gitCommit = " + gitCommit);
			
		} catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
		
		logger.debug("LoadmapServiceImpl loadmap 추가 = " + loadmap);
		
		// 로드맵 정보 DB 업로드
		dao.insertGit(loadmap);
		
		// 업로드된 정보 DB 로 SEQ_LOADMAP_NO.NEXTVAL 번호 받아오기
		Loadmap selectLoadmapNo = dao.selectLoadmapByWorkspaceNo(loadmap.getWorkspaceNo());
		
		// LOADMAP테이블에 저장 된 SEQ_LOADMAP_NO.NEXTVAL 번호를 GIT_COMMIT 테이블의 LOADMAP_NO에 주입
		gitCommit.setLoadmapNo(selectLoadmapNo.getLoadmapNo());

		dao.insertGitCommit(gitCommit);

		System.out.println(loadmap);
		
		
		return "complete";
	}


	/** 저장소 정보 불러오기(************** 토큰값 **************)
	 * @param loadmap
	 * @return
	 * @throws IOException
	 */
	private GHRepository getGitRepo(Loadmap loadmap) throws IOException {
		GitHub github = new GitHubBuilder()
				.withOAuthToken(" ".replace("=", "")).build();
		GHRepository repo = github.getRepository(loadmap.getGitRepo());
		return repo;
	}
	
	
	private GitCommit getCommitFileShaList(GHRepository repo) throws IOException {
		
		logger.debug("getCommitFileShaList" + repo);
		
		GitCommit gitCommit = new GitCommit();
		List<String> fileSha = new ArrayList<>();
		for (GHCommit g : repo.listCommits()) {

			gitCommit.setLogin(g.getCommitter().getLogin());
			gitCommit.setMessage(g.getCommitShortInfo().getMessage());
			gitCommit.setCommitDate(new Date(g.getCommitDate().getTime()));

			for (File f : repo.getCommit(g.getSHA1()).getFiles()) {
				System.out.println("추가 파일: " + f.getSha());
				String[] fileUrl = f.getFileName().split("/");
				fileSha.add(fileUrl[fileUrl.length - 1]);
			}

			break; // 1번만 돌고 멈춤
		}
		gitCommit.setFiles(fileSha);
		System.out.println("getCommitFileShaList = " + gitCommit);

		return gitCommit;
	}


	/** 저장소 정보로 트리구조 만들어 데이터 반환
	 * @param repo
	 * @param loadmap
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, Object>> makeGitTree(GHRepository repo, Loadmap loadmap) throws Exception {
		// 깃 브랜치 등록
		GHTree ghTree = repo.getTree(loadmap.getBranch());
		List<GHTreeEntry> treeList = ghTree.getTree();
		
		logger.debug("treeList = " + treeList);

		// 트리구조 큐(FIFO)
		Queue<Map<String, Object>> q = new LinkedList<>();
		List<Map<String, Object>> paths = new ArrayList<>();
		
		for (int i = 0; i < treeList.size(); i++) {

			if (treeList.get(i).getType().equals("tree")) {
				String sha = treeList.get(i).getSha();
				String path = treeList.get(i).getPath();
//				System.out.println(sha);
//				System.out.println(path);
				Map<String, Object> m = new HashMap<>();
				m.put("sha", sha.substring(0, 8));
				m.put("path", path);
				m.put("type", "tree");
				paths.add(m);
				
				// Queue에 첫번째 암호, 경로, tree타입으로 만들어진 하나의 Map 추가
				q.offer(m);

				// Queue가 끝날때 까지 반복(tree구조에 두번째(하위 폴더))
				while (q.size() != 0) {
					// Queue에서 한개씩 꺼내오면서 제거
					Map<String, Object> thisM = q.poll();
					// 첫 번째 정보로 두번째 트리구조 받아오기
					List<GHTreeEntry> lt = repo.getTree((String) thisM.get("sha")).getTree();
					
					for (int j = 0; j < lt.size(); j++) {
						Map<String, Object> m2 = new HashMap<>();
						String p = (String) thisM.get("path");

						// ignore 파일인지 확인
						boolean ignoring = ignoring(p, loadmap.getIgnore());
						if (ignoring) {							
							break;
						}
						
						// Tree: 파일이나 디렉토리의 구조를 나타내는 개체
						if (lt.get(j).getType().equals("tree")) {
							m2.put("prev", (String) thisM.get("sha"));
							m2.put("sha", lt.get(j).getSha().substring(0, 8));
							m2.put("path", lt.get(j).getPath());
							m2.put("type", "tree");
							// 두번째 tree
							q.offer(m2);
							System.out.println(m2);
						
							// Blob (Binary Large Object): 파일의 내용을 나타내는 개체
						} else if (lt.get(j).getType().equals("blob")) {
							
							m2.put("prev", (String) thisM.get("sha"));
							m2.put("path", lt.get(j).getPath());
							m2.put("sha", lt.get(j).getSha().substring(0, 8));
							m2.put("type", "blob");
//							System.out.println(m2);
//							System.out.println(lt.get(j).getSha());
						}
						
						paths.add(m2);
					}
				}
			}
		}

		loadmap.setGitTree(JsonMaker.json(paths));
		
		return paths;
	}
	

	/** ignore 파일 확인
	 * @param path
	 * @param ignore
	 * @return
	 */
	private boolean ignoring(String path, String ignore) {
		if (path.equals(ignore)) {
			return true;
		}
		return false;
	}







	@Override
	public Loadmap selectLoadmap(int workspaceNo) {

		Loadmap loadmap = dao.selectLoadmapByWorkspaceNo(workspaceNo);

		return loadmap;
	}

	@Override
	public List<GitCommit> selectGitCommitListByLoadmapNo(int loadmapNo) {
		return dao.selectGitCommitListByLoadmapNo(loadmapNo);
	}

	@Override
	public GitCommit selectNewCommitList(Loadmap loadmap) {

		logger.debug("selectNewCommitList 1번 ajax= " + loadmap);
		
		
		GitCommit gitCommit = null;

		try {

			GHRepository repo = getGitRepo(loadmap);
			gitCommit = getCommitFileShaList(repo);
			System.out.println("다시 받아온 깃커밋:  " + gitCommit);

		} catch (IOException e) {
			e.printStackTrace();
		}
		List<GitCommit> lastGitList = dao.selectGitCommitListByLoadmapNo(loadmap.getLoadmapNo());
		System.out.println(lastGitList);
		if (lastGitList != null) {

			GitCommit lastGit = lastGitList.get(0);
			if (lastGit.getCommitDate().getTime() == gitCommit.getCommitDate().getTime()) {
				System.out.println("최신과 같음 걸림");
				return null;
			} else {

				System.out.println("여기걸림");
				gitCommit.setLoadmapNo(loadmap.getLoadmapNo());
				dao.insertGitCommit(gitCommit);

			}

		}

		return gitCommit;
	}


	
	
	
	
	
	
}
