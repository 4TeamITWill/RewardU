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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="css/main3.css" rel="stylesheet">
<link href="css/etc.css" rel="stylesheet">


<style type="text/css">
.container{ 
	align: center;
}

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}


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
	
	
	$(document).ready(function(){ 
		
		var fileTarget = $('#user_photo');
		var fakeField = $('.fakeField').val();
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} // 추출한 파일명 삽입 
				/* $('.mypage_profile_photo').mouseover(function(){
					
				}); */
				$('.mypage_profile_photo img').css("filter", "grayscale(100%)");
				//$('.mypage_profile_photo:hover::after').css("display","none");
				$('head').append("<style>.mypage_profile_photo:hover:after {content: none }</style>"); 
				$('.fakeField').html(filename); 
				$('.fakeField').css("display", "inline");
			}); 
		}); 


	function photoSubmit(){
		
		var form = $('#photo_form')[0];
		
		var formData = new FormData(form);

		formData.append("user_id", $("#user_id").val());
		formData.append("user_photo", $("input[name=user_photo]")[0].files[0]);
	
	
		
		 $.ajax({
			url: './MemberAddPhotoAction.me',
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false, 
			type: 'POST',
			success: function(data){

				$('#user_photo').attr("value","user_photo");
				
				location.reload();
			},beforeSend:function(){
		        $('.wrap_loading').css("visibility", "visible");
		    }
		    ,complete:function(){

		       $('.wrap_loading').css("visibility", "hidden");

		    },error:function(){
		    	alert("넌 이것도 못하니?");
		    } 
		}); 
	 	 
	 
	}
 	
	function deleteSubmit(){
		var user_id = $("#user_id").val();
		var user_photo = $("#user_photo").val();
		
		$.ajax({
			url: './MemberPhotoDeleteAction.me',
			data :  {user_id: user_id, user_photo: user_photo},
			success: function(data){
				location.reload();
				
			},beforeSend:function(){
		        $('.wrap_loading').css("visibility", "visible");
		    }
		    ,complete:function(){

		       $('.wrap_loading').css("visibility", "hidden");

		    },error:function(){
		    	alert("프로필 사진 삭제에 실패했습니다.");
		    }
		});
		
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
	
		<div class="mypage_infoCard">
		<!-- User 님 -->
			<div id="infoCardName">${sessionScope.name } 님</div>
		<!-- id email -->
			<div id="infoCardId">${sessionScope.id }</div>
				<input type="button" value="비밀번호 수정" class="btn w175" onclick="location.href='./MemberModifyPw.me'">
			<div id="infoCard_deleteAccount"><a href="./MemberDelete.me">리듀 회원탈퇴</a></div>
		</div>
		
		<div class="mypage_modify_section">
		
			<form id="photo_form" name="photo_form" method="post" enctype="multipart/form-data">
				<div class="margin3"></div>
			<!-- profile photo setting-->
				<div class="profile_photo_upload">
					<div class="mypage_profile_photo">
						
						<label for="user_photo" >
						<c:set var="photo" value="${sessionScope.user_photo }"></c:set>	
							<c:choose>
								<c:when test="${empty photo }">
									<img src="./img/usernull.png">
								</c:when>
								<c:when test="${photo ne null }">
									<img src="./upload/${sessionScope.user_photo }">
								</c:when>
							<%-- 	<c:when test="">
									<img src="../upload/">
								</c:when> --%>
							</c:choose>
							<div class="fakeField" style="display: none; color:#f7005e;">업로드된 파일명이 나타납니다.</div>	
					</div><!-- mypage_profile_photo  -->
					
						</label>
						<input type="file" id="user_photo" name="user_photo" value="${sessionScope.user_photo }" >
						<input type="button" id="photoSave" class="photo_btn" value="저장" onclick="photoSubmit();">&nbsp;<input type="button" class="photo_btn" value="삭제" onclick="deleteSubmit();"><br>
						<div class="margin3"></div>
					</div>
			</form>		
			<form id="m_form" method="post">
				<fieldset> 
				<!-- id -->
						<div id="form_font_left" align="left">내 아이디 </div>
						<input type="text" id="user_id" name="user_id" value="${sessionScope.id }" class="inp-field" readonly><br>
				<!-- name -->
						<div id="form_font_left" align="left">사용자 이름 </div>
						<input type="text" name="user_name" value="${mbean.user_name } " class="inp-field"><br>
				<!-- date of Birth -->
						<div id="form_font_left" align="left">생년월일 </div>
						<input type="text" name="birthyyyy" value="${mbean.birthyyyy }" class="inp-field w120" readonly>
						<input type="text" name="birthmm" value="${mbean.birthmm }" class="inp-field w108" readonly>
						<input type="text" name="birthdd" value="${mbean.birthdd }" class="inp-field w108" readonly><br>
				<!-- phone -->
						<div id="form_font_left" align="left">연락처 </div>
						<input type="text" name="user_phone" value="${mbean.user_phone }" class="inp-field"><br>
				<!-- content --> 
						<div id="form_font_left" align="left">자기소개 및 하고싶은 말</div>
						<textarea wrap="hard" placeholder="자기 소개글을 입력해 보세요!(100자 이내)"  name="user_content">${mbean.user_content }</textarea>
					
					</fieldset>
					<fieldset>
						<input type="button" value="정보수정" class="btn1 w354" onclick="modify();"><br>
					
						<input type="button" value="메인으로" class="btn w354" onclick="location.href='./Main.me'">
						<div class="margin3"></div>
					</fieldset>
							
			</form>
		</div>	
		

		
	</div><!-- mypage_content -->

</div><!-- container -->

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
            <div id="checkMessage" class="modal-body" style="border-bottom: 1px solid #aaa; ">
                <p style="text-align: center; line-height: 1.5;">왜??</p>
            </div>
            <div class="modal-footer1">
            <input type="button" id="modal-btn4" value="전송" onclick="modifySubmit();"><input type="button" id="modal-btn4" style="border-left: 1px solid #aaa;" value="취소" onclick="location.reload();">
            </div>
      </div>
 
    </div><!--End Modal-->

</div><!-- wrap -->


</body>
</html>