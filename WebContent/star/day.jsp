<%@page import="com.sun.corba.se.impl.encoding.CodeSetConversion.BTCConverter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>


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

/* 기본 글짜색 깔 */
.txt{
	color: #8a80a0;
}


/* 남은일수구하기 */
#dday {
	font-weight: bold;
	font-size: 15px;
	color: #8a80a0;
	letter-spacing: 0px;
	font-family: arial;
	margin-left: 20px;
}


/* 버튼  */
.btn {
			background-color: #CEECF5;
			display: inline-block;
			height: 70px;
			width: 200px;
			padding: 15px 30px;
			margin: 10px;
			border: none;
			outline: none;
			border-radius: 20px;
			text-align: center;
			text-decoration: none;
			font-size: 22px;
			cursor: pointer;
			box-shadow: 0 5px #B0B0B0;
			color: #8a80a0;
		}
		.btn:hover { background-color: #CEECF5; }
		.btn:active {
			background-color: #CEECF5;
			box-shadow: 0 5px #808080;
			transform: translateY(3px);
		}
.button4 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
   	width: 100px;
   	height: 50px;
}

.buttonstar {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
   	width: 100px;
   	height: 50px;
}

/* 별점 */
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
		
</style>
<title>첫번쨰 content</title>

</head>
<body>
	<!-- 좋아요 기능, d-day, 금액   -->
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

	<table>
		<tr>
			<td>
				
				 <script>
				var now = new Date(); //오늘날짜
				var then = new Date('<%=bdto.getPd_endf()%>'); <%-- 최종 목표 --%>
				var gap = now.getTime() - then.getTime();
			 	gap = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1; // d- day 계산 
			 	if(gap <= 0){
			 	 document.write('<div id="dday"><span style="font-size:33px;">'
			 	 			+ '종료  </span><%=bdto.getPd_endf()%> 일마감</div>'); 
			 	}else{
		 		 document.write('<div id="dday"><span style="font-size:33px;">'
							+ gap + '일남음  </span><%=bdto.getPd_endf()%> 일마감</div>');  
			 	}
		
				document.write('<div id="dday"><span style="font-size:33px;">'
						+ '<%=bdto.getPd_curmoney()%>원 </span><%=bdto.getPd_goalmoney()%>원 목표금액</div>');
				document.write('<div id="dday"><span style="font-size:33px;">'
						+ '<%=bdto.getPd_participant()%>명 </span>참가하였습니다<div>');
			//	document.write(now);

			//	document.write(then);
				</script>
				 
			</td>
		</tr>

	</table>
	<table>
		<tr>	
			<td>
<%	
				if(session.getAttribute("id")==null){
%>
				<input type="button" class="btn" value="지금펀딩하기" onclick="alert('로그인 후 사용가능합니다.');">
<%					
				}
				else if(bdto.getPd_result()==0){ //아직 펀딩이 진행 중이면
%>
				<input type="button" class="btn" value="지금펀딩하기" onclick="location.href='./getFunding.ad?pd_no=<%=pd_no%>&user_id=<%=id%>'">
<%
				} else{ //펀딩이 종료됬다면
%>
				<input type="button" class="btn" value="지금펀딩하기" onclick="alert('기간이 종료되었습니다.');">
<%
				}
		
%>
				
			</td>
		</tr>		
		<tr>
				<td></td>
		</tr>
	</table>
	
	

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
								$('.good_qty').html(responseData.good_qty); 
							}
							//좋아요 취소했다면
							else if(responseData.result == 0){
								$('.good_qty').html(responseData.good_qty);
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
		
		//좋아요 클릭했을 시
		$(".good_img").click(function() {
			if($(".good_img").attr("src") == "img/love_off.png"){
				$(".good_img").attr("src",$(".good_img").attr("src").replace("_off.png","_on.png"));
			} else
				$(".good_img").attr("src",$(".good_img").attr("src").replace("_on.png","_off.png"));
		});
		
	});//ready함수 닫는 부분 	
</script>
	<div class= "like" style="margin-left: 10px;">
	<%
	
	if(id == null){ //접속한 사용자가 없다면
%>
		
		 <!-- 좋아요가 안된 상태의 이미지이고 좋아요 수만 노출, 클릭해도 아무 변화 없음-->
		<button class="button4"><img src="img/love_off.png" style="width: 20px; height: 20px;" ><label class="good_qty"><%=bdto.getPd_good()%></label></button>
<%
	} else { //접속한 사용자가 있다면 
		if(GoodStatus==1){//좋아요 눌러놓은 상태라면
%>

			
		<button class="button4"><img src="img/love_on.png" class="good_img" style="width: 20px; height: 20px;"><label class="good_qty"><%=bdto.getPd_good()%> </label></button>
<%
		} else{ //좋아요를 눌러놓은 상태가 아니라면	
%>	
		 <button class="button4"><img src="img/love_off.png" class="good_img" style="width: 20px; height: 20px;"><label class="good_qty"><%=bdto.getPd_good()%> </label></button>
<%
		}
	}
%>
		<% 
		double avg = bdao.avgReview(pd_no);
		%>
		
		<script type="text/javascript">
		$(document).ready(function() { 
					
			$(".buttonstar").show(); 

            $(".buttonstarrate").hide(); 


			
			$(".buttonstar").on("click", function() {
				<%
					if(id==null){
					%>
						alert("로그인해주세요");	
					<%
					}else{
					%>
						$(".buttonstarrate").slideToggle('3000');
						
					<%
					}
				%>
				
			});
		});	
		
		</script>
		<button class="buttonstar"><img src="img/star.jpg" style="width: 20px; height: 20px;"><%=avg %></button>
		<div class=buttonstarrate>
		
			<form action="./StarWriteActions.ad" method="post">
			<input type="hidden" name="pd_no" value="<%=pd_no%>">
			<input type="hidden" name="user_id" value="<%=id%>">
			<span class="star-input"> 
			<span class="input"> 
			<input type="radio" name="pd_rate" value="1" id="p1"> 
				<label for="p1">1</label> 
			<input type="radio" name="pd_rate" value="2" id="p2">
				 <label for="p2">2</label> 
			<input type="radio" name="pd_rate" value="3" id="p3"> 
				<label for="p3">3</label>
			<input type="radio" name="pd_rate" value="4" id="p4"> 
				<label for="p4">4</label> 
			<input type="radio" name="pd_rate" value="5" id="p5"> 
				<label for="p5">5</label>
			</span> 
			</span>
		<div>

			<button type="submit" class="button4">별점평가</button>

			</div> 
			</form>
					
		
		</div><!--class= buttonstarrate -->
			</div>
	<!-- 좋아요 기능  끝 -->
	
	<br/>
	

	<!-- sns 공유 ,,-->
	<div class="SNS_Share_Top hidden-xs" style="margin-left: 5px;">

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