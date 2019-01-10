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
.supporters_div{position: absolute; border:1px solid red;
	width: 1100px; height: auto; text-align: center;
	left: 20%; top: 15%;
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
<div class="supporters_div">
	<c:forEach var="list" items="<%=list%>">
		<div>
			${list.user_id}님이 ${list.par_money}원으로 참여하셨습니다.
		</div>
	</c:forEach>

</div>
</section>
</body>
</html>