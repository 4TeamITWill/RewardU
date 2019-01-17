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
	
<div style="width : 800px; margin : 0 auto;">	
	
	
	<!-- 글쓴 아이디(seller_id)가 세션 아이디(id)와 같을때 버튼 보이게 -->
	<c:if test="${seller_id == id }">
		<div>		
			<div class="sNewsWrite_div" >
			<div>
				<font style="font-weight : 550; ">소식 쓰기</font>
			</div>
			<br/>			
				<!-- 부모글번호와 판매글 id 히든값으로 -->
				<input type="hidden" name="pd_no" id="pd_no" value="${pd_no }"/>
				<input type="hidden" name="seller_id" id="seller_id" value="${seller_id }"/>
				<input type="hidden" name="pd_subject" id="pd_subject" value="${boardbean.pd_subject }"/>
				<div><input type="text" name="sell_subject" id="sell_subject" placeholder="제목을 입력하세요"></div>
				<div>
				<textarea name="sell_content" id="textAreaContent" rows="20"  style="width : 100%"></textarea>
				</div>
				
				<div style="display : flex; justify-content : flex-end;">
					<a id="insert" style="display : block; width : 80px; height : 30px; line-height : 30px; margin-top : 5px;
						cursor : pointer; background-color : rgba(10,50,200,1); color : white; text-align:center; border-radius : 2px;">작 성</a>			
				</div>	
			</div>
		</div>
	</c:if>
	
	
	<div>
		<c:if test="${count <= 0 }">
			<div style="text-align : center; font-weight : 550;">등록된 소식이 없습니다</div>
		</c:if>
		
		<c:if test="${count > 0 }">	
			<c:set var="i" value="${count }"/>				
			<c:forEach var="sellerNews" items="${sNewsList }">
			<input type="hidden" name="no" value="${sellerNews.no }"/>
				<div id="sellerNewsList">
					<div class="list_no"><font style="color : rgba(255,0,130,0.9); font-weight : bold; font-size : 17px;"># ${i }</font></div>
					<div class="list_subject" ><font style="font-size : 18px; font-weight : 550;"> ${sellerNews.sell_subject }</font></div>
					<div class="list_date" style="margin-bottom : 1rem;"><font style="font-size : 13px; color : #888;">&nbsp;|&nbsp;${sellerNews.date }</font></div>
					<div class="list_content">${sellerNews.sell_content }</div>
					<c:if test="${seller_id == id }">
					
						<div style="display : flex; justify-content : flex-end;">
							<a onclick="delajax(${sellerNews.no})" style="display : block; width : 80px; height : 30px; line-height : 30px; margin-top : 5px;
								cursor : pointer; background-color : rgba(10,50,200,1); color : white; text-align:center; border-radius : 2px;">삭 제</a>
						</div>
					</c:if>
				</div>
			<c:set var="i" value="${i - 1 }"/>	
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
 	var seller_id = $("#seller_id").val();
	var sell_content = $("#textAreaContent").val();
	var sell_subject = $("#sell_subject").val();
	var pd_no = $("#pd_no").val();
	var pd_subject = $("#pd_subject").val();
		
	$.ajax({
		url:"sellerNewsWrite.my",		
		data : {pd_subject : pd_subject, seller_id : seller_id, sell_content : sell_content, sell_subject : sell_subject, pd_no : pd_no},
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

function delajax(no){
	
	if(confirm('삭제하시겠습니까?')){
		var no = no;
		var pd_no = $("#pd_no").val();
		var seller_id = $("#seller_id").val();
		
		$.ajax({
			url : "sellerNewsDel.my",
			data : {no : no, pd_no : pd_no, seller_id : seller_id},
			type : "post",
			success : function(data){
				$("body").html(data);
			}
		});
	}
}

</script>	
	

</body>
</html>