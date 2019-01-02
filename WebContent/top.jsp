<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

li {list-style: none;}

a {text-decoration: none;}
.hr{align: center;
	width: 100%; height: 5px;
	background: linear-gradient(90deg, #b44af7, #82caff);  }
fieldset{border:0;}


.h ul {padding : 0; height : 100%; margin : 0; line-height : 65px;}
.h .dropdown01 li {
	display: inline-block;
	color: #aaa;
	height : 100%;
}

.msg_font {
	background-color: #fc291e;
	border-radius: 50%;
	font-weight: none;
	color: #fff;
	font-size: 9pt;
	height: 20pt;
	line-height: 20pt;
	position : relative;
	bottom : 10px;
}

</style>

</head>
<body>
	<div id="top">
		<div class="top_container">
			<div class="h top_sub">
				<ul class="dropdown01" >
					<li><a class="top_menu">펀딩시작하기</a></li>&nbsp;&nbsp;
					<li><a class="top_menu">리듀란?</a></li>&nbsp;&nbsp;
					<li><a class="top_menu">NEWS</a></li>&nbsp;&nbsp;
				</ul>				
			</div>	
			<div class="top_sub top_logo" align="center">
				<a href="index.jsp" ><img src="img/logo02.png" width="135"></a>
			</div>		
			<div class="top_sub top_member">
			<span class="icon-search">검색</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<%
		String id = (String)session.getAttribute("id");
		String admin = (String)session.getAttribute("admin");
	
		if(id==null){
	%>
				<a href="./MemberLogin.me">로그인</a>&nbsp;&nbsp;
				<a href="./MemberJoin.me">회원가입</a>
	
	<%						
		}else{
				MessageDAO mdao = new MessageDAO();
				//int count = mdao.getCountMessage(id); //해당 id가 받은 메시지가 몇 개인지 반환
				int dontReadCount = mdao.getCountDontRead(id); //해당 id가 받은 메시지 중 안읽은 메시지가 몇 개인지 반환

				
		 		if(id.equals("rewardu4@gmail.com")){ //접속한 id가 관리자 계정rewardu4@gmail.com 일 경우
	%>				<!-- 마이페이지 대신 관리자페이지가 나타남 -->
					<a href="./adminPage.ad">관리자페이지</a>&nbsp;&nbsp; 
	<%
		 		} else {//관리자 외에 일반회원일 경우 마이페이지 나타남
	%>			
					<a id="goMypage" style="cursor : pointer;">마이페이지</a>&nbsp;&nbsp;
	<%
		 		}
	%>		
				
				<a href="./MemberMessage_ReceiveList.message"><span class="icon-mail">메시지</span>
	<%
				//받은 메세지가 0이면 숫자안뜸 1이상이면 뜸
				if(dontReadCount > 0){	
	%>							
				<span class="msg_font">&nbsp;<%=dontReadCount%>&nbsp; </span></a> <!-- 클릭하면 메시지함으로 -->
		 		
	<%		
				}
		}	
	%>		
				
			</div>			
		</div>			
	</div>
	
	<div class="hr"></div>

	<!-- <div class="hr" height="50" >&nbsp;</div>	 -->
		<!-- 펼쳐지는 메뉴부분 -->
		<div class="slidedown_menu">
			<div class="menuLine_container">
				<div class="menuLine" >
					<a class = "menu_boss" style="font-size : 1.1rem;">펀딩시작하기</a>
					<a href="링크넣기"  style ="color : #555; font-weight : 550;">리워드 게시판</a>
					<a href="링크넣기"  style ="color : #555; font-weight : 550;">리워드 신청하기</a>
				</div>
				<div class="menuLine">
					<a class = "menu_boss" style="font-size : 1.1rem;">리듀란?</a>
					<a href="링크넣기">이용가이드</a>
					<a href="링크넣기">리워드란?</a>
					<a href="링크넣기">리듀 소개</a>					
					<a href="링크넣기">공지사항</a>
					
				</div>	
				<div class="menuLine">
					<a class = "menu_boss" style="font-size : 1.1rem;">NEWS</a>
					<a href="링크넣기">리듀 소식</a>					
					<a href="링크넣기">리워드 소식</a>
				</div>	
			</div>
		</div>
	

</body>
</html>