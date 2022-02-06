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
<title>admin</title>
<style type="text/css">
.admin_link{
	color:black;
	text-decoration:none;
}
</style>
<script type="text/javascript">
function go_board() {
	$("#form").attr("action","/exam/board").submit();
}
function fn_insertGoods() {
	$("#form").attr("action","/exam/goodsInsert").submit();
}
function fn_goodsManage() {
	$("#form").attr("action","/exam/goodsManage").submit();
}
function fn_insertAuthor() {
	$("#form").attr("action","/exam/authorInsertPage").submit();
}
function fn_authorManage() {
	$("#form").attr("action","/exam/authorManage").submit();
}
function fn_memberManage() {
	$("#form").attr("action","/exam/memberManage").submit();
}	
</script>
</head>
<body>
	<h1>Hello Admin</h1>
	<form id="form" method="post">
		<button type="submit" onclick="go_board();" class="admin_link">back</button>
		<ul style="list-style:none;">
			<li>
				<a href="javascript:fn_insertGoods();" class="admin_link">goods insert</a>
			</li>
			<li>
				<a href="javascript:fn_goodsManage();" class="admin_link">goods manage</a>
			</li>
			<li>
				<a href="javascript:fn_insertAuthor();" class="admin_link"> author insert</a>
			</li>
			<li>
				<a href="javascript:fn_authorManage();" class="admin_link">author manage</a>
			</li>
			<li>
				<a href="javascript:fn_memberManage();" class="admin_link">member manage</a>
			</li>
		</ul>
	</form>
</body>
</html>