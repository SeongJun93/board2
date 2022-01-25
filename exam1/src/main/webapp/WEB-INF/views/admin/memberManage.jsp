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
</script>
<title>memberManage</title>
</head>
<body>
	<h1>memberManage</h1>
	<form id="form" method="post">
			<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
	</form>
</body>
</html>