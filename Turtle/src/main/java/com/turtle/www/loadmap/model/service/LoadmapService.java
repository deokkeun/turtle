package com.turtle.www.loadmap.model.service;

import java.util.List;

import com.turtle.www.loadmap.model.vo.GitCommit;
import com.turtle.www.loadmap.model.vo.Loadmap;

public interface LoadmapService {

	String insertGit(Loadmap loadmap);

	
	GitCommit selectNewCommitList(Loadmap loadmap);


	List<GitCommit> selectGitCommitListByLoadmapNo(int workspaceNo);


	Loadmap selectLoadmap(int workspaceNo);

}
