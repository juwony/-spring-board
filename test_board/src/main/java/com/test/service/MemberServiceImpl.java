package com.test.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.dao.MemberDAO;
import com.test.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	
	// 회원 정보 수정
	@Override
	public void update(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	// 회원 탈퇴
	@Override
	public void withdraw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.withdraw(vo);
	}
	
	// 아이디 확인
	@Override
	public MemberVO idCheck(String userID) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(userID);
	}

}
