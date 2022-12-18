package com.member;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private SqlSessionTemplate session;

	//회원가입
	public void insertMember(MemberDTO memberDTO) {
		session.insert("insertMember", memberDTO);
	}
	
	//로그인
	public MemberDTO selectMemberLogin(Map<String, Object> map) {
		return session.selectOne("selectMemberLogin", map);
	}

}
