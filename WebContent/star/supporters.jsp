<%@page import="java.util.ArrayList"%>
<%@page import="admin_db.ParticipateDAO"%>
<%@page import="admin_db.ParticipateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.supporters_sec{
	position: relative;
	height: 600px; text-align: center;
}
.supporters_div{
	width: 630px; height: auto; text-align: center;
	left: 20%; top: 15%;
}
.support{border-bottom: 1px groove #acacac; 
	padding-bottom: 3%; margin-bottom: 5%;
	width: 620px; text-align: left;
	font-size: 18px; color: gray;
}
</style>
</head>
<body>
<%
	ParticipateBean pbean = new ParticipateBean();
	ParticipateDAO pdao = new ParticipateDAO();
	int pd_no = Integer.parseInt(request.getParameter("pd_no"));
	ArrayList<ParticipateBean> list = new ArrayList<ParticipateBean>();
	list = pdao.getParticipateList(pd_no);
	
%>
<section class="supporters_sec">


<table style="margin-left: auto; margin-right: auto;">
	<tr>
		<td>
			<div class="supporters_div">
				<c:forEach var="list" items="<%=list%>">
					<div class="support">
						<font color="black"><b>${list.user_id}</b></font>님이<font color="black">
						<b>${list.par_money}원</b></font>으로 참여 하셨습니다.
					</div>
				</c:forEach>
			</div>
		</td>

		<td><jsp:include page="day.jsp" /> </td>
	</tr>

</table>


</section>
</body>
</html>