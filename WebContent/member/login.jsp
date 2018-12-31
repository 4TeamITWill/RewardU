<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    
#loginForm{width: 430px; hegiht:450px; 
		border: 1px solid #aaa;
		margin: 0 auto;
		background-color: #fff;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}
}


#login_content {
	padding-top: 3px;
	border: 1px solid white;
	width: 400px;
	font-size: 14px;
}

#login_content .formh2 {
	padding-top: 5px;
	margin-left: 38px;
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

</style>
</head>
<body>

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
			<input type="password" name="user_pw" placeholder="비밀번호" class="inp-field"><br>
		
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
 <!-- Trigger/Open The Modal -->
    <button id="myBtn">Open Modal</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
    </div>
    

</div><!-- wrap -->

<script type="text/javascript">
	//Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	
	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}


</script>


</body>
</html>