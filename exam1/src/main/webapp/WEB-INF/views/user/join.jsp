<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a0a134e260d4f0c6e32d2fa1c121721&libraries=services"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Join</title>
<script type="text/javaScript">
	var makerList = [];
	var mapContainer = null;
	var map = null;
	var code= "";
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 참고 항목 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               console.log(data);
               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('postcode').value = data.zonecode;
               document.getElementById("roadAddress").value = roadAddr;
               document.getElementById("roadAddress_hidden").value = roadAddr;
               document.getElementById("jibunAddress").value = data.jibunAddress;
               fn_keyword();
               // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
               if(roadAddr !== ''){
                   document.getElementById("extraAddress").value = extraRoadAddr;
               } else {
                   document.getElementById("extraAddress").value = '';
               }

               var guideTextBox = document.getElementById("guide");
               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               if(data.autoRoadAddress) {
                   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                   guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                   guideTextBox.style.display = 'block';

               } else if(data.autoJibunAddress) {
                   var expJibunAddr = data.autoJibunAddress;
                   guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                   guideTextBox.style.display = 'block';
               } else {
                   guideTextBox.innerHTML = '';
                   guideTextBox.style.display = 'none';
               }
           }
       }).open();
   }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	function fn_keyword(){
		var keyword = document.getElementById("roadAddress_hidden").value
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		if(keyword != ""){
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(keyword, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
					    for ( var i = 0; i < makerList.length; i++ ) {
					           markerList[i] = makerList.push(marker) ;
						   	    
					    }   
			    } 
			});    
		}
	}		

$( document ).ready(function() {
		
	mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.56105828564502, 126.98339158029705), // 지도의 중심좌표37.56105828564502, 126.98339158029705
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//공백방지
	$('#submit_Button').on("click",function(){
		if(document.getElementById('id').value==""){
			alert("id를 입력하세요")
			return ;
		}else if(document.getElementById('password').value==""){
			alert("password를 입력하세요")
			return ;
		}else if(document.getElementById('password_re').value==""){
			alert("password 체크를 해주세요")
			return ;
		}else if(document.getElementById('name').value==""){
			alert("이름를 입력하세요")
			return ;
		}else if(document.getElementById('pnum').value==""){
			alert("핸드폰번호를 입력하세요")
			return ;
		}else if(document.getElementById('email').value==""){
			alert("이메일를 입력하세요")
			return ;
		}else if(document.getElementById('email_chk').value==""){
			alert("이메일 인증을 입력하세요")
			return ;
		}else{
			alert("회원가입이 완료 되었습니다.")
			$("#regForm").attr("action","/exam/insertUser").attr("method","post").submit();
		}
	})
	/* 인증번호 이메일 전송 */
	$("#mail_check_button").on("click", function() {
    	var email = $("#email").val();
    	$.ajax({
            type:"GET",
            url:"mailCheck?email=" + email,
    		success:function(data){
    			code=data;	
    			console.log("data : " + data);
    		}
        });
	});
	//입력결과 비교
	$("#email_chk").on("keyup",function(){
			inputEmail=$("#email_chk").val();
		var checkResult=$("#email_chk_css");
		if(inputEmail == code){
			checkResult.html("인증번호가 일치합니다");
			checkResult.css('color', 'green');
			$('#submit_Button').attr("disabled",false);
		}else{
			checkResult.html("인증번호를 다시 확인해주세요");
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
			<tr><td>address:</td>
				<td>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
					<input type="hidden" id="roadAddress_hidden" name="roadAddress_hidden">
					<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<td>email:</td><td><input type="text" name="email" id="email"></td>
				<td><button type="button" id="mail_check_button">인증번호전송</button></td>
			</tr>
			<tr>
				<td>인증번호:</td><td><input type="text" name="email_chk" id="email_chk"></td>
				<td><div id="email_chk_css"></div></td>
			</tr>
		</table>
	<button type="submit" id="submit_Button" >join</button>
	<button type="button" onClick="fn_cancle();">cancle</button> 
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:350px;height:300px;"></div>
	</form>
</body>
</html>