<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width : 100%; height : 100%;">
	<div style="display : flex; padding : 5rem 6px;; width : 1000px; margin : 0 auto;">
		<div style="margin : 24px auto; flex : 1;">
			<div onclick="gesul();" class="bt bt1">개설 프로젝트</div>
			<div onclick="imsi();" class="bt bt2">임시저장 글</div>
		</div>
		
		<div id="savedList_main" style="flex : 6;">
		
		</div>
	</div>	
</div>	
<script>

	gesul();

	//개설프로젝트 버튼 ajax 받아오기
	function gesul(){
		
		$(".bt1").addClass("bt-on");
		$(".bt2").removeClass("bt-on");
		
		$.ajax({
			url : "mySellList.my",
			success : function(data){
				document.getElementById("savedList_main").innerHTML = data;
			}
		});			
	}
	//페이징 ajax로 처리
	function pageajax(currentPage){
		
		$.ajax({
			url : "mySellList.my",
			data : {"currentPage1" : currentPage},
			success : function(data){
				document.getElementById("savedList_main").innerHTML = data;
			}
		});
	}
	//임시저장글 버튼 ajax 받아오기
	function imsi(){
		
		$(".bt2").addClass("bt-on");
		$(".bt1").removeClass("bt-on");
		
		$.ajax({
			url : "RewardingSaveList.fu",
			success : function(data){
				document.getElementById("savedList_main").innerHTML = data;
			}
		});			
	}
		

</script>	
</body>
</html>