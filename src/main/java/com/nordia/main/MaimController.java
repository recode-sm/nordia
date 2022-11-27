package com.nordia.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nordia.dia.HomeController;

@Controller
public class MaimController {

	@Autowired
//	MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//페이지 - 회원가입
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String join(Locale locale) {
		//logger.info("회원가입", locale);
		return "main/main";
	}
	
//	//회원가입
//	@RequestMapping(value = "/joinAct", method = RequestMethod.POST)
//	public String joinAct(Locale locale, HttpServletRequest request, HttpServletResponse response,
//			@RequestParam String user_id,
//			@RequestParam String passwd1,
//			@RequestParam String email,
//			@RequestParam(defaultValue="") String tel,
//			@RequestParam String letter) {
//		//logger.info("회원가입", locale);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
//		map.put("user_pw", passwd1);
//		map.put("email", email);
//		map.put("tel", tel);
//		map.put("letter", letter);
//		
//		memberService.insertMember(map);
//		return "redirect:/login";
//	}
//	
//	//아이디 중복체크
//	@RequestMapping(value = "/findId", method = RequestMethod.POST)
//	public void findId(Locale locale, HttpServletRequest request, HttpServletResponse response,
//			@RequestParam String user_id) {
//		//logger.info("아이디 중복체크", locale);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
//
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO = memberService.selectMemberCheck(map);
//		
//		String result = "";
//		if (memberDTO != null) {			
//			result = "Y";
//		}else {
//			result = "N";
//		}
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html; charset=UTF-8");
//			response.getWriter().println(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}	
//	
//	//페이지 - 로그인
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login(Locale locale) {		
//		//logger.info("로그인", locale);
//		return "member/login";
//	}
//	
//	//로그인
//	@RequestMapping(value = "/loginAct", method = RequestMethod.POST)
//	public String loginAct(Locale locale, HttpServletRequest request, HttpServletResponse response, HttpSession session,
//			@RequestParam String user_id,
//			@RequestParam String user_pw) {
//		//logger.info("로그인", locale);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
//		map.put("user_pw", user_pw);
//				
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO = memberService.selectMember(map);
//		
//		if (memberDTO != null) {
//			session.setAttribute("user_id", user_id);
//			return "redirect:/";
//		}else {
//			return "member/msg";
//		}
//	}

}
