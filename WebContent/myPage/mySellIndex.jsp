<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display : flex;">
		<div onclick="gesul();">개설 프로젝트</div>
		<div onclick="imsi();">임시저장 글</div>
	</div>
	
	<div id="savedList_main"></div>
	
<script>
	function gesul(){
		
		$.ajax({
			url : "mySellList.my",
			success : function(data){
				document.getElementById("savedList_main").innerHTML = data;
			}
		});			
	}

	function imsi(){
		
		$.ajax({
			url : "mySavedList.my",
			success : function(data){
				document.getElementById("savedList_main").innerHTML = data;
			}
		})			
	}


</script>	
</body>
</html>