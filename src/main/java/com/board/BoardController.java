package com.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.PageVO;

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
		return "redirect:/board";
	}
	
	//페이지 - 게시글 보기
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, HttpServletResponse response,
			Model model,
			@RequestParam int bbsID) {

		BoardDTO boardDTO = new BoardDTO();
		boardDTO = boardSvc.selectBoard(bbsID);
		
		model.addAttribute("boardDTO", boardDTO);
		return "board/view";
	}
	
	//페이지 - 게시글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, HttpServletResponse response,
			Model model,
			@RequestParam int bbsID) {

		BoardDTO boardDTO = new BoardDTO();
		boardDTO = boardSvc.selectBoard(bbsID);
		
		model.addAttribute("boardDTO", boardDTO);
		return "board/update";
	}
		
	//게시글 수정
	@RequestMapping(value = "/updateAct", method = RequestMethod.POST)
	public String updateAct(HttpServletRequest request, HttpServletResponse response,
			BoardDTO boardDTO) {
		
		boardSvc.updateBoard(boardDTO);
				
		return "redirect:/board";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/deleteAct", method = RequestMethod.GET)
	public String deleteAct(HttpServletRequest request, HttpServletResponse response,
			@RequestParam int bbsID) {
		String userID = (String) request.getSession().getAttribute("userID");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bbsID", bbsID);
		map.put("userID", userID);
		boardSvc.deleteBoard(map);
				
		return "redirect:/board";
	}
	
	//페이지 - 게시판
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(HttpServletRequest request, HttpServletResponse response,
			Model model,
			@RequestParam(defaultValue = "1") int nowPage) {
						
		int pageSize = 10;
		int pageBlock = 10;
		
		PageVO pageVO = new PageVO();
		pageVO.setPageSize(pageSize);
		pageVO.setPageBlock(pageBlock);		
		pageVO.rowCalculate(nowPage);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", pageSize);
		map.put("offset", pageVO.getStartRow());
		
		List<BoardDTO> boardList=boardSvc.selectBoardList(map);		
		
		int count = boardSvc.selectBoardCount();				
		pageVO.pageCalculate(count);
			
		model.addAttribute("boardList",boardList);
		model.addAttribute("pageVO", pageVO);
						
		return "board/board";
	}
	

}
