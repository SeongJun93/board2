<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javaScript">
function goJoin(){
    $('[name=regForm]').attr('action','/exam/join').submit();
}
function fn_validate(){
	if ($("[name=id]").val() == "") {
		alert("id를 입력하세요.");
		$("[name=id]").focus();
		return false;
	}
	if ($("[name=password]").val() == "") {
		alert("비밀번호 입력하세요.");
		$("[name=password]").focus();
		return false;
	}	
	return true;
}
function fn_login(){
	var param = {
		id:$('[name=id]').val(),
		password:$('[name=password]').val()
	}
	var isOk = fn_validate();
	
	if(isOk){$.ajax({
		url : "/exam/loginAction",
		type : "post",
		data : JSON.stringify(param),
		contentType : "application/json; charset=utf-8",
		success : function(data){
			if(data.resultCode == '0000'){
				$('[name=regForm]').attr('action','/exam/board').submit();
			}else if(data.resultCode == '9999'){
				alert("계정 정보가 일치하지 않습니다.");
			}
			}
		})
	}
}
/* 	$('#regForm').attr('action','/exam/loginAction').submit(); */
</script>
<title>Login</title>
</head>
<body>
<h1>
	login
</h1>
<form id="regForm" method="post" name="regForm">
ID:<input type="text" name="id" id="id"/><br>
PW:<input type="password" name="password" id="password"/><br>
<a href="javascript:fn_login();"><input type="button" value="login"></a>
<button type = "submit" onclick="goJoin();" id="joinButton">join</button>
</form> 
</body>
</html>
