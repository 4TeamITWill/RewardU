<%@page import="admin_db.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="admin_db.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체보기</title>
	<style type="text/css">
		
		#content{
			border:1px solid black;
			max-width:auto;
			
		}
		#img{
			border: 1px solid gray;
			border-radius: 1ex;
			width: 280px; 
			height: 180px; 
			overflow: hidden;
			
		}
		#img img{
			max-width: 100%; 
			height: auto;
		}
		#subject{
			font-weight: bold;
			margin-left: 1px; 
		}
		#subject strong{
			color:black;
		}
		#subject span{
			font-size:small;
			color: gray;
		}
		#bar{
			height: 3px;
			position: relative;
			background-color: #e6eaed;
			width:100%;
			
		}
		#bar1{
			float:left;
			height: 3px;
			position: relative;
			background-color: #9966FF;
		}
		#money{
			color: gray;
		}
		#pro{
			float:left;	
		}
		#day{
			float:right;
			font-weight: bold;
		}
		#pro strong{
			font-weight: bold;
			color: #9966FF;
		}
	</style>
</head>
<body>
<%String id = (String)session.getAttribute("id"); %>
	<table id="container" align="center">
		<c:forEach var="list" items="${requestScope.list}" varStatus="status">
		<c:if test="${status.index mod 3 eq 0 }">
		<tr id="contents">
		</c:if>
			<td id="content" align="center">
				<div id="img">
					<a href="./Content.ad?pd_no=${list.pd_no}&user_id=<%=id%>">
						<img src="./upload/${list.pd_realfile}">
					</a>
				</div>
				<div id="subject" align="left">
					<a href="./Content.ad?pd_no=${list.pd_no}&user_id=<%=id%>">			        	
			        	<strong>${list.pd_subject }</strong>
			        	<br>
			        	<span>${list.pd_category } ː</span>
			        	<span>${list.user_id}</span>
					</a>
				</div>	
				<div id="bar">  
					<c:set var="pro" value="${(list.pd_curmoney/list.pd_goalmoney)*100 }"/>
					<span id="bar1" style="width:${pro}%;"></span>
				</div>
				<div id="money" align="left">
					<div id="pro">
						<strong><fmt:formatNumber value="${pro }" pattern="0"/>%</strong> · ${list.pd_curmoney }원
					</div>
					<div id="day" align="right"> 
						<jsp:useBean id="toDay" class="java.util.Date"/>
						<fmt:formatDate value="${toDay }" var="startDay" pattern="yyy-MM-dd"/>
						<fmt:parseDate value="${startDay }" var="strPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${list.pd_end }" var="endPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
						${endDate - strDate }일 &nbsp;남음
					</div>
				</div>
			</td>
		</c:forEach>					
		</tr>
	</table>
</body>
</html>