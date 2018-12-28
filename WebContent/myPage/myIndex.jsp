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
	
	<div style="display : flex; width : 1000px; margin:0 auto; justify-content : center; 
					box-sizing : border-box; height : 50px; line-height : 50px; margin-top : 3rem;">
		<a onclick ="myPageAjax();" class="bt" id="myLink" >마이페이지</a>
		<a onclick ="savedListAjax();" class="bt" id="savedLink">개설 프로젝트</a>
	</div>
	<div id="myIndex">
	
	</div>
	
<script>

myPageAjax();

function myPageAjax(){
		
	$("#myLink").addClass("bt-on");
	$("#savedLink").removeClass("bt-on");
	
// 	document.getElementById("myLink").style.border="1px solid";
// 	document.getElementById("savedLink").style.border="";
	
	$.ajax({
		url : "myPage.my",
		success : function(data){
			document.getElementById("myIndex").innerHTML = data;
		}
	});
}

function savedListAjax(){
		
	$("#myLink").removeClass("bt-on");
	$("#savedLink").addClass("bt-on");
	
// 	document.getElementById("savedLink").style.border="1px solid";
// 	document.getElementById("myLink").style.border="";
	
	$.ajax({
		url : "mySavedList.my",
		success : function(data){
			document.getElementById("myIndex").innerHTML = data;
		}
	});
}

</script>		
</body>
</html>