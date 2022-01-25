<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script type="text/javascript">
function go_adminPage() {
	$("#form").attr("action","/exam/adminPage").submit();
}
function fn_validate(){
	if ($("[name=authorName]").val() == "") {
		alert("작가 이름을 입력하세요.");
		$("[name=authorName]").focus();
		return false;
	}
	if ($("[name=board_pw]").val() == "") {
		alert("비밀번호 입력하세요.");
		$("[name=board_pw]").focus();
		return false;
	}	
	if ($("[name=authorIntro]").val() == "") {
		alert("작가 소개를 입력하세요.");
		$("[name=authorIntro]").focus();
		return false;
	}
	return true;
}
function fn_InsertAuthor(){
	var param = {
			authorName:$('[name=authorName]').val(),
			nationId:$('[name=nationId]').val(),
			authorIntro:$('[name=authorIntro]').val()
	}
	
	var isOk = fn_validate();
	if(isOk){
		$.ajax({
			url:'/exam/authorInsert',
			type:"post",
			data:JSON.stringify(param),
			contentType:"application/json; charset=utf-8",
			success:function(data){
				alert('작가등록이 완료되었습니다.')
				$('#form').attr('action','/exam/adminPage').submit();
			}
		})
	}
}
</script>
<title>insertAuthor</title>
</head>
<body>
	<h1>insertAuthor</h1>
	<form id="form" method="post">
	작가이름:<input type="text" name="authorName"><br>
	국가선택:<select name="nationId">
		<option value="none" selected>선택</option>
		<option value="01">국내</option>
		<option value="02">국외</option>
	</select><br>
	작가소개:<input type="text" name="authorIntro"><br>
			<a href="javascript:fn_InsertAuthor();" class="admin_link"><input type="button" value="insertAuthor"></a>
			<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
	</form>
</body>
</html>