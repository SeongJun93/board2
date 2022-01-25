package com.company.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.Domain.AuthorVO;
import com.company.Domain.BookVO;
import com.company.Domain.CateVO;
import com.company.Domain.SearchVO;
import com.company.Service.AuthorService;
import com.company.Service.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {
	
	@Autowired
	private AuthorService authorService;
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/adminPage",method=RequestMethod.POST)
	public String adminPage() {
		System.out.println("관리자페이지");
		return "admin/admin";
	}
	@RequestMapping(value="/goodsManage",method=RequestMethod.POST)
	public String goodsManage() {
		return "admin/goodsManage";
	}
	@RequestMapping(value="/goodsInsert",method=RequestMethod.POST)
	public String goodsInsert(CateVO cate) {
		authorService.getCateList(cate);
		return "admin/insertGoods";
	}
	@RequestMapping(value="/authorInsertPage",method=RequestMethod.POST)
	public String authorInsertPage() {
		return "admin/insertAuthor";
	}
	@RequestMapping(value="/authorPOP",method=RequestMethod.POST)
	public String authorPOP(SearchVO search,Model model)throws Exception {
		int listCnt = authorService.getAuthorListCnt(search);
		search.setListSize(5);
		search.pageInfo(search.getNowPage(), search.getNowRange(), listCnt);
		model.addAttribute("pagingnation",search);
		model.addAttribute("AuthorList",authorService.getAuthorList(search));
		model.addAttribute("search",search);
		return "admin/AuthorPOP";
	}
	@ResponseBody
	@RequestMapping(value="/authorInsert",consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
	public Map<String,Object> authorInsert(@RequestBody AuthorVO author) {
		Map<String,Object> resultMap = new HashMap<>();
		authorService.insertAuthor(author);
		System.out.println("작가등록완료");
		return resultMap;
	}
	@RequestMapping(value="/authorManage",method=RequestMethod.POST)
	public String authorManage(SearchVO search,Model model,AuthorVO author) {
		int listCnt = authorService.getAuthorListCnt(search);
		search.pageInfo(search.getNowPage(),search.getNowRange(),listCnt);
		model.addAttribute("pagingnation",search);
		model.addAttribute("AuthorList",authorService.getAuthorList(search));
		model.addAttribute("search",search);
		model.addAttribute("author",author);
		System.out.println("작가 리스트 페이지");
		return "admin/authorManage";
	}
	@RequestMapping(value="/authorDetail",method=RequestMethod.POST)
	public String authorDetail(AuthorVO author,Model model) {
		model.addAttribute("AuthorDetail",authorService.authorDetail(author));
		return "admin/authorDetail";
	}
	@RequestMapping(value="/memberManage",method=RequestMethod.POST)
	public String goodsList() {
		return "admin/memberManage";
	}
	@RequestMapping(value="/authorDelete",method=RequestMethod.POST)
	public String authorDelite() {
		return "admin/admin";
	}
	@RequestMapping(value="/bookInsert",method=RequestMethod.POST)
	public String bookInsert(BookVO book) {
		bookService.insertBook(book);
		return "admin/admin";
	}
}
