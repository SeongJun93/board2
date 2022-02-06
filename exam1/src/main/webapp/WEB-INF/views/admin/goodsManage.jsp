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
$('.admin_link').on('keyup',function(){
	if($('#admin').val()){
		
	}
})
function fn_prev(nowPage, nowRange, rangeSize) {
		var nowPage = ((nowRange - 2) * rangeSize) + 1;
		var nowRange = nowRange - 1;
	 	$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/goodsManage").submit();
	}

	function fn_pagingnation(nowPage) {
		$('[name=nowPage]').val(nowPage);
		$('#form').attr('action','/exam/goodsManage').submit();
	}

	function fn_next(nowPage, nowRange, rangeSize) {
		var nowPage = parseInt((nowRange * rangeSize)) + 1;
		var nowRange = parseInt(nowRange) + 1;
		$('[name=nowPage]').val(nowPage);
		$('[name=nowRange]').val(nowRange);
		$('#form').attr('action',"/exam/goodsManage").submit();
	}

	function fn_search() {
		$('#form').attr('action',"/exam/goodsManage").submit();
	}
</script>
<title>goodsManage</title>
</head>
<body>
	<h1>goodsManage</h1>
	<form id="form" method="post">
			<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
	<input type="hidden" name="bookId" value="${book.bookId}"/>
		<input type="hidden" name="nowPage" value="${search.nowPage }"/>
		<input type="hidden" name="nowRange" value="${search.nowRange }"/>
		<input type="hidden" name="rangeSize" value="${search.rangeSize }"/>
		<input type="hidden" name="listSize" value="${search.listSize }"/>
			<table border="2">
				<thead>
					<tr>
						<th>No</th>
						<th>책 제목</th>
						<th>국내/외작가</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${BookList}" var="BookList">
						<tr>
							<td>${BookList.rnum}</td>
							<td>
								<a id="move" href='<c:out value="${BookList.bookId}"/>' data-name='<c:out value="${AuthorList.authorName}"/>'>
									<c:out value="${BookList.bookName}"></c:out>
								</a>
							</td>
							<td>${BookList.authorName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<!-- pagination{s} -->

	<div>
		<ul style="list-style:none;">

			<c:if test="${pagingnation.prev}">
				<li style="float: left;"><a href="javascript:fn_prev('${pagingnation.nowPage}', '${pagingnation.nowRange}', '${pagingnation.rangeSize}');"
				 style="color:black;text-decoration:none">이전</a></li>
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
				<option value="bookName" <c:if test="${search.searchType eq 'title' or empty search.searchType}">checked="true"</c:if>>제목</option>
				<option value="authorName" <c:if test="${search.searchType eq 'author' or empty search.searchType}">checked="true"</c:if>>작가</option>
				<option value="publisher" <c:if test="${search.searchType eq 'publisher' or empty search.searchType}">checked="true"</c:if>>출판사</option>
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