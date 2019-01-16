<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">
<link href="css/modal.css" rel="stylesheet">
<style type="text/css">

body { }

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}
    
#loginForm{width: 430px; 
		border: 1px solid #aaa;
		margin: 0 auto;
		background-color: #fff;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}



#login_content {
	padding-top: 3px;
	border: 1px solid white;
	width: 400px;
	font-size: 14px;
}

#login_content .formh2 {
	padding-top: 1px;
	margin-left: 23px;
}


#login_content #form_font_left {
 text-align: left;
 padding-left: 11px;
}


.wrap{background-color: #ddd;
	 padding: 150px 200px;
	 background-image: url("img/laurel-forest.jpg"); 
	 background-size: 100% auto;
	 background-attachment: scroll;
	 background-repeat: no-repeat;
}

#word{
	color: white;
	font-size: 12px;
}

#Progress_Loading
{
 position: absolute;
 left: 50%;
 top: 50%;
 margin: 0 auto;
}

</style>
<%
 	String loginVal = (String)request.getParameter("login");
%>

<script type="text/javascript">


	jQuery(document).ready(function(){
	
		var loginVal = <%=loginVal%>
		if(loginVal == "1"){
			/*  $('#checkTitle').html('다시 확인해주세요!'); */
			  $('#checkMessage').html('아이디나 비밀번호가 일치하지 않습니다.');
			  $('#myModal').show();
			}else if (loginVal == "2") {
				/* $('#checkTitle').html('다시 확인해주세요!'); */
				$('#checkMessage').html('일치하는 아이디가 없습니다.');
				$('#myModal').show();
			}/* else {
				$('#checkTitle').html('다시 확인해주세요!');
				$('#myModal').show();
			} */

	});
	 
	function close_pop(flag) {
        $('#myModal').hide();
   };
   
</script>

</head>
<body>
<%-- <c:if test="${login == 1 }">
	<script type="text/javascript">
	  $('#checkMessage').html('아이디나 비밀번호가 일치하지 않습니다.');
	  $('#myModal').show();
	</script>
</c:if> --%>

<div class="wrap">


<div class="container" align="center">
	<div class="margin2"></div>
	<div id="loginForm">
		<div class="margin3"></div>
	<div id="login_content">
		<h2 class="formh2" align="left">리듀 로그인</h2>
		<form action="./MemberLoginAction.me" method="post">
			<fieldset>
		
			<input type="text" name="user_id" placeholder="이메일 아이디" class="inp-field"><br>
			<input type="password" name="user_pw" placeholder="비밀번호 (알파벳,숫자,특수문자 포함 8-20자)" class="inp-field"><br>
		
			<input type="submit" value="로그인" class="btn1 w354">
			</fieldset>
		
		</form>
		<br>
			<span id="find_info" style="font-size: 13px;"><a href="MemberFind_ID_PW.me">아이디 찾기 | 비밀번호 찾기</a></span>
		</div><!-- login_content -->
	<div class="margin3"></div><br>
	</div><!-- loginForm -->

	<br>
	<span id="word" >아직 리듀 계정이 없나요?<a href="./MemberJoin.me">회원가입</a></span>
	<br><Br>

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

<!-- <div id = "Progress_Loading">Loading Bar
<img src="img/loadingBar.gif"/>
</div>

 <div id="Parse_Area"></div> -->

</div><!-- wrap -->

</body>
</html>