package com.company.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.Domain.BoardVO;
import com.company.Domain.UserVO;
import com.company.Service.BoardService;
import com.company.Service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	/*
	 * @RequestMapping(value="/board", method=RequestMethod.POST) public String
	 * BoardPage(BoardVO vo) { return "board/board"; }
	 */
	//�Խ���ȭ��
	@RequestMapping(value="/board",method=RequestMethod.POST)
	public String boardPage(BoardVO vo, Model model) throws Exception {
		model.addAttribute("boardList",boardService.getBoardList());
		System.out.println("�Խ����̵�");
		return "board/board";
	}
	
	@RequestMapping(value="/insertBoardPage",method=RequestMethod.POST)
	public String insertBoardPage(BoardVO vo,UserVO vo2,Model model,HttpSession session) {
		vo.setId(String.valueOf(session.getAttribute("id")));
		UserVO result = userService.getUser(vo);
		model.addAttribute("user",result);
		System.out.println("�Խñ� �ۼ�������");
		return "board/insertBoard";
	}
	@ResponseBody
	@RequestMapping(value="/insertBoard", consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
	public Map<String,Object >insertBoard(@RequestBody BoardVO vo,HttpSession session ,Model model) {
		Map<String,Object> resultMap=new HashMap<>();
		boardService.insertBoard(vo);
		resultMap.put("resultCode","0000");
		System.out.println("�Խñ� �ۼ��Ϸ�");
		return resultMap;
	}
	@RequestMapping(value="/getBoard", method = RequestMethod.POST)
	public String getBoard(BoardVO vo,Model model,UserVO vo2) {
		model.addAttribute("getBoard", boardService.getBoard(vo));
		System.out.println("�Խ��� ��");
		return "board/getBoard";
	}
}
 