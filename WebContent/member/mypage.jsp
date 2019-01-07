<%@page import="member.db.MemberDAO"%>
<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | Mypage</title>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">


<style type="text/css">
.container{ align: center;
}

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

#mypage_content {
	border: 1px solid red;
	width: 400px;
	font-size: 14px;
}

#mypage_content #form_font_left {
 text-align: left;
 padding-left: 11px;
}

textarea {
	   text-align: left;
	   font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
       width: 350px;
       height: 150px;
       font-size: 14px;
       line-height: 14px;
       white-space: pre-line;
       text-indent: none;
       overflow: hidden;
}

textarea::placeholder {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #aaa;
  font-weight: bold;
  text-align: left;
}

</style>
<script type="text/javascript">

jQuery(document).ready(function(){	
	
	/* 	$('#checkMessage').html('방갑다구여');
	 	$('#myModal').show(); */

});

	function modify(){
		//window.confirm("수정하시겠습니까?");
		 $('#checkMessage').html('수정하시겠습니까?');
	 	$('#myModal').show();
	 	
	 	
	 //	"./MemberModifyAction.me"
	};
	
	function modifySubmit(){
		document.getElementById("m_form").action = "./MemberModifyAction.me";
		document.getElementById("m_form").submit();
	}

	
	function close_pop(flag) {
        $('#myModal').hide();
   };

</script>


</head>
<body>

<div class="wrap">

<div class="container" align="center">
	
	<div id="mypage_content" align="center" style="padding : 2rem 0;">
	<form id="m_form" method="post">
		
		<!-- profile photo -->
				<img src="img/usernull.png" width="200" height="200"><br>
				<input type="button" value="프로필 사진 수정"><br>
				<div class="margin3"></div>
		<fieldset>
		<!-- id -->
				<div id="form_font_left" align="left">내 아이디 </div>
				<input type="text" name="user_id" value="${sessionScope.id }" class="inp-field" readonly><br>
		<!-- name -->
				<div id="form_font_left" align="left">사용자 이름 </div>
				<input type="text" name="user_name" value="${sessionScope.name } " class="inp-field"><br>
		<!-- date of Birth -->
				<div id="form_font_left" align="left">생년월일 </div>
				<input type="text" name="birthyyyy" value="${mbean.birthyyyy }" class="inp-field w120">
				<input type="text" name="birthmm" value="${mbean.birthmm }" class="inp-field w108">
				<input type="text" name="birthdd" value="${mbean.birthdd }" class="inp-field w108"><br>
		<!-- phone -->
				<div id="form_font_left" align="left">연락처 </div>
				<input type="text" name="user_phone" value="${mbean.user_phone }" class="inp-field"><br>
		<!-- content --> 
				<div id="form_font_left" align="left">자기소개 및 하고싶은 말</div>
				<textarea wrap="hard" placeholder="자기 소개글을 입력해 보세요!(100자 이내)"  name="user_content">${mbean.user_content }</textarea>
			
			</fieldset>
			<fieldset>
				<input type="button" value="정보수정" class="btn1 w354" onclick="modify();"><br>
			<div class="margin3"></div>
				<input type="button" value="비밀번호 수정" class="btn w175" onclick="location.href='./MemberModifyPw.me'">

				<input type="button" value="메인으로" class="btn w175" onclick="location.href='./Main.me'">
			</fieldset>
					
	</form>

		<h5><!-- <a href="./MemberModifyPw.me">비밀번호 수정하기</a> &nbsp;| &nbsp; --><a href="./MemberDelete.me">리듀 회원탈퇴</a></h5>

		
	</div><!-- mypage_content -->

</div><!-- container -->

<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      	<span class="close" onClick="close_pop();">&times;</span> 
            <div class="modal-header">다시 확인해주세요!</div>
            <div id="checkMessage" class="modal-body">
                <p style="text-align: center; line-height: 1.5;">왜??</p>
            </div>
            <div class="modal-footer">
            <input type="button" id="modal-btn" value="전송" onclick="modifySubmit();">&nbsp;<input type="button" id="modal-btn2" value="취소" onclick="location.reload();">
            </div>
      </div>
 
    </div><!--End Modal-->

</div><!-- wrap -->


</body>
</html>