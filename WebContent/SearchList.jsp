<%@page import="reward.db.RewardDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="reward.db.RewardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
		
		#content{
			max-width:auto;
			padding: 20px;
		}
		#img{
			border: 1px solid gray;
			border-radius: 1px;
			width: 280px; 
			height: 180px; 
			overflow: hidden;
			
		}
		#img img{
			max-width: 100%; 
			height: 100%;
			width: 100%;
		}
		#subject{
			font-weight: bold;
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
			overflow: hidden;
			
		}
		#bar1{
			float:left;
			height: 3px;
			position: relative;
			background-color: #9966FF;
			overflow: hidden;
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
		#deadline{
			float: inherit;
			background-color: #9966FF;
			font-weight: bold;
			color: white;
			font-size: small;
			border: 1px solid #9966FF;
		}
	</style>
</head>
<body>


<%
String keyWord = request.getParameter("keyWord");	
String id = (String)session.getAttribute("id"); 
%>

<h3 align="center">&nbsp;&nbsp;<font size="5"><%=keyWord%></font>&nbsp;&nbsp;의 검색 결과 입니다.</h3>

	<c:set var="count" value="${count }"/>
	<c:choose>
		<c:when test="${count eq 0 }">
			<div align="center">
				<h4>게시물이 없습니다.</h4>
			</div>
		</c:when>
		<c:when test="${count ne 0 }">
		<h4 align="center">${count}개의 결과를 찾았습니다.</h4>
		<div class="margin2"><br/></div>
			<table id="container" align="center">
				<c:forEach var="list" items="${requestScope.v}" varStatus="status">
					<c:if test="${status.index mod 3 eq 0 }">
					<tr id="contents">
					</c:if>
					<jsp:useBean id="toDay" class="java.util.Date"/>
					<fmt:formatDate value="${toDay }" var="startDay" pattern="yyy-MM-dd"/>
					<fmt:parseDate value="${startDay }" var="strPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
					<fmt:parseDate value="${list.pd_end }" var="endPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
						<td id="content" align="center">
							<div id="img">
								<c:if test="${endDate - strDate <= 7 && endDate - strDate > 0}">
									<div id="deadline">
										마감 임박
									</div>
								</c:if>
								<c:if test="${endDate - strDate == 0}">
									<div id="deadline">
										마감
									</div>
								</c:if>
								<a href="./Content.ad?pd_no=${list.pd_no}&user_id=<%=id%>">
									<img src="./upload/${list.pd_realFile}">
								</a>
							</div>
							<div id="subject" align="left">
								<a href="./Content.ad?pd_no=${list.pd_no}&user_id=<%=id%>">			        	
						        	<strong>${list.pd_subject }</strong>
						        	<br>
						        	<span>${list.pd_category } ː</span>
						        	<span>${list.company}</span>
								</a>
							</div>	
							<div id="bar">  
								<c:set var="pro" value="${(list.pd_curMoney/list.pd_goalMoney)*100 }"/>
								<span id="bar1" style="width:${pro}%;"></span>
							</div>
							<div id="money" align="left">
								<div id="pro">
									<strong><fmt:formatNumber value="${pro }" pattern="0"/>%</strong> · ${list.pd_curMoney }원
								</div>
								<div id="day" align="right">
								<c:choose>
									<c:when test="${endDate - strDate < 0}">
										마감
									</c:when>
									<c:when test="${endDate - strDate >= 0}">
										${endDate - strDate }일 &nbsp;남음
									</c:when>
								</c:choose>
								</div>
							</div>
						</td>
				</c:forEach>					
				</tr>
			</table>
		</c:when>
	</c:choose>	

	<div class="margin2"><br/></div>

</body>
</html>