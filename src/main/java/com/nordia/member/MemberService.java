package com.nordia.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public void insertMember(Map<String, Object> map) {
		sqlSession.insert("insertMember", map);
	}
	
	//아이디 중복체크
	public MemberDTO selectMemberCheck(Map<String, Object> map) {
		return sqlSession.selectOne("selectMemberCheck", map);
	}
	
	//등록 회원 조회
	public MemberDTO selectMember(Map<String, Object> map) {
		return sqlSession.selectOne("selectMember", map);
		
	}

	

}
