<%@page import="member.db.MemberDAO"%>
<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join us / 리듀</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

#join_content {
	border: none;
	width: 400px;
	font-size: 14px;
}

#join_content #form_font_left {
 text-align: left;
 padding-left: 11px;
}

#join_content #form_font_left h2{
 text-align: left;
 padding-left: 14px;
}

</style>

<jsp:useBean id="mbean" class="member.db.MemberBean"></jsp:useBean>

<%
	MemberDAO mdao = new MemberDAO();
	
%>

<script type="text/javascript">
	
	function chk(){
		
		var policy_chk = document.form.policy_chk.checked;
		var num = 0;
		
		 if(policy_chk==true){
			num = 1; }
		 
		 if(num == 1){
			 document.form.submit();
		}else{
		  alert("개인정보 약관에 체크해 주십시오."); 
		  
		  $("#policy_chk").focus();
		  return false;
			
		 }
		 
		return true;
	}//chk
	
	 
</script>

</head>
<body>

<div class="wrap">
	<div class="margin"></div>
<div class="container" align="center">
	
	<div id="join_content" align="center" >
	<div id="header" align="center">
	
		<div id="form_font_left" align="left"><h2>리듀 회원가입</h2></div>
	</div>
	
		<form action="./MemberJoinAction.me" name="form" id="join" method="post" onsubmit="return chk();">
		
		<fieldset>
			<!-- id -->
				<input type="email" name="user_id" placeholder="이메일 주소 입력" class="inp-field w235"><input type="button" value="이메일 본인인증" class="btn"><br>
			<!-- name -->
				<input type="text" name="user_name" placeholder="사용자 이름을 입력해 주세요" class="inp-field"><br>
			<!-- password -->
				<input type="password" name="user_pw" placeholder="계정 비밀번호 입력" class="inp-field"><br>
			<!-- password confirm -->
				<input type="password" name="user_pw2" placeholder="비밀번호 재입력" class="inp-field"><br>
			<!-- date of Birth -->
				<div id="form_font_left" align="left">생년월일 </div>
				&nbsp;<input type="text" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
				<input type="text" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
				<input type="text" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w108">
			<br>
			<!-- phone --><input type="text" name="user_phone" placeholder="연락처를  '-'없이 입력해 주세요 " class="inp-field">
		
		</fieldset>
		<fieldset>
		<h5>리듀 개인정보 약관</h5>
		<textarea rows="10" cols="47">
		
		<jsp:include page="./policyForm.jsp"/>
		
		</textarea><br>
		<input type="checkbox" name="policy_chk" id="policy_chk"> 개인정보 수집 및 이용에 동의합니다.
		
		</fieldset>
		
		<div class="margin3"></div>
		<fieldset>
			<input type="submit" value="약관동의 및 회원가입" class="btn1 w354"><br>
			<input type="reset" value="가입취소" class="btn w354">
		</fieldset>
		
		</form>
	</div><!-- join_content -->

	<div class="margin4"></div>
	
</div><!-- container -->

</div><!-- wrap -->

</body>
</html>