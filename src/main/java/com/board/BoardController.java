package com.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.MemberDTO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardSvc;
	
	//페이지 - 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response) {
		return "board/write";
	}
	
	//게시글 작성
	@RequestMapping(value = "/writeAct", method = RequestMethod.POST)
	public String joinAct(HttpServletRequest request, HttpServletResponse response,
			BoardDTO boardDTO) {
		String userID = (String)request.getSession().getAttribute("userID");
		int bbsMaxNum = boardSvc.selectBoardMaxNum();
		boardDTO.setBbsID(bbsMaxNum);
		boardDTO.setUserID(userID);
		boardSvc.insertBoard(boardDTO);
		return "redirect:/write";
	}
	
	//게시글 보기
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, HttpServletResponse response,
			Model model,
			@RequestParam int bbsID) {

		BoardDTO boardDTO = new BoardDTO();
		boardDTO = boardSvc.selectBoard(bbsID);
		
		model.addAttribute("boardDTO", boardDTO);
		return "board/view";
	}
	
	//페이지 - 게시판
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int pageNumber) {
		return "board/board";
	}
	

}
