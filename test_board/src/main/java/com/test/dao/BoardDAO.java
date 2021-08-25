package com.test.dao;

import java.util.List;

import com.test.domain.BoardVO;

public interface BoardDAO {
	
	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	//게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;	

	// 게시물 총 개수 + 검색 적용 
	public int searchCount(String searchType, String keyword) throws Exception;
	
	// 파일 업로드
	public void addAttach(String fullName, Integer bno) throws Exception;
	
	// 파일 조회
	public List<String> getAttach(Integer bno) throws Exception;
	
	// 파일 삭제
	public void deleteAttach(Integer bno) throws Exception;
	
	// 파일 수정
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	
	// 게시물 조회수
	public void boardHit(int bno) throws Exception;
}