<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 회원 비밀번호 수정</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style type="text/css">

.wrap{
	background-color: #ddd;
	padding: 100px 150px;

	background-image: url("img/laurel-forest.jpg"); 
	background-size: cover;
	background-attachment: scroll;
	background-repeat: no-repeat;
	
}
</style>
<%
 	String mpw = (String)request.getParameter("mpw");
%>
<script type="text/javascript">


	jQuery(document).ready(function(){
	
		var mpw = <%=mpw%>
		
		var user_pw3 = $('#user_pw3').val();
		var user_pw4 = $('#user_pw4').val();
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
		if(mpw == "2"){
			  $('#checkMessage').html('입력하신 기존 비밀번호가 틀립니다.');
			  $('#myModal').show();
			}
		
	});

</script>
<script type="text/javascript">

	function pwCheckFunction() {

		var user_pw3 = $('#user_pw3').val();
		var user_pw4 = $('#user_pw4').val();
		
		//정규표현식  : 비밀번호는 알파벳, 숫자, 특수문자 포함 8-20
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
	
		if(!password_pattern.test(user_pw3)){
			$('#pwCheckMessage').css("visibility", "visible");
			$('#pwCheckMessage').html('비밀번호는 알파벳,숫자,특수문자 포함 8-20자 여야 합니다.&nbsp;');
			
			return;
			
		}else{ //정규표현식에 만족할경우
			
			$('#pwCheckMessage').html('');
		
			//패스워드 입력란의 값과  패스워드 확인 입력란의 값이 같은지 판단
			if(user_pw3 != user_pw4){
				$('#pwCheckMessage').css("visibility", "visible");
				$('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다.&nbsp;');
				
			}else{//같으면
				
				$('#pwCheckMessage').html('');
				$('#pwCheckMessage').css("display", "none");
			}								
		}							
	}//passwordCheck
	
	function pwchk(){
		
		var user_pw = $('#user_pw').val();
		var user_pw3 = $('#user_pw3').val();
		var user_pw4 = $('#user_pw4').val();
		var blank_pattern = /[\s]/g;
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
	    if(!user_pw ||blank_pattern.test(user_pw)){
			$('#checkMessage').html('기존 비밀번호가 입력되지 않았습니다.');
			$('#myModal').show();
			return false;
		} 
		
	
		if(user_pw3 != user_pw4 || !(password_pattern.test(user_pw3))){
			$('#checkMessage').html('비밀번호가 양식에 맞지 않습니다.');
			$('#myModal').show();
			return false;
		}
	};	//pwchk
	
	//modal close(x)
	function close_pop(flag) {
        $('#myModal').hide();
   };

</script>
</head>
<body>

<div class="wrap">
	<div class="container" align="center">
		<div id="pwModify_form">
			<div id="pwModify_header">회원 비밀번호 변경</div>
			
			<form action="./MemberModifyPwAction.me" method="post" onsubmit="return pwchk();">
			<!-- id -->	
				<input type="text" name="user_id" value="${id }" class="inp-field" readonly><br>
			<!-- pw -->
				<input type="password" name="user_pw" id="user_pw" placeholder="기존 비밀번호를 입력해 주세요" class="inp-field"><br><br>
				<div id="form_font_left" align="left"><span style="color:#434d5b;" id="pwCheckMessage"></span></div>
				<input type="password" name="user_pw3" id="user_pw3" placeholder="새 비밀번호를 입력해 주세요" class="inp-field" onkeyup="pwCheckFunction();"><br>
				<input type="password" name="user_pw4" id="user_pw4" placeholder="새 비밀번호를 재입력해 주세요" class="inp-field_nomargin" onkeyup="pwCheckFunction();"><br>
				
			<div class="margin2"></div> 
				<input type="submit" value="수정하기" class="btn1 w354"><br>
				<input type="button" value="취소" class="btn w354" onclick="location.href='./Main.me'">
			<div class="margin3"></div> 
			</form>
		</div><!-- pwModify_form -->
		
		<div class="margin4"></div>
		
	</div><!-- container -->
	
	<!-- Modal Start -->
	<div id="myModal" class="modal">
	 
	      <!-- Modal content -->
	      <div class="modal-content">
	      	<span class="close" onClick="close_pop();">&times;</span> 
	            <div class="modal-header">다시 확인해주세요!</div>
	            <div id="checkMessage" class="modal-body">
	                <p style="text-align:center; line-height: 1.5;">왜??</p>
	            </div>
	      </div>
	 
	</div><!--End Modal-->
</div><!-- wrap -->

</body>
</html>