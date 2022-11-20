package com.nordia.member;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nordia.dia.HomeController;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("로그인", locale);	
		return "member/login";
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join(Locale locale) {
		logger.info("회원가입", locale);	
		return "member/join";
	}
}
