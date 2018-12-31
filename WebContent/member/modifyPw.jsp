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

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

#pwModify_form {
	border: 1px solid red; 
	width: 400px;
	}

#pwModify_form #form_font_left {
 text-align: left;
 font-size: 10px;
 padding-left: 25px;
}

</style>
<script type="text/javascript">
	//password가 서로 같은지 , 조건에 맞는지 확인하여   passwordCheckMessage에 에러메시지 출력
	function pwCheckFunction() {
		
		//비밀번호 입력란에 입력한 값 얻기
		var user_pw3 = $('#user_pw3').val();
		//비밀번호 확인 입력란에 입력한 값 얻기
		var user_pw4 = $('#user_pw4').val();
		
		//정규표현식  : 비밀번호는 알파벳, 숫자, 특수문자 포함 8-20
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
		//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		//var password_pattern = /^[A-Za-z0-9]{8,20}$/;
		
		//password 조건 확인
		if(!password_pattern.test(user_pw3)){
			
			$('#pwCheckMessage').html('비밀번호는 알파벳,숫자, 특수문자 포함 8-20자 여야 합니다.');
			
			return;
			
		}else{ //정규표현식에 만족할경우(제대로 password를 입력 했을 경우 )
			
			$('#pwCheckMessage').html('');
		
			//패스워드 입력란의 값과  패스워드 확인 입력란의 값이 같은지 판단
			if(user_pw3 != user_pw4){
				
				$('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
				
			}else{//같을떄...
				
				$('#pwCheckMessage').html('');
			}								
		}							
	}//passwordCheck

</script>
</head>
<body>

<div class="wrap">
	<div class="container" align="center">
		<div id="pwModify_form">
		<h2>회원 비밀번호 수정</h2>
			<form action="./MemberModifyPwAction.me">
			<!-- id -->	
				<input type="text" name="user_id" value="${id }" class="inp-field" readonly><br>
			<!-- pw -->
				<input type="password" name="user_pw" placeholder="기존 비밀번호를 입력해 주세요" class="inp-field"><br><br>
				<input type="password" name="user_pw3" id="user_pw3" placeholder="새 비밀번호를 입력해 주세요" class="inp-field" onkeyup="pwCheckFunction();"><br>
				<input type="password" name="user_pw4" id="user_pw4" placeholder="새 비밀번호를 재입력해 주세요" class="inp-field_nomargin" onkeyup="pwCheckFunction();"><br>
				<div id="form_font_left" align="left"><span style="color:red;" id="pwCheckMessage"></span></div>
			<div class="margin2"></div> 
				
				<input type="submit" value="수정하기" class="btn1 w354"><br>
				<input type="button" value="취소" class="btn w354" onclick="location.href='./Main.me'">
			</form>
		</div><!-- pwModify_form -->
		
		<div class="margin4"></div>
		
	</div><!-- container -->
</div><!-- wrap -->

</body>
</html>