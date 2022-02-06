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

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

function fn_selectAuthor(){
	 var form = document.form;
	 window.open("","exam/authorPOP","width = 650px, height=550px, top=300px, left=300px, scrollbars=yes");
	 document.getElementById('form_pop').action = "authorPOP";
	 document.getElementById('form_pop').target = "exam/authorPOP";
	 document.getElementById('form_pop').submit();
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
	/* 	if($("#bookIntro").val()==""){
			alert("책소개를 입력하세요");
			$("#bookIntro").focus();
			return ;
		}
		if($("#bookContents").val()==""){
			alert("책내용을 입력하세요");
			$("#bookContents").focus();
			return ;
		} */
		$("#form").attr("action","/exam/bookInsert").attr("method","post").submit();
	}
	function go_adminPage() {
		$("#frm").attr("action", "/exam/adminPage").submit();
	}
	
$(document).ready(function(){
	
	let cateList = JSON.parse('${cateList}');
	
	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");
	
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
			}
		}
	}	
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);
	
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	/* 중분류 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});
	
	/* 소분류 태그 */
	$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>");		
		
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for				
	});			
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	
		/* 할인율 Input 설정 */
	$("#discount_interface").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='bookPrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격       
		
		$(".span_discount").html(discountPrice);
		discountInput.val(sendDiscountRate);	
		
	});	
		
$("input[name='bookPrice']").on("change", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='bookDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='bookPrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		$(".span_discount").html(discountPrice);
		
	});
		
	$('#bookName').on('keyup',function(){
		if($('#bookName').val()){
			$('#bookName_warn').html('책 제목이 입력되었습니다.');
			$('#bookName_warn').css('color','green');
		}else{
			$('#bookName_warn').html('책 이름을 입력하세요.');
			$('#bookName_warn').css('color','red');
		}
	})
	$('#publeYear').on('change',function(){
		if($('#publeYear').val()){
			$('#publeYear_warn').html('책 출시일이 입력되었습니다.');
			$('#publeYear_warn').css('color','green');
		}else{
			$('#publeYear_warn').html('책 이름을 입력하세요.');
			$('#publeYear_warn').css('color','red');
		}
	})
	$('#publisher').on('keyup',function(){
		if($('#publisher').val()){
			$('#publisher_warn').html('출판사 입력이 완료되었습니다.');
			$('#publisher_warn').css('color','green');
		}else{
			$('$publisher_warn').html('출판사를 입력하세요.');
			$('$publisher_warn').css('color','red');
		}
	})
	$('#cate1').on('change',function(){
		if($('#cate1').val()=='none'){
			$('#cateCode_warn').html('카테고리를 선택하세요.');
			$('#cateCode_warn').css('color','red');
		}
	})
	$('#cate2').on('change',function(){
		if($('#cate2').val()=='none'){
			$('#cateCode_warn').html('카테고리를 선택하세요.');
			$('#cateCode_warn').css('color','red');
		}
	})
	$('#cate3').on('change',function(){
		if($('#cate3').val()!='none'){
			$('#cateCode_warn').html('카태고리 선택이 완료 되었습니다.');
			$('#cateCode_warn').css('color','green');
		}else{
			$('#cateCode_warn').html('카테고리를 선택하세요.');
			$('#cateCode_warn').css('color','red');
		}
	})
	$('#bookPrice').on('keyup',function(){
		if($('#bookPrice').val()!='0'){
			$('#bookPrice_warn').html('책가격 입력이 완료되었습니다.');
			$('#bookPrice_warn').css('color','green');
		}else{
			$('$bookPrice_warn').html('책가격을 입력하세요.');
			$('$bookPrice_warn').css('color','red');
		}
	})
	$('#bookStock').on('keyup',function(){
		if($('#bookStock').val()){
			$('#bookStock_warn').html('책재고 입력이 완료되었습니다.');
			$('#bookStock_warn').css('color','green');
		}else{
			$('$bookStock_warn').html('책 재고를 입력하세요.');
			$('$bookStock_warn').css('color','red');
		}
	})
	$('#discount_interface').on('keyup',function(){
		if($('#discount_interface').val()){
			$('#bookDiscount_warn').html('책할인 입력이 완료되었습니다.');
			$('#bookDiscount_warn').css('color','green');
		}else{
			$('$bookDiscount_warn').html('책할인을 입력하세요.');
			$('$bookDiscount_warn').css('color','red');
		}
	})
}); 
	
</script>
<title>Insert goods</title>
</head>
<body>
	<h1>Insert goods</h1>
	<div class="admin_content_main">
		<form id="form_pop" method="post">
					<div class="form_section">
						<div class="form_section_title">
							<label>작가</label>
						</div>
						<div class="form_section_content">
							<input id="authorName_input" name="authorName" readonly="readonly">
							<input id="authorId_input"  name="authorId" type="hidden">
							<!-- <button id="author_select">작가선택</button> -->
							<input type="button" value="작가 선택" onclick="javascript:fn_selectAuthor();">
							<div id="authorName_warn" style="color:red">작가를 입력하세요</div>
						</div>
					</div>
		</form>
		<form id="form" method="post">
					<div class="form_section">
						<div class="form_section_title">
							<label>책 제목</label>
						</div>
						<div class="form_section_content">
							<input name="bookName" id="bookName">
							<div id="bookName_warn" style="color:red">책 이름을 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>출판일</label>
						</div>
						<div class="form_section_content">
							<input name="publeYear" id="publeYear" autocomplete="off" readonly="readonly">
							<div id="publeYear_warn" style="color:red">출판일을 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>출판사</label>
						</div>
						<div class="form_section_content">
							<input name="publisher" id="publisher">
							<div id="publisher_warn" style="color:red">출판소를 입력하세요</div>
						</div>
					</div>
					<div class="cate_wrap">
						<span>대분류</span>
						<select class="cate1" id="cate1">
							<option selected value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>중분류</span>
						<select class="cate2" id="cate2">
							<option selected value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>소분류</span>
						<select class="cate3" id="cate3" name="cateCode">
							<option selected value="none">선택</option>
						</select>
						<div id="cateCode_warn" style="color:red">카테고리를 선택하세요</div>
					</div> 
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 가격</label>
						</div>
						<div class="form_section_content">
							<input name="bookPrice" id="bookPrice" value="0">
							<div id="bookPrice_warn" style="color:red">책 가격을 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 재고</label>
						</div>
						<div class="form_section_content">
							<input name="bookStock" id="bookStock" value="0">
							<div id="bookStock_warn" style="color:red">책 재고를 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 할인율</label>
						</div>
						<div class="form_section_content">
							<input id="discount_interface" maxlength="2" oninput="maxLengthCheck(this)" type='number'>
							<input name="bookDiscount" id="bookDiscount" type="hidden"value="0">
							<div class="step_val">할인 가격 : <div class="span_discount"></div></div>
							<div id="bookDiscount_warn" style="color:red">책 할인율를 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>책 소개</label>
						</div>
						<div class="form_section_content">
							<textarea name="bookIntro" id="bookIntro"></textarea>
							<div id="bookIntro_warn" style="color:red">책 소개를 입력하세요</div>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>책 목차</label>
						</div>
				<div class="form_section_content">
					<textarea name="bookContents" id="bookContents"></textarea>
					<div id="bookDiscount_warn" style="color:red">책 목차를 입력하세요</div>
				</div>
			</div>
		<div class="btn_section">
			<a href="javascript:fn_insertBook();"><input type="button" value="InsertBook" id="insertBook"></a>
		</div>	
		<input id="authorName_input" name="authorName" type="hidden">
		<input id="authorId_input"  name="authorId" type="hidden">
		</form>
		<form id="frm" method="post">
			<a href="javascript:go_adminPage();" class="admin_link"><input type="button" value="back"></a>
		</form>
	</div>
</body>
</html>