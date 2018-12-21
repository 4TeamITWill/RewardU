<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 퀵메뉴 */
#quick_menu {
	width: 95px;
	text-align: center;
	position: absolute;
	bottom: 0px;
	right: 0.5%;
}
.quick_msg{border: 1px solid red;
	position: absolute;
	bottom: 0px;
	right: 5%;
	width: 300px; height: 300px;
	display: none; 
	
}
</style>

</head>
<body>
<div id="quick_menu">
	<!-- 
	<h3>
		<img src="img/quick_title.png" alt="퀵 메뉴" />
	</h3> -->
	<ul>
		
		<li>
			<a>
				<img src="img/messageIcon.png" width="50px" height="50px" class="quick_img" alt="메시지 보내기" />
			</a>
		</li>
		<li>
			<div class="quick_msg">
				
			</div>
		</li>
		<!-- <li>
			<a href="#">
				<img src="img/quick_top_btn.png" alt="상단으로 이동" />
			</a>
		</li> -->
	</ul>
</div>
</body>
</html>