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
function fn_goDetail(authorId){
	$("[name=authorId]").val(authorId)
	$("#form").attr("action","/exam/authorDetail").submit();
}
//이전 버튼 이벤트
//5개의 인자값을 가지고 이동 board/index 이동
//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(nowPage, nowRange, rangeSize) {
		var nowPage = ((nowRange - 2) * rangeSize) + 1;
		var nowRange = nowRange - 1;
	 	$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/authorManage").submit();
	}
//페이지 번호 클릭
	function fn_pagingnation(nowPage) {
		$('[name=nowPage]').val(nowPage);
		$('#form').attr('action','/exam/authorManage').submit();
	}
	//다음 버튼 이벤트
	//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(nowPage, nowRange, rangeSize) {
		var nowPage = parseInt((nowRange * rangeSize)) + 1;
		var nowRange = parseInt(nowRange) + 1;
		$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/authorManage").submit();
	}


/*e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
	// 검색
	// 검색

	function fn_search() {
		$('#form').attr('action',"/exam/authorManage").submit();
	}
</script>
<title>authorManage</title>
</head>
<body>
	<h1>authorManage</h1>
	<form id="form" method="post">
		<input type="hidden" name="authorId" value="${author.authorId}"/>
		<input type="hidden" name="nowPage" value="${search.nowPage }"/>
		<input type="hidden" name="nowRange" value="${search.nowRange }"/>
		<input type="hidden" name="rangeSize" value="${search.rangeSize }"/>
		<input type="hidden" name="listSize" value="${search.listSize }"/>
		<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
			<table border="2">
				<thead>
					<tr>
						<th>No</th>
						<th>작가이름</th>
						<th>내/외작가</th>
						<th>작가소개</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${AuthorList}" var="AuthorList">
							<tr onclick="fn_goDetail('${AuthorList.authorId}')">
							
								<td>${AuthorList.rnum}</td>
								<td>${AuthorList.authorName}</td>
								<td>${AuthorList.nationName}</td>
								<td>${AuthorList.authorIntro}</td>
								<td>${AuthorList.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<!-- pagination{s} -->
	<div>
		<ul style="list-style:none;">

			<c:if test="${pagingnation.prev}">
				<li style="float: left;"><a href="javascript:fn_prev('${pagingnation.nowPage}', '${pagingnation.nowRange}', '${pagingnation.rangeSize}');" style="
	 	  		color:black;text-decoration:none">이전</a></li>
			</c:if>

			<c:forEach begin="${pagingnation.startPage}"
				end="${pagingnation.endPage}" var="pageNum">

				<li style="float: left;"
					class="page-item <c:out value="${pagingnation.nowPage == pageNum ? 'active' : ''}"/> "><a
					class="page-link" href="javascript:fn_pagingnation('${pageNum}');" style="color:black;text-decoration:none">
						${pageNum} </a></li>
			</c:forEach>

			<c:if test="${pagingnation.next}">

				<li><a href="javascript:fn_next('${pagingnation.nowRange}', '${pagingnation.nowRange}', '${pagingnation.rangeSize}');" style="
	 	  		color:black;text-decoration:none">다음></a></li>
			</c:if>
		</ul>
	</div>
	<!-- search{s} -->
	<div>
		<div>
			<select name="searchType"
				id="searchType">
				<option value="authorName" <c:if test="${search.searchType eq 'authorName' or empty search.searchType}">checked="true"</c:if>>작가</option>
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