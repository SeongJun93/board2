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
function fn_adminPage(){
	$('#form').attr('action',"/exam/adminPage").submit();
}
function fn_go_shop(){
	$('#form').attr('action',"/exam/book").submit();
}
function fn_goDetail(board_seq) {
	$('[name=board_seq]').val(board_seq);
	$('#form').attr('action','/exam/getBoard').submit();
}
//이전 버튼 이벤트
//5개의 인자값을 가지고 이동 board/index 이동
//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(nowPage, nowRange, rangeSize) {
		var nowPage = ((nowRange - 2) * rangeSize) + 1;
		var nowRange = nowRange - 1;
	 	$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/board").submit();
	}
//페이지 번호 클릭
	function fn_pagination(nowPage) {
		$('[name=nowPage]').val(nowPage);
		$('#form').attr('action','/exam/board').submit();
	}
	//다음 버튼 이벤트
	//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(nowPage, nowRange, rangeSize) {
		var nowPage = parseInt((nowRange * rangeSize)) + 1;
		var nowRange = parseInt(nowRange) + 1;
		$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/board").submit();
	}


/*e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
	// 검색
	// 검색

	function fn_search() {
		$('#form').attr('action',"/exam/board").submit();
	}
$(document).ready(function(){
	var result = '${result}';
		if (result == 'deleteOK') {
		alert("삭제가 완료되었습니다.");
	}
})
</script>
<title>Board</title>
</head>
<body>
<h1>게시판목록</h1>
	<form action="exam/board" id="form" method="post">
		<button type="submit" id="logout" onclick="fn_logout();">logout</button>
		<button type="submit" id="insertBoard" onclick="fn_insertBoard();">write</button>
		<button type="submit" id="go_shop" onclick="fn_go_shop();">shop</button>
		<c:if test="${user.adminck==1}">
		<button type="submit" id="adminPage" onclick="fn_adminPage();">admin page</button>
		</c:if>
		<input type="hidden" name="nowPage" value="${search.nowPage }"/>
		<input type="hidden" name="nowRange" value="${search.nowRange }"/>
		<input type="hidden" name="rangeSize" value="${search.rangeSize }"/>
		<input type="hidden" name="listSize" value="${search.listSize }"/>
			<table border="2">
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
		<!-- pagination{s} -->

	<div>
		<ul style="list-style:none;">

			<c:if test="${pagination.prev}">
				<li style="float: left;"><a href="javascript:fn_prev('${pagination.nowPage}', '${pagination.nowRange}', '${pagination.rangeSize}');" style="
	 	  		color:black;text-decoration:none">이전</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="pageNum">

				<li style="float: left;"
					class="page-item <c:out value="${pagination.nowPage == pageNum ? 'active' : ''}"/> "><a
					class="page-link" href="javascript:fn_pagination('${pageNum}');" style="color:black;text-decoration:none">
						${pageNum} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">

				<li><a href="javascript:fn_next('${pagination.nowRange}', '${pagination.nowRange}', '${pagination.rangeSize}');" style="
	 	  		color:black;text-decoration:none">다음></a></li>
			</c:if>
		</ul>
	</div>
	<!-- search{s} -->
	<div>
		<div>
			<select name="searchType"
				id="searchType">
				<option value="title" <c:if test="${search.searchType eq 'title' or empty search.searchType}">checked="true"</c:if>>제목</option>
				<option value="content" <c:if test="${search.searchType eq 'content'}">checked="true"</c:if>>본문</option>
				<option value="reg_id" <c:if test="${search.searchType eq 'reg_id'}">checked="true"</c:if>>작성자</option>
			</select>
		</div>
		<div>
			<input type="text"
				value="${search.keyword}" name="keyword" id="keyword">
		</div>
		<div>
<!-- 			<button class="btn btn-sm btn-primary" name="btnSearch" -->
<!-- 				id="btnSearch">검색</button> -->
	 	  	<a href="javascript:fn_search();" style="
	 	  		color:black;text-decoration:none">검색</a>
		</div>
	</div>
	<!-- search{e} -->
	</form>
</body>
</html>