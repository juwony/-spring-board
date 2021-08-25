package com.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.test.mappers.reply";
	
	// 댓글 조회
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".replyList", bno);
	}
	
	// 댓글 작성
	@Override
	public void write(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".replyWrite", vo);
		sql.update(namespace + ".replyCnt", vo);
	}

	// 댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".updateReply", vo);
	}
	
	// 댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteReply", vo);
		sql.update(namespace + ".replyCnt", vo);
	}
	
	// 특정 댓글 조회
	@Override
	public ReplyVO readReplySelect(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".readReplySelect", rno);
	}

}
