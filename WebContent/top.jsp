<%@page import="message.db.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

a {
	text-decoration : none;
}

li {list-style: none;}

a {text-decoration: none;}
.hr{align: center;
	width: 100%; height: 3.5px;
	background: linear-gradient(90deg, #b44af7, #82caff);  }
fieldset{border:0;}
.margin5{margin-top: 10px;}

.h .dropdown01 li {
	display: inline-block;
	line-height: none;
	color: #aaa;
}

</style>

</head>
<body>
	<div id="top">
		<div class="top_container">
			<div class="h">
				<ul class="dropdown01">
					<li><a>펀딩시작하기</a></li>
					<li><a>리듀란?</a></li>
					<li><a>NEWS</a></li>
				</ul>				
			</div>	
			<div class="top_sub top_logo" align="center">
				<a href="index.jsp" ><img src="img/logo02.png" width="135"></a>
			</div>		
			<div class="top_sub top_member">
				
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
	%>
				<a href="./MemberMessage_ReceiveList.message">메시지함</a> <!-- 클릭하면 메시지함으로 -->
		 		<font style="color: red; font-weight: bold; font-size: 15pt;"><%=dontReadCount%></font>
	<% 	
		 		if(id.equals("rewardu4@gmail.com")){
	%>
					<a href="./adminPage.ad">관리자페이지</a>&nbsp;&nbsp;
	<%
		 		} else {
	%>
					<a href="./MemberMypageAction.me">마이페이지</a>&nbsp;&nbsp;
	<%
		 		}
	%>
				<a href="./MemberLogout.me">로그아웃</a>
	<%				
		}	
	%>		
				
			</div>			
		</div>			
	</div>
	<div class="margin5"></div>
	<div class="hr"></div>

	<!-- <div class="hr" height="50" >&nbsp;</div>	 -->
		<!-- 펼쳐지는 메뉴부분 -->
		<div class="slidedown_menu">
			<div>
				메뉴 들어가면 됨
			</div>
		</div>
	

</body>
</html>