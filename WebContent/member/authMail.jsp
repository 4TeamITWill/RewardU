<%@page import="member.db.MemberDAO"%>
<%@page import="email.SMTPAuthenticatior"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이메일 인증 페이지</title>

<style type="text/css">
	#reg_form {
		box-shadow: none;
		margin-top: 20px; 
	}

body{ background: linear-gradient(90deg, #b44af7, #82caff);
 	
 }
 
 .margin{ margin-top: 100px;}
 .margin2{ margin-bottom: 100px;}
 .margin3{ margin-top: 50px;}
 .margin4{ margin-top: 30px;}
 .wrap{align: center;
 		text-align: center;
 }
 .auth-field, .id{
 
 	width: 350px;
    height: 40px;
    border: 3px solid #aaa;
    border-radius: 30px;
    color: #999;
    font-size: 14px;
    text-indent: 12px;
    line-height: 40px;
 }
 
 .button_type2{
	clear: both;
	background: #605d5d; 
	color: #fff;
	border: 1px solid #605d5d; 
	padding:14px;
}
 
.auth_desc {
	color: #aaa;
	font-size: 11px;
} 
	
</style>
<%--  <% 
MemberDAO mdao = new MemberDAO();
String authNum = mdao.randomNum();
%>
 --%>

 <%-- <%
	request.setCharacterEncoding("utf-8");
	String to = request.getParameter("to");
	
	MemberDAO mdao = new MemberDAO();
	String authNum = mdao.randomNum();
	
	SMTPAuthenticatior smtp = new SMTPAuthenticatior();
	int check = smtp.sendEmail(to, authNum);
	
	if(check == 1) {
%> 
<script>
	alert("인증 메일이 발송되었습니다. 인증번호 6자리를 입력해주세요.");
	return 3;
</script>
<%
} else {
%>
<script>
	alert("인증 메일 발송 실패! 메일 주소를 다시 확인해주세요.");
	
	$('#myModal').hide();
	
</script>
<%
}
%>
 --%>
<script type="text/javascript">
	function check() {
		var code = document.getElementById("code").value;
		var authNum = ${authNum};
		
		if(!code) {
			alert("인증번호를 입력하세요.");
			return false;
		}
		
		if(authNum == code) {
			alert("인증이 확인되었습니다.");
			$('#myModal').hide();
			emailCheck.value = "인증완료";
			idCheck.value = "1";
						
			
			
			 if(idCheck.value == '1'){
				 	user_id.readOnly = true;
				 	//opener.user_id.style.color = "red";
				 	user_id.style.fontStyle = "italic";
				    //opener.user_id.style.display = "none";	
				 }
			
			email_Check = true;
			emailSuccess.value = authNum;			
			//window.close();
		} else {
			alert("인증번호가 틀립니다. 다시 입력해 주세요.");
			return false;
		}
	}
</script>


</head>
<body>
	<form id="reg_form" method="post" onsubmit="return check();">
	      <div class="form-group">
              <label for="code"><h3 align="center">이메일 인증번호</h3></label>
              <div class="auth_desc">*입력하신 이메일으로 전송된 인증번호 6자리를 입력해주세요.</div>
                <div class="input-group">
                	<input type="text" class="auth-field" id="code" name="code"  placeholder="인증번호 6자리 입력">
                	<span >
                  		<button type="button" class="button_type2" onclick="check()">확인</button>
                	</span>
              </div>
          </div>
	</form>
</body>
</html>