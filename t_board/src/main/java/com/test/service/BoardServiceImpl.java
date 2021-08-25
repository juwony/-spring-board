package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.test.dao.BoardDAO;
import com.test.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// 게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	// 게시물 작성
	@Transactional
	@Override
	public void write(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
		
		String[] files = vo.getFiles();
		
		if(files == null) {
			return;
			
		}
		
		for(String fileName : files) {
			dao.addAttach(fileName, vo.getBno());
		}
	}
	
	// 게시물 조회
	@Override
	public BoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.boardHit(bno);
		return dao.view(bno);
	}
	
	// 게시물 수정
	@Transactional
	@Override
	public void modify(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
		
		int bno = vo.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = vo.getFiles();
		
		if(files == null) {
			return;
		}
		
		for(String fileName : files) {
			dao.replaceAttach(fileName, bno);
		}
	}
	
	// 게시물 삭제
	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAttach(bno);
		dao.delete(bno);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}
	
	// 파일 조회
	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(bno);
	}

}
