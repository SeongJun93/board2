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
<script type="text/javascript">
function go_board() {
	$("#form").attr("action","/exam/board").submit();
}
</script>
<title>get board</title>
</head>
<body>
	<h1>게시판 상세조회</h1>
	<form id="form" method="POST">
				<input type="hidden" name="board_seq" value="${examboard.board_seq }"/>
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${getBoard.board_title}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${getBoard.board_dt}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${getBoard.reg_id}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${getBoard.board_content}</td>
				</tr>
				<tr>
					<td><button type="submit" onclick="go_board();">뒤로가기</button></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>