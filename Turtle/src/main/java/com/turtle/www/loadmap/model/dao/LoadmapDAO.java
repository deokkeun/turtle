package com.turtle.www.loadmap.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.turtle.www.loadmap.model.vo.GitCommit;
import com.turtle.www.loadmap.model.vo.Loadmap;

@Repository
public class LoadmapDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Loadmap selectLoadmapByWorkspaceNo(int workspaceNo) {
		return sqlSession.selectOne("loadmapMapper.selectLoadmapByWorkspaceNo", workspaceNo);
	}

	public void deleteLoadmapByworkspaceNo(int workspaceNo) {
		sqlSession.delete("loadmapMapper.deleteLoadmapByworkspaceNo", workspaceNo);
	}


	public void insertGit(Loadmap loadmap) {
		sqlSession.insert("loadmapMapper.insertGit", loadmap);
	}
	
	public void insertGitCommit(GitCommit gitCommit) {
		sqlSession.insert("gitCommitMapper.insertGitCommit", gitCommit);
	}

	public List<GitCommit> selectGitCommitListByLoadmapNo(int loadmapNo) {
		return sqlSession.selectList("gitCommitMapper.selectGitCommitListByLoadmapNo", loadmapNo);
	}



	
	
	
	
	
	
	
}
