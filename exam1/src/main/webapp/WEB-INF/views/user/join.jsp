<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Join</title>
<script type="text/javaScript">
$( document ).ready(function() {
	//�������
	$('#submit_Button').on("click",function(){
		if(document.getElementById('id').value==""){
			alert("id�� �Է��ϼ���")
			return ;
		}else if(document.getElementById('password').value==""){
			alert("password�� �Է��ϼ���")
			return ;
		}else if(document.getElementById('password_re').value==""){
			alert("password üũ�� ���ּ���")
			return ;
		}else if(document.getElementById('name').value==""){
			alert("�̸��� �Է��ϼ���")
			return ;
		}else if(document.getElementById('pnum').value==""){
			alert("�ڵ�����ȣ�� �Է��ϼ���")
			return ;
		}else if(document.getElementById('email').value==""){
			alert("�̸��ϸ� �Է��ϼ���")
			return ;
		}else if(document.getElementById('email_chk').value==""){
			alert("�̸��� ������ �Է��ϼ���")
			return ;
		}else{
			alert("ȸ�������� �Ϸ� �Ǿ����ϴ�.")
			$("#regForm").attr("action","/exam/insertUser").attr("method","post").submit();
		}
	})
	/* ������ȣ �̸��� ���� */
	$("#mail_check_button").on("click", function() {
    	var email = $("#email").val();
    	$.ajax({
            type:"GET",
            url:"mailCheck?email=" + email,
    		success:function(data){
    			code=data;	
    		}
        });
	});
	var code='';
	//�Է°�� ��
	$("#email_chk").on("keyup",function(){
		var inputCode=$("#email_chk").val;
		var checkResult=$("#email_chk_css");
		if(inputCode == code){
			checkResult.html("������ȣ�� ��ġ�մϴ�");
			checkResult.css('color', 'green');
			$('#submit_Button').attr("disabled",false);
		}else{
			checkResult.html("������ȣ�� �ٽ� Ȯ�����ּ���");
			checkResult.css('color', 'red');
			$('#submit_Button').attr("disabled",true);
		}
	});
	
});
	function fn_cancle(){
		location.href="/exam/login"
	};
</script>
</head>
<body>
	<form id="regForm" method="post">
		<table>
			<tr>
				<td>id:</td><td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>pw:</td><td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>pwre:</td><td><input type="password" name="password_re" id="password_re"></td>
			</tr>
			<tr>
				<td>name:</td><td><input type="text" name="name" id="name" id="name"></td>
			</tr>
			<tr>
				<td>pnum:</td><td><input type="text" name="pnum" id="pnum"></td>
			</tr>
			<tr>
				<td>email:</td><td><input type="text" name="email" id="email"></td>
				<td><button type="button" id="mail_check_button">������ȣ����</button></td>
			</tr>
			<tr>
				<td>������ȣ:</td><td><input type="text" name="email_chk" id="email_chk"></td>
				<td><div id="email_chk_css"></div></td>
			</tr>
		</table>
	<button type="submit" id="submit_Button" >join</button>
	<button type="button" onClick="fn_cancle();">cancle</button> 
	</form>
</body>
</html>