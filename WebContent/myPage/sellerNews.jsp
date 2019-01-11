<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<%
	String id = (String)session.getAttribute("id");
%>

</head>
<body>
	
<div style="width : 800px; margin : 0 auto; background-color : rgba(240,240,240,0.6);">	
	
	
	<!-- 세션 아이디와 글쓴 아이디가 같을때 버튼 보이게 -->
	<div>		
		<div class="sNewsWrite_div" >
		<div style="border-bottom : 0.5px solid rgba(20,60,240,0.6); padding : 8px;">
			<font style="font-weight : 550; ">소식 쓰기</font>
		</div>
		<br/>
		
			<input type="hidden" name="parent_no" id="parent_no" value="${pd_no }">
			<input type="hidden" name="user_id" id="user_id" value="${id }">
			<div><input type="text" name="sell_subject" id="sell_subject" placeholder="제목을 입력하세요"></div>
			<div>
			<textarea name="sell_content" id="textAreaContent" rows="20"  style="width : 100%"></textarea>
			</div>
			<button id="insert" type="button">작성</button>			
		</div>
	</div>
	
	
	<div>
		<c:if test="${count == false }">
			<div>등록된 소식이 없습니다</div>
		</c:if>
		<c:if test="${count == true }">
			<c:forEach var="sellerNews" items="${sNewsList }">
				<div id="sellerNewsList">
					<div class="list_no"><font style="color : rgba(255,0,130,0.9); font-weight : bold; font-size : 17px;"># ${sellerNews.pd_no }</font></div>
					<div class="list_subject" >&nbsp;&nbsp;<font style="font-size : 19px; font-weight : 550;">${sellerNews.sell_subject }</font></div>
					<div class="list_content">${sellerNews.sell_content }</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

</div>

<script>

//스마트 에디터 부분
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
  oAppRef: oEditors,
  elPlaceHolder: "textAreaContent",
  sSkinURI: "./se2/SmartEditor2Skin.html",
  fCreator: "createSEditor2"
});

$("#insert").click(function(){

  // 에디터의 내용이 textarea에 적용된다.
  oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);

  // 에디터의 내용에 대한 값 검증은 이곳에서
  // document.getElementById("textAreaContent").value를 이용해서 처리한다.
 	var user_id = $("#user_id").val();
	var sell_content = $("#textAreaContent").val();
	var sell_subject = $("#sell_subject").val();
	var parent_no = $("#parent_no").val();
		
	$.ajax({
		url:"sellernewsAction.my",		
		data : {user_id : user_id, sell_content : sell_content, sell_subject : sell_subject},
		success : function(data){
			alert("작성하였습니다.");
			$("body").html(data);
		}
		
	});
 
}); 

//textArea에 이미지 첨부
function pasteHTML(fname){
	var sHTML = "<img src='http://localhost:8080/RewardU/upload/"+fname+"'>";
  oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);

}


$("#fileBtn").click(function(event){
  window.open("fileUp.jsp","파일첨부","width=500,height=500,scrollbars=yes,top=100,left=40,resizable=yes");
  event.preventDefault();
});



</script>	
	

</body>
</html>