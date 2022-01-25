<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	/* 책 소개 */
	ClassicEditor
		.create(document.querySelector('#bookIntro'))
		.catch(error=>{
			console.error(error);
		});
		
	/* 책 목차 */	
	ClassicEditor
	.create(document.querySelector('#bookContents'))
	.catch(error=>{
		console.error(error);
	});
/* 	 $('#author_select').on("click",function(e){
	e.preventDefault();
	let popUrl = "/exam/authorPOP";
	let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
	window.open(popUrl,"작가 찾기",popOption);
	$('#form').submit();
}); */
}); 
function fn_selectAuthor(){
 var form = document.form;
 window.open("","authorPOP","width = 650px, height=550px, top=300px, left=300px, scrollbars=yes");
 document.getElementById('form').action = "authorPOP";
 document.getElementById('form').target = "authorPOP";
 document.getElementById('form').submit();
}

const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		yearSuffix: '년',
		changeMonth: true,
        changeYear: true
	}
$(function() {
	  $( "input[name='publeYear']" ).datepicker(config);
	});
	
	function fn_insertBook(){
		if($("#bookName").val()==""){
			alert("책제목을 입력하세요");
			$("#bookName").focus();
			return ;
		}
		if($("#authorId").val()==""){
			alert("작가를 입력하세요");
			$("#authorId").focus();
			return ;
		}
		if($("#publeYear").val()==""){
			alert("출판일을 입력하세요");
			$("#publeYear").focus();
			return ;
		}
		if($("#publisher").val()==""){
			alert("출판소를 입력하세요");
			$("#publisher").focus();
			return ;
		}
		if($("#cateCode").val()==""){
			alert("책카테고리를 입력하세요");
			$("#cateCode").focus();
			return ;
		}
		if($("#bookPrice").val()==""){
			alert("책가격을 입력하세요");
			$("#bookPrice").focus();
			return ;
		}
		if($("#bookStock").val()==""){
			alert("책제고를 입력하세요");
			$("#bookStock").focus();
			return ;
		}
		if($("#bookDiscount").val()==""){
			alert("책할인율을 입력하세요");
			$("#bookDiscount").focus();
			return ;
		}
		if($("#bookIntro").val()==""){
			alert("책소개를 입력하세요");
			$("#bookIntro").focus();
			return ;
		}
		if($("#bookContents").val()==""){
			alert("책내용을 입력하세요");
			$("#bookContents").focus();
			return ;
		}
		$("#form").attr("action","/exam/bookInsert").attr("method","post").submit();
	}
	function go_adminPage() {
		$("#frm").attr("action", "/exam/adminPage").submit();
	}
</script>
<title>Insert goods</title>
</head>
<body>
	<h1>Insert goods</h1>
	<div class="admin_content_main">
		<form id="form" method="post">
					<div class="form_section">
						<div class="form_section_title">
							<label>책 제목</label>
						</div>
						<div class="form_section_content">
							<input name="bookName" id="bookName">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>작가</label>
						</div>
						<div class="form_section_content">
							<input id="authorName_input" name="authorName" readonly="readonly">
							<input id="authorId_input"  name="authorId" type="hidden">
							<!-- <button id="author_select">작가선택</button> -->
							<input type="button" value="작가선택" onclick="javascript:fn_selectAuthor();">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>출판일</label>
						</div>
						<div class="form_section_content">
							<input name="publeYear" id="publeYear" autocomplete="off" readonly="readonly">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>출판사</label>
						</div>
						<div class="form_section_content">
							<input name="publisher" id="publisher">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>책 카테고리</label>
						</div>
						<div class="form_section_content">
							<input name="cateCode" id="cateCode">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 가격</label>
						</div>
						<div class="form_section_content">
							<input name="bookPrice" id="bookPrice" value="0">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content">
							<input name="bookStock" id="bookStock" value="0">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 할인율</label>
						</div>
						<div class="form_section_content">
							<input name="bookDiscount" id="bookDiscount" value="0">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>책 소개</label>
						</div>
						<div class="form_section_content">
							<textarea name="bookIntro" id="bookIntro">></textarea>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>책 목차</label>
						</div>
				<div class="form_section_content">
					<textarea name="bookContents" id="bookContents"></textarea>
				</div>
			</div>
		<div class="btn_section">
			<a href="javascript:fn_insertBook();"><input type="button" value="InsertBook"></a>
		</div>	
		<input type="hidden" name="authorId" value="${author.authorId}"/>
		</form>
		<form id="frm" method="post">
			<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
		</form>
	</div>
</body>
</html>