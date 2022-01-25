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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	//�α���ȭ��
	@RequestMapping(value="/login")
	public String login(UserVO vo,Model model) {	
		model.addAttribute("user", vo);
		System.out.println("�α��� �Է�");
		return "user/login";
	}
	//ȸ������ȭ��
	@RequestMapping(value="/join" ,method=RequestMethod.POST)
	public String join() {	
		System.out.println("ȸ������ �̵�");
		return "user/join";
	}
	
	//ȸ�����Ծ׼�
   @RequestMapping(value="/insertUser",method=RequestMethod.POST)
   public String UserInsert(UserVO vo) throws Exception {
	   String rawPw = "";            // ���ڵ� �� ��й�ȣ
       String encodePw = "";        // ���ڵ� �� ��й�ȣ
       
       rawPw = vo.getPassword();            // ��й�ȣ ������ ����
       encodePw = pwEncoder.encode(rawPw);        // ��й�ȣ ���ڵ�
       vo.setPassword(encodePw);            // ���ڵ��� ��й�ȣ member��ü�� �ٽ� ����
	   System.out.println("ȸ������ �Ϸ�"); 
	   userService.UserInsert(vo);				
	 return "user/login";
   }
 //�α��ξ׼�
   @ResponseBody
   @RequestMapping(value="/loginAction",consumes = "application/json; charset=UTF-8", produces = MediaType.APPLICATION_JSON_VALUE+"; charset=utf-8")
   public Map<String,Object>UserLogin(@RequestBody UserVO vo, HttpSession session) throws Exception {
	   Map<String,Object> resultMap = new HashMap<String,Object>();
		String rawPw = "";
		String encodePw = "";
	   UserVO result=userService.UserId_Login_Chk(vo);
	   if(result != null) {					// ��ġ�ϴ� ���̵� �����
		   rawPw = vo.getPassword();        // ����ڰ� ������ ��й�ȣ
           encodePw = result.getPassword();        // �����ͺ��̽��� ������ ���ڵ��� ��й�ȣ
           if(true == pwEncoder.matches(rawPw, encodePw)) { // ��й�ȣ ��ġ���� �Ǵ�
        	   result.setPassword("");                    // ���ڵ��� ��й�ȣ ���� ����
        	   resultMap.put("resultCode","0000");
    		   session.setAttribute("sessionTime", new Date().toLocaleString());
    		   session.setAttribute("id", result.getId());
    		   session.setAttribute("user", result);
    		   System.out.println("�α��μ���");
           }else {
        	   resultMap.put("resultCode","9999");
        	   System.out.println("�α��ν���");
           }
       }else {
    	   resultMap.put("resultCode","9999");
    	   System.out.println("�α��ν���");
       }   
	 return resultMap;   
   }
   /* �̸��� ���� */
   @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
   @ResponseBody
   public String mailCheckGET(String email) throws Exception{
       /* ������ȣ(����) ���� */
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
       System.out.println(email);
       System.out.println("�̸��� ������ ���� Ȯ��");
       System.out.println(checkNum);
       /* �̸��� ������ */
       String setForm = "eltmzkalfhs2@naver.com";
       String toMail = email;
       String title = "ȸ������ ���� �̸��� �Դϴ�.";
       String content = 
               "Ȩ�������� �湮���ּż� �����մϴ�." +
               "<br><br>" + 
               "���� ��ȣ�� " + checkNum + "�Դϴ�." + 
               "<br>" + 
               "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		
//		  try {
//		  
//		  MimeMessage message = mailSender.createMimeMessage();
//		  MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//		  helper.setFrom(setForm); helper.setTo(toMail); helper.setSubject(title);
//		  helper.setText(content,true); mailSender.send(message);
//		  
//		  }catch(Exception e) { e.printStackTrace(); }
		 
       String num = Integer.toString(checkNum);
       return num;
   }
   @RequestMapping(value="/logout")
   public String logout(UserVO vo,HttpSession session) {
	   System.out.println("�α׾ƿ�");
	   session.invalidate();
	   return "user/login";
   }
} 
