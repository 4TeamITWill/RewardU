<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contain {
	margin : 200px;
}

#box {
	background-color: #D0E0F5;
	padding : 30px;
	border-color: blue;
	/* margin-top: 100px; */
}

a{
 color: black;
 font-weight: bolder;

}
}


</style>

</head>
<body>
	<div id="contain">
		<div><h3>전송이 완료되었습니다.</h3></div>
	 	<div id="box">
			<div>
				승인이 되면 https://reward-U.kr/web/detail/${domain}으로 오픈됩니다.<br/>
				<br>
				개설프로젝트는 <a href="./mySellList.my"><font>마이페이지</font></a>에서 보실 수 있습니다.<br>
			</div>
	 	</div>
 	</div>
</body>
</html>