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

<style>
div.logo {
	height: 200px;
	width: 100%;
}

h2.logotext {
	position: absolute;
	top: 200px;
	left: 50;
	width: 100%;
	font-weight: bold;
	font-size: 15px;
	color: #8a80a0;
	letter-spacing: 0px;
	font-family: arial;
}

div.ma0{
	margin-top : 50px;
	height: 60px;
	width: 100%;
	text-align: center;
}




div.ma {
	
	margin-top: 30px;
	
}
hr {
  border: 0;
  border-top: 1px solid #8c8c8c;
  border-bottom: 1px solid #fff;

	margin-left: 470px;
	margin-right: 470px;
}
div.ma2 {
	margin-left:470px;
	margin-right:470px;
	text-align: left;
	
}

div.ma3 {
	margin-left:auto;
	margin-right: auto;
	text-align: center;
}

div.ma4 {
	margin-left:auto;
	margin-right: auto;
	text-align: center;
}


/* div 영역안을 가운데 정렬하기 위해 씀 . 조건 text-align : center; */
div.in {
	display: inline-block;
	
	
}


</style>


    
</head>
		
<body>
	
		
	<div class="logo">
	<%
	String id = (String)session.getAttribute("id"); 
			int pd_no = Integer.parseInt(request.getParameter("pd_no"));
			BoardDAO bdao = new BoardDAO();
			BoardBean bdto = new BoardBean();
			bdto = bdao.getBoard(pd_no);
		%> 
		<img src=" ./upload/<%=bdto.getPd_realfile() %> " style="opacity: 0.2" height="100%"
			width="100%">
		<h2 class="logotext">여기 텍스트는 pd_no 를 받아 따로 db에 저장해야겠군(설명)</h2>
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
		<table border="1px" width="500px">
			
				<tr>
					<td> 
						<a href="index.jsp?center=ContentInfo.jsp&gogo=star/Content1.jsp&pd_no=<%=pd_no %>&user_id=<%=id%>">펀딩소개</a>
					 </td> 	
					<td><a href="index.jsp?center=ContentInfo.jsp&gogo=star/reviewwrite.jsp&pd_no=<%=pd_no %>&user_id=<%=id%>" class="go_btn">댓글</a></td>
					<td>
						<a href="index.jsp?center=ContentInfo.jsp&gogo=star/reviewwrite.jsp">dd</a>
					</td>
					<td>움직여라 좀 </td>
				</tr>
	
		</table>
		</div>
	</div>
	
	<hr>
	
		 <c:set var="gogo" value="${param.gogo}"/>
			<c:if test="${gogo == null}"> 
		 			<c:set var="gogo" value="star/Content1.jsp"/>
			 </c:if>
			 
			 <jsp:include page="${gogo }"/>
			
	<%-- <div class="ma">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td><img alt="" src="" width="500"
					height="500"></td>

				<td><jsp:include page="star/day.jsp" /></td>
			</tr>
	
		</table>
		<hr>
		
	</div>
	<div class="ma2" >
		<%
			int pd_no = Integer.parseInt(request.getParameter("pd_no"));
			BoardDAO bdao = new BoardDAO();
			BoardBean bdto = new BoardBean();
			bdto = bdao.getBoard(pd_no);
		%>
			<div style="padding:20px;  background:#CEECF5; border-radius: 20px;	">
		          <p style="color:#8a80a0;font-size:13px;line-height:20px;margin-bottom:10px; ">
		        	  <strong>목표 금액</strong> <%=bdto.getPd_goalmoney()%> 원 &nbsp; &nbsp; <strong>펀딩기간</strong> <%=bdto.getPd_startf()%> - <%=bdto.getPd_endf()%>
		          </p>
		          
		          
		          <p style="color:#4a4a4a;font-size:12px;line-height:19px;"><strong>100% 이상 모이면 펀딩이 성공되는 프로젝트</strong><br>
         			 이 프로젝트는 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</p>
          
   
          
       		 </div>
				
	</div>
	<hr>
	<div class="ma3">
		<div class="in">
			상품 내용설명 및  하단 부분 
		</div>
	
	</div>
	
	<hr>
	<div class="ma4" id="ma4">
		<div class="in">
			댓글 만들기 
		</div>
	</div --%>>
<button type="button" class="back-to-top">
    <h3 align="right">Top</h3>
   	</button>


</body>
</html>