<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(function(){
	 $("#reply_btn").click(function(){
	    	if($("#reply_content").val().trim() === ""){
	    		alert("댓글을 입력하세요.");
	    		$("#reply_content").val("").focus();
	    	}else{
	    		$.ajax({
	    			url: "/expro/ReplyWriteAction.do",
	                type: "POST",
	                data: {
	                    no : $("#no").val(),
	                    id : $("#id").val(),
	                    reply_content : $("#reply_content").val()
	                },
	                success: function () {
	                	alert("댓글 등록 완료");
	                	$("#reply_content").val("");
	                	getReply();
	                }
	    		})
	    	}
	    })
	    function getReply(){
	    	$.ajax({
 			url: "/expro/GetReply.do", // 요청 url
             type: "POST", // post 방식
             data: {
             	board_no : ${ content.board_no } // board_no의 값을 넘겨줌
             },
             success: function (json) { // 성공하였을 경우
             	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
             	$("#replyList").text(""); // 댓글리스트 영역 초기화
             	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
             	var replyList = obj.replyList; // replyList는 전달된 json의 키값을 의미
             	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
             	for (var i = 0; i < replyList.length; i++) { // 반복문을 통해 output에 누적
	                    output += "<div class='w3-border w3-padding'>";
 	                for (var j = 0; j < replyList[i].length; j++) {
 	                    var reply = replyList[i][j];
 	                    if(j === 0){
 	     					output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.id + "&nbsp;&nbsp;";
 	                    }else if(j === 1){
 	     					output += "&nbsp;&nbsp;<i class='fa fa-calendar'></i>&nbsp;&nbsp;" + reply.reply_date;
 	                    }else if(j === 2){
 	     					output += "<pre>" + reply.reply_content + "</pre></div>";
 	                    }
 	                };
 	        	};
	              	$("#replyList").html(output); // replyList 영역에 output 출력
	              	$(".reply_count").html(i);
             }
	    	})
	    }
	    getReply(); // 해당 페이지 실행 시 해당 함수 호출
})

</script>
<body>

	<div class="ma2">


		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			<p style="color: #4a4a4a; font-size: 15px; line-height: 20px; margin-bottom: 5px;">댓글
				작성 유의사항</p>
			<ul style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
				<li>펀딩 취소와 리워드 옵션 및 배송지 변경은 펀딩 기간(2019.01.08 ~ 2019.01.22)동안만 <a href="/web/wmypage/myfunding/fundinglist">펀딩 내역</a>에서 가능합니다.</li>
				<li>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한 답변을 받을 수 있습니다.</li>
				<li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li>
				<li>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수
					있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
		<div>
				<c:if test="${ id == null }">
					<textarea rows="5" cols="50"  readonly>로그인 후 댓글 달기</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 ${ content.id }
					<form>
						<input type="hidden" name="no" id="no" value="${ content.pd_no }"> 
						<input type="hidden" name="id" id="id" value="${ id }">
						<textarea rows="5" cols="50" placeholder="댓글 작성" name="reply_content" id="reply_content"></textarea>
						<input type="button"  id="reply_btn" value="댓글 등록">
					</form>
				</c:if>
			</div>
		</div>
		<div id="replyList"></div>

	</div>
	
	<hr>




</body>
</html>