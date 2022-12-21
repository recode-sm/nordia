package com.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	//게시글 순번 마지막 번호 조회
	public int selectBoardMaxNum() {
		return session.selectOne("selectBoardMaxNum");
	}
	
	//게시글 작성
	public void insertBoard(BoardDTO boardDTO) {
		session.insert("insertBoard", boardDTO);
	}
	
	//게시글 보기
	public BoardDTO selectBoard(int boardID) {
		return session.selectOne("selectBoard", boardID);
	}
	
	//게시글 수정
	public void updateBoard(BoardDTO boardDTO) {
		session.update("updateBoard", boardDTO);		
	}

}
