<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin_db.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="./css/admin.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>
<div id="admin_index">
	
	<div style="text-align : center;"><font style="font-size : 1.6rem;">관리자 페이지</font></div>

	<div id="ad_tab">
		<a onclick="selltable();" class="bt3">판매글보기</a>
		<a onclick ="membertable();" class="bt4">회원 보기</a>
	</div>	
	
	<div id="ad_main">
		<div id="ad_content">				
		</div>	
	</div>
	
</div>	
<script>

	selltable();

	function selltable(){
		
		$(".bt3").css("border","1px solid #aaa");
		$(".bt4").css("border","0");
		
		$.ajax({
			url : "board.ad",
			success:function(data){
				document.getElementById("ad_content").innerHTML = data;
			}
		});
	}
	
	function selltable(currentPage1){
		
		$(".bt3").css("border","1px solid #aaa");
		$(".bt4").css("border","0");
		
		$.ajax({
			url : "board.ad",
			data : {"currentPage1" : currentPage1},
			success : function(data){
				document.getElementById("ad_content").innerHTML = data;
			}
		});
	}
	
	function membertable(){
		
		$(".bt4").css("border","1px solid #aaa");
		$(".bt3").css("border", "0");
		
		$.ajax({
			url : "member.ad",
			success : function(data){
				document.getElementById("ad_content").innerHTML = data;
			}
		});
	}
	
	function member(){
		
		user_id = document.getElementById("user_id").value;
		
		if(jQuery.trim(user_id) == ""){
			alert("아이디를 입력하세요");
			return;
		}
		
		$.ajax({
			url : "member_info.ad",
			data : {"user_id" : user_id},
			success : function(data){
				document.getElementById("ad_content").innerHTML = data;
				
			}
		});	
	}
	
</script>	
</body>
</html>