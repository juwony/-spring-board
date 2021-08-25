package com.test.domain;

import java.util.Date;

public class MemberVO {
	/*
	 
	 create table tbl_member(
	userID varchar(30) not null,
	userPW varchar(100) not null,
	userName varchar(30) not null,
	regDate timestamp not null default now(),
	primary key(userID)
	);
	 
	 */
	
	private String userID;
	private String userPW;
	private String userName;
	private Date regDate;
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserPW() {
		return userPW;
	}
	
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
