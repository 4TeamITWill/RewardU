<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

a {text-decoration: none;}
.hr{align: center;
	width: 100%; height: 3.5px;
	background: linear-gradient(90deg, #b44af7, #82caff);  }
fieldset{border:0;}
.margin5{margin-top: 10px;}

</style>

</head>
<body>
	<div id="top">
		<div class="top_container">
			<div class="top_sub top_logo">
				<a href="index.jsp" >리듀</a>
			</div>
			<div class="h">
				<ul class="dropdown01">
					<li >펀딩시작하기</li>
					<li >리듀란?</li>
					<li >NEWS</li>
				</ul>				
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
	%>
			
				<a href="./MemberMypageAction.me">마이페이지</a>&nbsp;&nbsp;
			
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