package com.turtle.www.loadmap.model.vo;

import java.util.Date;
import java.util.List;

import com.turtle.www.common.util.json.JsonMaker;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GitCommit {
	
	private int commitNo; // 커밋 번호
	private int loadmapNo; // 로드맵 번호
	private String login; // 로그인
	private String message; // 메세지
	private Date commitDate; // 커밋날짜
	private String files; // 커밋한 파일들
	private Date regDate; // 등록일
	
	public GitCommit() {
	}
	
	public int getCommitNo() {
		return commitNo;
	}



	public void setCommitNo(int CommitNo) {
		this.commitNo = CommitNo;
	}



	public int getLoadmapNo() {
		return loadmapNo;
	}



	public void setLoadmapNo(int LoadmapNo) {
		this.loadmapNo = LoadmapNo;
	}



	public String getLogin() {
		return login;
	}



	public void setLogin(String login) {
		this.login = login;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public Date getCommitDate() {
		return commitDate;
	}



	public void setCommitDate(Date commitDate) {
		this.commitDate = commitDate;
	}



	public String getFiles() {
		return files;
	}



	public void setFiles(List<String> files) {
		this.files = JsonMaker.json(files);
	}
	
	public void setFiles(String files) {
		this.files = files;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "GitCommit [commitNo=" + commitNo + ", loadmapNo=" + loadmapNo + ", login=" + login + ", message=" + message
				+ ", commitDate=" + commitDate + ", files=" + files + ", regDate=" + regDate + "]";
	}




	
	
}
