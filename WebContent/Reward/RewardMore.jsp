<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id = (String)session.getAttribute("id"); %>
			<table id="table"  width="1000" border="0" align="center">
				<c:forEach var="list" items="${requestScope.list}" varStatus="status">				
				<c:if test="${status.index mod 3 eq 0 }">
				<tr id="tr">
				</c:if>
					<td align="center" width="333">
						<a href="./getFunding.ad?pd_no=${list.pd_no}&user_id=<%=id%>">
							<img src="./img/1.jpg" width="280" border="0">
						</a>
						<a href="#">
							<p>
				        		<strong>${list.pd_subject }</strong>
				        	</p>
						</a>
						<div align="left" >
							<a href="#">
				       			<span>${list.pd_category }</span>
				        	</a>
				        	<a>
				        		"oint"
				        	</a>
			        	</div>
					</td>
				</c:forEach>					
				</tr>
			</table>
</body>
</html>