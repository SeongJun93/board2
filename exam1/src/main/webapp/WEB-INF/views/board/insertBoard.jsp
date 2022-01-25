<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<title>Insert Board</title>
<script type="text/javascript">
function go_board() {
	$("#form").attr("action","/exam/board").submit();
}
function fn_validate(){
	if ($("[name=board_title]").val() == "") {
		alert("제목을 입력하세요.");
		$("[name=board_title]").focus();
		return false;
	}
	if ($("[name=board_pw]").val() == "") {
		alert("비밀번호 입력하세요.");
		$("[name=board_pw]").focus();
		return false;
	}	
	if ($("[name=board_content]").val() == "") {
		alert("내용을 입력하세요.");
		$("[name=board_content]").focus();
		return false;
	}
	return true;
}
function fn_InsertMember() {
	var param = {
			board_title:$('[name=board_title]').val(),
			reg_id:$('[name=reg_id]').val(),
			board_pw:$('[name=board_pw]').val(),
			board_content:$('[name=board_content]').val()
		}
		
		var isOk = fn_validate();
		
		if(isOk){
			$.ajax({
				url : "/exam/insertBoard",
				type : "post",
				data : JSON.stringify(param),
				contentType : "application/json; charset=utf-8",
				success : function(data){
					alert('게시글 등록이 완료되었습니다.');
					$('#form').attr('action','/exam/board').submit();
				}
			})
		}
	}

</script>
</head>
<body>
	<form action="" id="form" method="post">
		<input type="hidden" name="board_seq" value="${examboard.board_seq }"/>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="board_title" name="board_title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input disabled="disabled" type="text" id="reg_id" name="reg_id" value="${user.id}"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" id="board_pw" name="board_pw"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" id="board_content" name="board_content"></td>
			</tr>
		</table>
		<a href="javascript:fn_InsertMember();"><input type="button" value="write"></a>
		<button type="submit" onclick="go_board();">cancle</button>
	</form>
</body>
</html>