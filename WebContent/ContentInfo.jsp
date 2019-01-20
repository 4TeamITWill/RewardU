<%@page import="admin_db.ReplyDAO"%>
<%@page import="javax.print.attribute.standard.PDLOverrideSupported"%>
<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean1"%>
<%@page import="admin_db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>펀딩정보</title>

<style type="text/css">


/* a 링크 방문전 방문후 색깔변화 없애기 */
A:link{
	color: #8a80a0;
}
A:visited{
	color :#8a80a0;
}

/* 로고 이미지  */
.logoimage{

filter: blur(5px) brightness(90%) saturate(70%);			
		
width: 100%;
height: 100%;

	 
}

/* 로고  */
div.logo {
	height: 200px;
	width: 100%;
	position: relative;
}
/* 로고 제목 위  */
h2.logot {
	position: absolute;
	top: 30%;
	left: 50%;				
	width: 100%;
	text-align : center;	
	font-weight: 900;
	font-size: 20px;
	color: #ddd;
	letter-spacing: 0px;
	font-family: arial;
	transform: translate( -50%, -50% );
}


/* 로고 제목 */
h2.logotext {
	position: absolute;
	top: 50%;
	left: 50%;		
	width: 100%;
	text-align : center;	
	font-weight: 900;
	font-size: 30px;
	font-family: 'Bon Gothic'; 
	color: white;
	letter-spacing: 0px;
	font-family: arial;
	transform: translate( -50%, -50% );
}

div.ma0{
	margin-bottom:20px;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: #b44af7;
}
div.ma0 a{color: #000;}

/* div.ma {
	
	margin-top: 30px;
	
} */

/* body hr 속성 주기  */
hr.body{
 border-top : 2px double #bbb; text-align: center; 
 margin-left: 470px;
 margin-right: 470px;
}

div.ma2 {
	margin-left:400px;
	margin-right:720px;		
	text-align: left;
	
}

div.ma3 {
	margin-left:400px;
	margin-right:720px;
	
}

div.ma4 {
	margin-left:auto;
	margin-right: auto;
	text-align: center;
}


/* div 영역안을 가운데 정렬하기 위해 씀 . 조건 text-align : center; */
div.in {
	display: inline-block;
	margin-top: 13px;
}


/* 메뉴바 css */
  #menubar {
   position: relative;
 	 font-size: 20px;	
 	 font-family: arial;
 	 font-weight: bold;
 	 color:white;
}



</style>

</head>
		
<body>
	<%
	String id = (String)session.getAttribute("id"); 
			int pd_no = Integer.parseInt(request.getParameter("pd_no"));
			BoardDAO bdao = new BoardDAO();
			BoardBean bdto = new BoardBean();
			bdto = bdao.getBoard(pd_no);
			ReplyDAO bdo = new ReplyDAO();
			bdo.reply(pd_no);
			
		%> 
		
	<div class="logo">
	
		<img src=" ./upload/<%=bdto.getPd_realfile() %>" class="logoimage">	
		<h2 class="logot"># <%=bdto.getPd_category() %></h2>	
		<h2 class="logotext"><%=bdto.getPd_subject() %></h2>
	</div>
	
	
	<!--내가원하는 위치로이동하기   -->
<script type="text/javascript">
		$(document).ready(function() {
			$(".go_btn").click(function(event) {
				event.prevenDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},500);
				
			});
			
		});
	</script>

	<div class = "ma0">
		<div class="in">
		<table width="800px" style="table-layout: fixed;" >
				<tr>
					<td> 
						<a href="index.jsp?center=ContentInfo.jsp&gogo=star/Content1.jsp&pd_no=<%=pd_no %>&user_id=<%=id%>" class="intro_a" id="menubar">펀딩소개</a>
					 </td> 	
					<td><a href="index.jsp?center=ContentInfo.jsp&gogo=star/reviewwrite.jsp&pd_no=<%=pd_no %>&user_id=<%=id%>&group_num=<%=bdo.reply(pd_no) %>" class="go_btn" id="menubar">댓글</a></td>
					<td>
						<a href="sellernews.my?pd_no=<%=pd_no%>&seller_id=<%=bdto.getUser_id()%>" id="menubar">새소식</a>
					</td>
					<td>
						<a href="./supporters.ad?pd_no=<%=pd_no %>" id="menubar">참여하신분들</a>
					</td>
				</tr>
	
		</table>
		</div>
		
	</div>
	
	
	
	<div>
		 <c:set var="gogo" value="${param.gogo}"/>
			<c:if test="${gogo == null}"> 
		 			<c:set var="gogo" value="star/Content1.jsp"/>
			 </c:if>
			 
			 <jsp:include page="${gogo }"/>
			
	</div>



</body>
</html>