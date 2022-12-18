package com.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberSvc;
	
	//페이지 - 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response) {
		return "member/join";
	}
	
	//회원가입
	@RequestMapping(value = "/joinAct", method = RequestMethod.POST)
	public String joinAct(HttpServletRequest request, HttpServletResponse response,
			MemberDTO memberDTO) {		
		memberSvc.insertMember(memberDTO);
		return "redirect:/login";
	}
	
	//페이지 - 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "member/login";
	}
	
	//로그인
	@RequestMapping(value = "/loginAct", method = RequestMethod.POST)
	public String loginAct(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,
			@RequestParam String userID,
			@RequestParam String userPassword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("userID", userID);
	    map.put("userPassword", userPassword);
	    MemberDTO member = memberSvc.selectMemberLogin(map);
	    
	    if (member != null) {
	    	session.setAttribute("userID", userID);
	    	return "redirect:/main";
		}else {
			return "redirect:/login";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logoutAct", method = RequestMethod.GET)
	public String logoutAct(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {		
		session.invalidate();
		return "redirect:/main";
	}
	
	//페이지 - 메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "main/main";
	}
}
