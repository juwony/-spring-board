package com.test.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {

	/*
	 create table tbl_board(
	 	bno int not null auto_increment,
	 	title varchar(50) not null,
	 	content text not null,
	 	writer varchar(30) not null,
	 	regDate timestamp not null default now(),
	 	viewCnt int default 0,
	 	primary key(bno)
	 );
	 */
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	
	private String[] files;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String[] getFiles() {
		return files;
	}
	
	public void setFiles(String[] files) {
		this.files = files;
	}

	
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno +
						", title=" + title +
						", content=" + content +
						", writer=" + writer +
						", regDate=" + regDate +
						", viewCnt=" + viewCnt +
						", files=" + Arrays.toString(files) + "]";
	}
}
