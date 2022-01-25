package com.company.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.company.Domain.BoardVO;
import com.company.Domain.SearchVO;
import com.company.Domain.UserVO;
import com.company.Service.BoardService;
import com.company.Service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/board",method=RequestMethod.POST)
	public String boardPage(SearchVO vo, Model model,UserVO user) throws Exception {
		int listCnt = boardService.getBoardListCnt(vo);	
		vo.pageInfo(vo.getNowPage(), vo.getNowRange(), listCnt);
		model.addAttribute("pagination", vo);
		model.addAttribute("boardList",boardService.getBoardList(vo));
		model.addAttribute("search", vo);
		System.out.println("게시판이동");
		return "board/board";
	}
	
	@RequestMapping(value="/insertBoardPage",method=RequestMethod.POST)
	public String insertBoardPage(BoardVO vo,UserVO vo2,Model model,HttpSession session) {
		vo.setId(String.valueOf(session.getAttribute("id")));
		UserVO result = userService.getUser(vo);
		model.addAttribute("user",result);
		System.out.println("게시글 작성페이지");
		return "board/insertBoard";
	}
	@ResponseBody
	@RequestMapping(value="/insertBoard", consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
	public Map<String,Object >insertBoard(@RequestBody BoardVO vo,HttpSession session ,Model model) {
		Map<String,Object> resultMap=new HashMap<>();
		boardService.insertBoard(vo);
		resultMap.put("resultCode","0000");
		System.out.println("게시글 작성완료");
		return resultMap;
	}
	@RequestMapping(value="/getBoard", method = RequestMethod.POST)
	public String getBoard(BoardVO vo,Model model,UserVO vo2,SearchVO search) {
		model.addAttribute("getBoard", boardService.getBoard(vo));
		model.addAttribute("search", search);
		System.out.println("게시판 상세");
		return "board/getBoard";
	}
	@RequestMapping(value="/deleteBoard",method = RequestMethod.POST)
		public String deleteBoard(BoardVO vo,Model model,RedirectAttributes redirectAttributes) {
			boardService.deleteBoard(vo);
			redirectAttributes.addFlashAttribute("result","deleteOK");
			System.out.println("게시판 삭제");
			return "redirect:/board";
		}
	@RequestMapping(value="/updateBoardView",method = RequestMethod.POST)
	public String updateBoard(BoardVO vo,Model model,SearchVO search) {
		System.out.println("게시판 업데이트 페이지");
		BoardVO result = boardService.getBoard(vo);
		model.addAttribute("examboard",result);
		System.out.println("게시글 정보 불러오기");
		return "board/updateBoardView";
	}
	@ResponseBody
	@RequestMapping(value="/updateBoard",consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
	public Map<String,Object> updateBoard(@RequestBody BoardVO vo,HttpSession session){
		Map<String,Object> resultMap = new HashMap<>();
		System.out.println("게시판수정");
		boardService.updateBoard(vo);
		resultMap.put("resultCode","0000");
		System.out.println("게시판수정완료");
		return resultMap;
	}
}

 