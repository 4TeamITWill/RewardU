<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 | 회원아이디, 비밀번호 찾기</title>
<link href="css/etc.css" rel="stylesheet">
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

.wrap {
	padding: 80px 150px;
	background-color: #efedea;
}

.container {
/* 	margin: 70px 200px; */
/* 	border: 1px solid red; */
	/* background-color: #aaa; */
}

.form_container {
	border: 1px solid #aaa;
	width: 400px;
	text-align: left;

	background-color: #fff;
}

#find_id_form #form_font_left {
 text-align: left;

}
#find_id_form, #find_pw_form {
	padding-left: 25px;
}

</style>
<script type="text/javascript">

	

/* 	function findId(){
	
		var user_id = $("#user_id").val();
		var user_phone = $("#user_phone").val();
		var birthyyyy = $('#birthyyyy').val();
		var birthmm = $('#birthmm').val();
		var birthdd = $('#birthdd').val(); 
		
		$.ajax({
			
			url: './MemberFindIdAction.me', 
			data: {user_id: user_id,user_phone: user_phone, birthyyyy: birthyyyy, birthmm: birthmm, birthdd: birthdd},
			success:function(data){
		
					$('.modal-header').html("인증메일 발송 확인!");
					$('#checkMessage').html(data);
					$('#myModal').show();
				
			},beforeSend:function(){
		        $('.wrap_loading').css("visibility", "visible");
		    }
		    ,complete:function(){
		       $('.wrap_loading').css("visibility", "hidden");
		
		    }, error: function(){
				alert("외 않되?");
			}
				
		});
   
	}
	 */
	
	function findPw(){
			
		 var user_id = $("#user_id").val();
			var user_phone = $("#user_phone").val();
			var birthyyyy = $('#birthyyyy').val();
			var birthmm = $('#birthmm').val();
			var birthdd = $('#birthdd').val(); 
			var blank_pattern = /[\s]/g;
			
			
			
		/* $.ajax({
			url: './MemberFindPwAction.me',
			data :  {user_id: user_id, birthyyyy: birthyyyy, birthmm: birthmm, birthdd: birthdd, user_phone: user_phone},
			success: function(data){
				
				$('#checkMessage').html('회원님의 이메일로 비밀번호가 전송되었습니다.');
				$('#myModal').show();
					
			},beforeSend:function(){
			       $('.wrap_loading').css("visibility", "visible");
			   }
			   ,complete:function(){
			       $('.wrap_loading').css("visibility", "hidden");
			       
			   },error:function(){
			   	alert("정보 전송에 실패했습니다.");
			   }
		}); */
					
	}
	
	
	function close_pop(flag) {
        $('#myModal').hide();
   };

	
</script>

</head>
<body>


<div class="wrap">

<div class="container" align="center">
	<div class="form_container">
		<div id="find_id_form">
			<div id="findFrom_header">아이디 찾기</div>
			
			<form action="./MemberFindIdAction.me" id="find_id" method="post">
			<!-- phone -->
				<div id="form_font_left" align="left">연락처</div>
				<input type="text" id="user_phone" name="user_phone" placeholder="가입시 기입했던 연락처를 '-'없이 입력해 주세요 " class="inp-field"><br>
			<!-- date of Birth -->
				<div id="form_font_left" align="left">생년월일</div>
				<input type="text" id="birthyyyy" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
				<input type="text" id="birthmm" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
				<input type="text" id="birthdd" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w108"><br>
				
				<!-- <input type="button" value="아이디 찾기" class="btn1" onclick="findId();"> -->
				<input type="submit" value="아이디 찾기" class="btn1" >
			</form>
		</div><!-- find_id_form -->
		
		<div class="margin2"></div>
		
		<div id="find_pw_form">
			<div id="findFrom_header">비밀번호 찾기</div>
			
			<form action="./MemberFindPwAction.me" id="find_pw" method="post">
			<!-- id -->
				<div id="form_font_left" align="left">아이디</div>
				<input type="text" id="user_id" name="user_id" placeholder="ex) example@rewardu.com" class="inp-field"><br>
			<!-- phone -->
				<div id="form_font_left" align="left">연락처</div>
				<input type="text" id="user_phone" name="user_phone" placeholder="가입시 기입했던 연락처를 '-'없이 입력해 주세요 " class="inp-field"><br>
			<!-- date of Birth -->
					<div id="form_font_left" align="left">생년월일</div>
					<input type="text" id="birthyyyy" name="birthyyyy" maxlength="4" placeholder="YYYY" class="inp-field w120">
					<input type="text" id="birthmm" name="birthmm" maxlength="2" placeholder="MM" class="inp-field w108">
					<input type="text" id="birthdd" name="birthdd" maxlength="2" placeholder="DD" class="inp-field w108"><br>
				
				<input type="submit" value="비밀번호 찾기" class="btn1" >
			</form>	
			<div class="margin3"></div>
		</div><!-- find_pw_form -->
	<!-- button for Main -->	
		<div align="center">
		<hr>
			<div class="margin3"></div>
			<input style="text-align: center; width: 398px;" class="btn" value="메인으로" onclick="location.href='./Main.me'">
			<div class="margin3"></div>
		</div>
	</div><!-- form_container -->
	
</div><!-- container -->
</div><!-- wrap -->

<!-- Loading Bar -->
	<div class="wrap_loading" style="visibility:hidden;">
		<div id="loadingBar" align="center" >
			<img src="img/redu_loadingBar.gif" >
		</div>
	</div>
	

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

</body>
</html>