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
<title>update board</title>
<script type="text/javascript">
function go_board() {
	$("#form").attr("action","/exam/board").submit();
}
function fn_UpdateBoard(){
	var param = {
			board_title:$('[name=board_title]').val(),
			board_content:$('[name=board_content]').val(),
			board_seq:$('[name=board_seq]').val()
	}
	$.ajax({
		url:"/exam/updateBoard",
		type:"post",
		data:JSON.stringify(param),
		contentType:"application/json; charset=utf-8",
		success:function(data){
			alert("변경이 완료되었습니다.");
			$('#form').attr('action','/exam/getBoard').submit();
		}
	})
}
</script>
</head>
<body>
	<form action="" id="form" method="post">
		<input type="hidden" name="board_seq" value="${examboard.board_seq }"/>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="board_title" name="board_title" value="${examboard.board_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" id="board_content" name="board_content" value="${examboard.board_content}"></td>
			</tr>
		</table>
		<a href="javascript:fn_UpdateBoard();"><input type="button" value="update"></a>
		<button type="submit" onclick="go_board();">cancle</button>
	</form>
</body>
</html>