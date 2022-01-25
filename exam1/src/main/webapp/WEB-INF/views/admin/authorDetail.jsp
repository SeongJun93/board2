<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewporf" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/bootstrap.min.css" />"rel=stylesheet>
<title>authorDetail</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<td>작가이름</td>
				<td>${AuthorDetail.authorName}</td>
			</tr>
			<tr>
				<td>작가 국/외</td>
				<td>${AuthorDetail.nationName}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${AuthorDetail.regDate}</td>
			</tr>
			<tr>
				<td>작가 소개</td>
				<td>${AuthorDetail.authorIntro}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>