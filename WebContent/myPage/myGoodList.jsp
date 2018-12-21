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
	<div>
		<div class="위">제목</div>
		<div class="아래">
			<div class="게시글영역">
				<c:forEach var="goodlist" items="${goodlist }">
					<div class="하나의글">
						<div>${goodlist.pd_subject }</div>
						<div><img src="./upload/${goodlist.pd_file }"></div>
						<div>${goodlist.user_id }</div>
						<div>${goodlist.pd_rate }</div>
					</div>				
				</c:forEach>				
			</div>		
		</div>
	</div>
</body>
</html>