package com.company.Controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.Domain.UserVO;
import com.company.Service.UserService;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	//로그인화면
	@RequestMapping(value="/login")
	public String login() {	
		System.out.println("로그인 입력");
		return "user/login";
	}
	//회원가입화면
	@RequestMapping(value="/join" ,method=RequestMethod.POST)
	public String join() {	
		System.out.println("회원가입 이동");
		return "user/join";
	}
	
	//회원가입액션
   @RequestMapping(value="/insertUser",method=RequestMethod.POST)
   public String UserInsert(UserVO vo) throws Exception {
	   System.out.println("회원가입 완료");
	 try {
	 	 userService.UserInsert(vo);				
	 }catch(Exception e){
		 throw new RuntimeException();
	 }
	 return "user/login";
   }
   //로그인액션
   @ResponseBody
   @RequestMapping(value="/loginAction",consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
   public Map<String,Object>UserLogin(@RequestBody UserVO vo, HttpSession session) throws Exception {
	   Map<String,Object> resultMap = new HashMap<String,Object>();
	   UserVO result=userService.UserId_Login_Chk(vo);
	   if(result == null||result.getId()==null) {
		   resultMap.put("resultCode","9999");
		   System.out.println("로그인실패");
	   }else {
		   resultMap.put("resultCode","0000");
		   session.setAttribute("sessionTime", new Date().toLocaleString());
		   session.setAttribute("id", result.getId());
		   System.out.println("로그인성공");
	   }
	 return resultMap;   
   }
   /* 이메일 인증 */
   @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
   @ResponseBody
   public String mailCheckGET(String email) throws Exception{
       /* 인증번호(난수) 생성 */
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
       System.out.println(email);
       System.out.println("이메일 데이터 전송 확인");
       System.out.println(checkNum);
       /* 이메일 보내기 */
       String setForm = "eltmzkalfhs2@naver.com";
       String toMail = email;
       String title = "회원가입 인증 이메일 입니다.";
       String content = 
               "홈페이지를 방문해주셔서 감사합니다." +
               "<br><br>" + 
               "인증 번호는 " + checkNum + "입니다." + 
               "<br>" + 
               "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		/*
		 * try {
		 * 
		 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 * helper = new MimeMessageHelper(message, true, "utf-8");
		 * helper.setFrom(setForm); helper.setTo(toMail); helper.setSubject(title);
		 * helper.setText(content,true); mailSender.send(message);
		 * 
		 * }catch(Exception e) { e.printStackTrace(); }
		 */
       String num = Integer.toString(checkNum);
       return num;
   }
   @RequestMapping(value="/logout")
   public String logout(UserVO vo,HttpSession session) {
	   System.out.println("로그아웃");
	   session.invalidate();
	   return "user/login";
   }
} 
