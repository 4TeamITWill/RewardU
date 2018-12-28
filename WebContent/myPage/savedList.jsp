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
	<div id="savedList_main">
		<div class="savedList_desc">
			<h2 style="font-size : 1.3rem">&nbsp;&nbsp;개설 프로젝트 및 임시저장중인 글 목록을 보여주는 공간입니다.</h2>
			<p style="margin-top : 2rem;">
				개설 중인 프로젝트의 진행상황을 클릭하여 확인할 수 있습니다 <br/>
				작성중이던 판매글을 불러와 작성할 수 있습니다.
			</p>		
		</div>
		<c:forEach var="save" items="${savelist }">
		<div class="savedList_content" style="height : 400px;">		
			<div>${save.pd_subject }</div>
			<div>${save.pd_content }</div>		
		</div>
		</c:forEach>
	</div>
</body>
</html>