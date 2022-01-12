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
function fn_logout(){
	$('#form').attr('action',"/exam/logout").submit();
}
function fn_insertBoard(){
	$('#form').attr('action',"/exam/insertBoardPage").submit();
}
function fn_goDetail(board_seq) {
	$('[name=board_seq]').val(board_seq);
	$('#form').attr('action','/exam/getBoard').submit();
}
</script>
<title>Board</title>
</head>
<body>
<h1>게시판목록</h1>
	<form id="form" method="post">
		<button type="submit" id="logout" onclick="fn_logout();">logout</button>
		<button type="submit" id="insertBoard" onclick="fn_insertBoard();">write</button>
			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="examboard">
							<tr onclick="fn_goDetail('${examboard.board_seq}')">
								<td>${examboard.rnum}</td>
								<td>${examboard.board_title}</td>
								<td>${examboard.reg_id}</td>
								<td>${examboard.board_dt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" name="board_seq" value="${examboard.board_seq }"/>
	</form>
</body>
</html>