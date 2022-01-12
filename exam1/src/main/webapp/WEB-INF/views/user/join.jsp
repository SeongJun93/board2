<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Join</title>
<script type="text/javaScript">
$( document ).ready(function() {
	//공백방지
	$('#submit_Button').on("click",function(){
		if(document.getElementById('id').value==""){
			alert("id를 입력하세요")
			return ;
		}else if(document.getElementById('password').value==""){
			alert("password를 입력하세요")
			return ;
		}else if(document.getElementById('password_re').value==""){
			alert("password 체크를 해주세요")
			return ;
		}else if(document.getElementById('name').value==""){
			alert("이름를 입력하세요")
			return ;
		}else if(document.getElementById('pnum').value==""){
			alert("핸드폰번호를 입력하세요")
			return ;
		}else if(document.getElementById('email').value==""){
			alert("이메일를 입력하세요")
			return ;
		}else if(document.getElementById('email_chk').value==""){
			alert("이메일 인증을 입력하세요")
			return ;
		}else{
			alert("회원가입이 완료 되었습니다.")
			$("#regForm").attr("action","/exam/insertUser").attr("method","post").submit();
		}
	})
	/* 인증번호 이메일 전송 */
	$("#mail_check_button").on("click", function() {
    	var email = $("#email").val();
    	$.ajax({
            type:"GET",
            url:"mailCheck?email=" + email,
    		success:function(data){
    			code=data;	
    		}
        });
	});
	var code='';
	//입력결과 비교
	$("#email_chk").on("keyup",function(){
		var inputCode=$("#email_chk").val;
		var checkResult=$("#email_chk_css");
		if(inputCode == code){
			checkResult.html("인증번호가 일치합니다");
			checkResult.css('color', 'green');
			$('#submit_Button').attr("disabled",false);
		}else{
			checkResult.html("인증번호를 다시 확인해주세요");
			checkResult.css('color', 'red');
			$('#submit_Button').attr("disabled",true);
		}
	});
	
});
	function fn_cancle(){
		location.href="/exam/login"
	};
</script>
</head>
<body>
	<form id="regForm" method="post">
		<table>
			<tr>
				<td>id:</td><td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>pw:</td><td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>pwre:</td><td><input type="password" name="password_re" id="password_re"></td>
			</tr>
			<tr>
				<td>name:</td><td><input type="text" name="name" id="name" id="name"></td>
			</tr>
			<tr>
				<td>pnum:</td><td><input type="text" name="pnum" id="pnum"></td>
			</tr>
			<tr>
				<td>email:</td><td><input type="text" name="email" id="email"></td>
				<td><button type="button" id="mail_check_button">인증번호전송</button></td>
			</tr>
			<tr>
				<td>인증번호:</td><td><input type="text" name="email_chk" id="email_chk"></td>
				<td><div id="email_chk_css"></div></td>
			</tr>
		</table>
	<button type="submit" id="submit_Button" >join</button>
	<button type="button" onClick="fn_cancle();">cancle</button> 
	</form>
</body>
</html>