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
<link href="css/modal.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

#join_content {
	border: 1px solid #aaa;
	background-color: #fff;
	width: 400px;
	font-size: 14px;
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}

#join_content #form_font_left {
 text-align: left;
 padding-left: 11px;
}


#join_content #form_font_left h2{
 text-align: left;
 padding-left: 14px;
}

#join_content #form_font_left_s{
 text-align: left;
 padding-left: 14px;
 font-size: 8px !important;
 margin-bottom: 10px;
 color: #b44af7;
}

#join_content #form_font_left_al{
 text-align: left;
 padding-left: 14px;
 font-size: 8px !important;
 margin-bottom: 10px;
 color: red;
}

.wrap{background-color: #ddd; 
	padding: 100px 200px;
	background-image: url("img/leaves.jpg"); 
	background-size: 100% 100%;
	background-attachment: scroll;
	background-repeat: no-repeat;}

</style>


<%
	MemberDAO mdao = new MemberDAO();
	
%>
<script type="text/javascript">

	function close_pop(flag) {
        $('#myModal').hide();
   };
   
   
</script>

<script type="text/javascript">
	
	function chk(){
		
		var policy_chk = document.form.policy_chk.checked;
		var num = 0;
		
		var blank_pattern = /[\s]/g;
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
		var user_pw = $('#user_pw').val();
		var user_pw2 = $('#user_pw2').val();
		
		var user_name = $('#user_name').val();
		
		var user_phone = $('#user_phone').val();
		
		var birthyyyy = $('#birthyyyy').val();
		var birthmm = $('#birthmm').val();
		var birthdd = $('#birthdd').val();
		
		var idCheck = $('#idCheck').val(); //0얻기  
		
			
		
		if(!user_name || blank_pattern.test(user_name)){
			//alert("입력 안됨ㅁ"); 
			$('#checkMessage').html('이름에 공백이 포함되어 있거나 입력되지 않았습니다.');
			//$('#checkType').attr('class','modal-content panel-warning');
			$('#myModal').show();
			return false;
		}
		
		if(user_pw != user_pw2 || !(password_pattern.test(user_pw))){
			$('#checkMessage').html('비밀번호가 양식에 맞지 않습니다.');
			$('#myModal').show();
			return false;
		}
		
		 if(!birthyyyy /*|| !(birthyyyy_pattern.test(birthyyyy))*/ || blank_pattern.test(birthyyyy)){
			$('#checkMessage').html('출생년도 숫자 4자리를 올바르게 입력해주십니오. ex) 2000');
			$('#myModal').show();
			return false;
		}
		 
		 if(!birthmm || blank_pattern.test(birthmm)){
				$('#checkMessage').html('출생 월일 숫자 2자리를 올바르게 입력해주십니오. ex) 01');
				$('#myModal').show();
				return false;
			}
		 if(!birthdd || blank_pattern.test(birthdd)){
				$('#checkMessage').html('출생 월일 숫자 2자리를 올바르게 입력해주십니오. ex) 01');
				$('#myModal').show();
				return false;
			}
		
		if(!user_phone || blank_pattern.test(user_phone)){
			$('#checkMessage').html('연락처에 공백을 포함하고 있거나 입력되지 않았습니다.');
			$('#myModal').show();
			$("#user_phone").focus();
			return false;
		}
		
		 if(idCheck != "1"){ //중복 체크 하지 않았을 경우  0
			$('#checkMessage').html('아이디 중복확인을 완료해주세요');
			$('#myModal').show();
			$('#emailCheck').focus();
			return false;
		} 
		
		
		 if(policy_chk==true){
			num = 1; }
		 
		 if(num == 1){
			 document.form.submit();
			
		}else{
		 // alert("동의 체크 ㄱㄱ"); 
		  $('#checkMessage').html('개인정보 약관 동의에 체크해 주십시오.');
		  $('#myModal').show();
		  
		  $("#policy_chk").focus();
		  return false;
			
		 }
		 
		
			 
		 return true; 
	}//chk
	
	//password가 서로 같은지 , 조건에 맞는지 확인하여   passwordCheckMessage에 에러메시지 출력
	function pwCheckFunction() {
		
		//비밀번호 입력란에 입력한 값 얻기
		var user_pw = $('#user_pw').val();
		//비밀번호 확인 입력란에 입력한 값 얻기
		var user_pw2 = $('#user_pw2').val();
		
		//정규표현식  : 비밀번호는 알파벳, 숫자, 특수문자 포함 8-20
		var password_pattern = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
		
		//숫자와 문자 포함 형태의 8~15자리 이내의 암호 정규식
		//var password_pattern = /^[A-Za-z0-9]{8,20}$/;
		
		//password 조건 확인
		if(!password_pattern.test(user_pw)){
			
			$('#pwCheckMessage').html('&nbsp;비밀번호는 알파벳,숫자,특수문자 포함 8-20자 여야 합니다.');
			
			return;
			
		}else{ //정규표현식에 만족할경우(제대로 password를 입력 했을 경우 )
			
			$('#pwCheckMessage').html('');
		
			//패스워드 입력란의 값과  패스워드 확인 입력란의 값이 같은지 판단
			if(user_pw != user_pw2){
				
				$('#pwCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
				
			}else{//같을떄...
				
				$('#pwCheckMessage').html('');
			}								
		}							
	}//passwordCheck
	
</script>

<script type="text/javascript">

	var email_Check = false;
	
	function sendEmail() {
		
		var emailCheck = $('#emailCheck').val();
		var width = 480;
		var height = 160;
		var winL = (screen.width - width) / 2;
		var winT = (screen.height - height) / 2;
		var property = "width=" + width + "," + "height=" + height + "," 
						+ "left=" + winL + "," + "top=" + winT + " menubar=no";
		var idCheck = $("#idCheck").val();
		
		email_Check = false;
		
		window.open("member/authMail.jsp?to=" + $('#user_id').val(), "인증 페이지", property);
		
// 		if(email_Check){
// 			document.getElementById("idCheck").value="1";
// 		}
		   
	}
	
	function idDupCheck(){
		
		var user_id = $('#user_id').val();
		var blank_pattern = /[\s]/g;
		
		//패턴만 바꾸면 된다.
		var email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(blank_pattern.test(user_id)){
			$('#idCheckMessage').html('&nbsp; 이메일을 입력해 주세요.');
			document.getElementById("idCheck").value="0";
			return;
		}
		
		if(!email_pattern.test(user_id)){
			$('#idCheckMessage').html('&nbsp; 형식을 바르게 입력해주세요.');
			document.getElementById("idCheck").value="0";
			return;
		}
		      
		
		$.ajax(
				{
					type: 'POST',
					url:'./UserRegisterCheck',
					data : {user_id: user_id },
					success:function(result){
						if($.trim(result) == 1){//결과가 1이면 사용할수 있는 아이디 
							$('#idCheckMessage').html('&nbsp;사용하실 수 있는 아이디 입니다.');
							//중복확인을 했다~~판별값을 <input>태그에 설정 
							document.getElementById("idCheck").value="0";
							
						}else if($.trim(result) == 0){
							$('#idCheckMessage').html('&nbsp;중복되는 아이디 입니다.');
							document.getElementById("idCheck").value="0";
							//중복확인을 하지 않았다는 판변값을 <input>태그에 설정
							
						}
						
						/* $('#checkModal').modal('show');		 */					
					}						
				}					
		      );	//ajax	
		      
		   		
		}//idDupCheck

	
	function init_idCheck() {
		//중복확인 버튼을 누르면 'idCheck'의 value값이 1로 바뀌도록 구성
		//또한 중복체크를 성공한후에 사용자가 id를 변경할수도 있으니 'user_id'값에 onkeyup을 통해
		//사용자가 입력을 하는 순간 'idCheck'값을 초기화(0)하도록 함
			document.getElementById("idCheck").value="0";
	}			
			

</script>


</head>
<body>

<div class="wrap">
	

<div class="container" align="center">

	
	<div id="join_content" align="center" >
	<div id="header" align="center">
	
		<div id="form_font_left" align="left"><h2>리듀 회원가입</h2></div>
	</div>
	
		<form action="./MemberJoinAction.me" name="form" id="join" method="post" onsubmit="return chk();">
		
		<fieldset>
			<!-- id -->
				<input type="hidden" name="emailSuccess" id="emailSuccess">
                <span id="emailCheck1" class="check_status"></span>
                <div id="form_font_left" align="left">아이디 <span style="color:red; font-size: 8px !important; " id="idCheckMessage"></span></div>
				<input type="email" name="user_id" id="user_id" placeholder="이메일 주소 입력" onkeyup="idDupCheck();" class="inp-field_nomargin w235"><input type="button" value="이메일 본인인증" id="emailCheck" class="btn_nomargin w118" onclick="sendEmail();"><br>
				<div id="form_font_left_s" align="left">위 이메일로 인증번호가 발송됩니다. </div>
				<input type="hidden" name="idCheck" id="idCheck" value="0">
			<!-- name -->
				<div id="form_font_left" align="left">사용자 이름  </div>
				<input type="text" name="user_name" id="user_name" placeholder="사용자 이름을 입력해 주세요" class="inp-field"><br>
			<!-- password -->
				<div id="form_font_left" align="left">비밀번호 <span style="color:red; font-size: 8px !important;" id="pwCheckMessage"></span> </div>
				<input type="password" name="user_pw" id="user_pw" placeholder="계정 비밀번호 입력" class="inp-field" onkeyup="pwCheckFunction();"><br>
			<!-- password confirm -->
				<input type="password" name="user_pw2" id="user_pw2" placeholder="비밀번호 재입력" class="inp-field" onkeyup="pwCheckFunction();"><br>
			<!-- date of Birth -->
				<div id="form_font_left" align="left">생년월일 </div>
				&nbsp;<input type="text" name="birthyyyy" id="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
				<input type="text" name="birthmm" id="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
				<input type="text" name="birthdd" id="birthdd" maxlength="2" placeholder="DD" class="inp-field w108">
			<br>
			<!-- phone -->
				<div id="form_font_left" align="left">연락처 </div>
				<input type="text" name="user_phone" id="user_phone" placeholder="연락처를  '-'없이 입력해 주세요 " class="inp-field_nomargin">
		
		</fieldset>
	<!-- rewardU policy check -->	
		<fieldset>
		<span>리듀 개인정보 약관</span>
		<textarea rows="10" cols="47" name="rewardu_policy">
		
			<jsp:include page="./policyForm.jsp"/>
		
		</textarea><br>
		<div class="policy_check">
		<input type="checkbox" name="policy_chk" id="policy_chk">
		<label for="policy_chk">&nbsp;개인정보 수집 및 이용에 동의합니다.</label>
		</div>
		
		</fieldset>
<!-- hidden Welcoming Message -->
<textarea style="display: none;" name="welcomeMSG">
<jsp:include page="./testsending.jsp"/>
</textarea>
		<div class="margin3"></div>
		<fieldset>
			<input type="submit" value="약관동의 및 회원가입" class="btn1 w354"><br>
			<input type="reset" value="다시 입력" class="btn w354">
		</fieldset>
				
		</form>
		
	</div><!-- join_content -->

<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      	<span class="close" onClick="close_pop();">&times;</span> 
            <div class="modal-header">다시 확인해주세요!</div>
            <div id="checkMessage" class="modal-body">
                <p style="text-align: center; line-height: 1.5;">왜??</p>
            </div>
      </div>
 
    </div><!--End Modal-->


	<div class="margin4"></div>
	
</div><!-- container -->

</div><!-- wrap -->

</body>
</html>