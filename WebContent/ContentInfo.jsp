<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/main3.css" rel="stylesheet">
<link href="css/message.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/carousel.js"></script>
<title>ㅇㅇ</title>
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
	text-align: center;
	
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
		<img src="img/${bean.pd_img }" style="opacity: 0.2" height="100%"
			width="100%">
		<h2 class="logotext">여기 텍스트는 pd_no 를 받아 따로 db에 저장해야겠군(설명)</h2>
	</div>


	<div class="ma">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td><img alt="" src="img/${bean.pd_img }" width="500"
					height="500"></td>

				<td><jsp:include page="star/day.jsp" /></td>
			</tr>
	
		</table>
		<hr>
		
	</div>
	<div class="ma2" >
			<jsp:include page="star/star.jsp" />	
	</div>
	<hr>
	<div class="ma3">
		<div class="in">
			상품 내용설명 및  하단 부분 
		</div>
	
	</div>
	
	<hr>
	<div class="ma4">
		<div class="in">
			댓글 만들기 
		</div>
	</div>
<button type="button" class="back-to-top">
    <h3 align="right">Top</h3>
   	</button>


</body>
</html>