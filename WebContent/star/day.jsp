<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>

/* 남은일수구하기 */
#dday {
	font-weight: bold;
	font-size: 15px;
	color: #8a80a0;
	letter-spacing: 0px;
	font-family: arial;
	margin-left: 20px;
}
</style>
<title>첫번쨰 content</title>

</head>
<body>
	<table>
		<tr>
			<td>
				
			
			???
				<!-- <script>
				
				var now = new Date(); //오늘날짜
				var then = new Date( 'January 25,2019' ); //최종 목표
				var gap = now.getTime() - then.getTime();
				gap = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1; // d- day 계산

				document.write('<div id="dday"><span style="font-size:33px;">'
						+ gap + '일남음  </span>2019.1.25일마감</div>');
				
				document.write('<div id="dday"><span style="font-size:33px;">'
						+ '원 </span>0원 목표금액</div>');
				document.write('<div id="dday"><span style="font-size:33px;">'
						+ '명 </span>참가하였습니다<div>');
				</script> -->
			</td>
		</tr>
	</table>
	
	
	

	
	<!-- 좋아요 기능  -->
	<%
	String id = (String)session.getAttribute("id"); //접속한 사용자 id받기 
	int pd_no = Integer.parseInt(request.getParameter("pd_no")); //해당 게시글 번호 받기
	
	BoardBean bdto = new BoardBean();
	BoardDAO bdao = new BoardDAO();

	int GoodStatus = -1; //좋아요 상태 구분 변수
	
	bdto = bdao.getBoard(pd_no); //게시글 번호를 넘겨주어 해당 게시글번호에 해당하는 board테이블 객체얻음
	GoodStatus = bdao.GoodStatus(id, pd_no); //사용자 아이디와, 해당 게시글 번호를 넘겨주어 사용자가 이 게시글에 좋아요눌러놓은 상태인지 아닌지 구분함
												//눌러놨으면 GoodStatus에는 1이 , 아니라면 0이 대입
%>
<%
	id = (String)session.getAttribute("id");
	if(id==null){//로그인한 상태가 아닐 때 리워드 신청을 하면 로그인페이지로 이동하게끔
%>
	<input type="button" value="지금펀딩하기" onclick="location.href='./MemberLogin.me'">
<%
	} else{
%>
	<input type="button" value="지금펀딩하기" onclick="location.href='./getFunding.ad?pd_no=<%=pd_no%>&user_id=<%=id%>'">
<%
	}
%>
	<button>공유</button>

	<script type="text/javascript">
	$(document).ready(function() { 
		//좋아요 눌렀을 시
		$(".good_img").on("click", function() {
			
				$.ajax(
					{
						type : 'get',
						url : "star/goodAction.jsp",
						//요청할 데이타 (사용자 아이디와 게시글 번호를 넘겨준다.)
						data : { user_id : "<%=id%>", pd_no : "<%=pd_no%>"},
						//응답데이터의 타입 지정   -> json :  json은 javascript의 객체 형태로 받는다.
						dataType : "json",
						//요청에 성공 했을떄...응답데이터 받기 
						success : function(responseData, status, jqxhr){
							//좋아요를 했다면
							if(responseData.result == 1){
								$('.good_qty').html('좋아요 수 ' + responseData.good_qty);
							}
							//좋아요 취소했다면
							else if(responseData.result == 0){
								$('.good_qty').html('좋아요 수 ' + responseData.good_qty);
							}
						},
						//요청에 실패 하면..
						err : function(jqxhr, status, error){
							//에러 정보를 웹브라우저의 콘솔 탭에 출력
							console.log(error);
						}
		
					} //중괄호의 닫는 부분 
				); //ajax닫는부분
		});// $.ajax메소드의 닫는 부분
	});//ready함수 닫는 부분 	
</script>
	
	<%
	
	if(id == null){ //접속한 사용자가 없다면
%>
		
		 <!-- 좋아요가 안된 상태의 이미지이고 좋아요 수만 노출, 클릭해도 아무 변화 없음-->
		<!-- <img src="img/good_off.png" style="width: 100px; height: 100px;" > -->
			<button><label class="good_qty">좋아요 수 <%=bdto.getPd_good()%></label></button>
<%
	} else { //접속한 사용자가 있다면 
		if(GoodStatus==1){//좋아요 눌러놓은 상태라면
%>
			<!-- <img src="img/good_on.png " class="good_img"> --> 
			
		<button class="good_img"><label class="good_qty">좋아요 수 <%=bdto.getPd_good()%></label></button>
<%
		} else{ //좋아요를 눌러놓은 상태가 아니라면
%>
			<!-- <img src="img/good_off.png"  class="good_img"> --> 
			
			<button class="good_img"><label class="good_qty">좋아요 수 <%=bdto.getPd_good()%></label></button>
<%
		}
	}
%>

	<!-- 좋아요 기능  끝 -->
	
	
	
	
	
	<!-- sns 공유 ,,-->
	<div class="SNS_Share_Top hidden-xs">
		<!-- Share on Twitter -->
		<a href="#"
			onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
+encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog',
 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=30,width=60');return false;"
			target="_blank"><img src="./img/Twitter.png" width="50"
			height="50"></a>

		<!-- Share on Facebook -->
		<a href="#"
			onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='
+encodeURIComponent(document.URL)+'&amp;t='+encodeURIComponent(document.title), 'facebooksharedialog',
 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=30,width=60');return false;"
			target="_blank"> <img src="./img/Facebook.png" width="50"
			height="50"></a>

		<!-- Share on Google+ -->
		<a href="#"
			onclick="javascript:window.open('https://plus.google.com/share?url='+encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=35,width=60');return false;"
			target="_blank"> <img src="./img/Google_Plus.png" width="50"
			height="50"></a>

		<!-- Share on Kakaostory -->
		<a href="#"
			onclick="javascript:window.open('https://story.kakao.com/s/share?url='+encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=40,width=60');return false;"
			target="_blank"> <img src="./img/Kakao_Story.png" width="50"
			height="50"></a>

		<!-- Share on Naver -->
		<a href="#"
			onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url='
+encodeURIComponent(document.URL)+'&amp;title='+encodeURIComponent(document.title),
 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=60,width=60');return false;"
			target="_blank"> <img src="./img/Naver.png" width="50"
			height="50"></a>
	</div>
<!-- sns 공유 ,,-->
	<br />
<!-- 이 게시물에 대한 평점  -->	


		
<!-- 이 게시물에 대한 평점  마무리 -->
	<br />


	<br />


</body>
</html>