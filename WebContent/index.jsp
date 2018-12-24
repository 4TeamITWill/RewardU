<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  <link href="css/reset.css" rel="stylesheet">-->
<link href="css/main3.css" rel="stylesheet">
<link href="css/message.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/carousel.js"></script>
<title>리듀 RewardU | 메인화면</title>
</head>
<body>

<!-- 변수 center에 받아온 값이 있으면 변수에 저장하고 null이면 기본(main.js00p)값 넣어줌-->
<c:set var="center" value="${param.center }"/>
<c:if test="${center == null }">
	<c:set var="center" value="main.jsp"/>
</c:if>

<jsp:include page="top.jsp"/>

<jsp:include page="${center }"/>

<jsp:include page="footer.jsp"/>

<jsp:include page="quick_menu.jsp"/>

</body>
</html>