package com.test.dao;

import com.test.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원 정보 수정
	public void update(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	public void withdraw(MemberVO vo) throws Exception;
	
	// 아이디 확인
	public MemberVO idCheck(String userID) throws Exception;
}
