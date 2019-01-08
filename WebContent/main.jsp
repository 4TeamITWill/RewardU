<%@page import="java.util.ArrayList"%>
<%@page import="admin_db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	.current_money {display: block; height: 10px; line-height: 40px; text-align: right; 
	background: pink; border-radius: 40px; padding: 0 10px; box-sizing: border-box; color: #fff;}
</style>
<script type="text/javascript">
	window.onload = function(){
		$.ajax({
			url : "./PermitStart.ad",
			type: "POST",
			success:function(data){
				 console.log(data);
				 	$('#start').append(data);
			},	
			error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
		});
		$.ajax({
			url : "./PermitGood.ad",
			type: "POST",
			success:function(data){
				 console.log(data);
				 	$('#good').append(data);
			},	
			error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<div id="main">
		<!-- 캐러셀 -->	
		 <div id="carousel_section">
	        <ul>
	            <li > <img src="img/desk.jpg"> </li>
	            <li > <img src="img/creative.jpg"> </li>
	            <li > <img src="img/network.jpg"> </li>
	            <li > <img src="img/startup.jpg"> </li>
	        </ul>
	    </div>	
	
		<!-- 메인 아이템부분 -->
		<div class="maincontainer">
		
			<div class="subject">인기 리워드 상품
			</div>

			<!-- 인기 리워드 부분 -->
			<div class="box">		
				<!-- 1번 그림 -->		
				<div id="good" class="contents">					
			
				</div>	
								
			</div>		
			<!-- 인기 리워딩 끝 -->
			
			<!-- 최신 리워드 부분 -->	
					
			<div class="subject">최신 리워드 상품
			</div>
			
			<div class="box">
				<!-- 1번 그림 -->		
				<div id="start" class="contents">					
					
				</div>		
			</div>
			<!-- 최신 리워드 끝 -->
			
			<div class="subject">최신 뉴스(추가 컨텐츠)
			</div>
			<!-- 아래쪽 추가 컨텐츠 -->
			<div class="box1">	
				<div class="box_grid box_grid1">추가 할거</div>
				<div class="box_grid box_grid2">
					<h2>펀딩소식</h2>
					<div class="news_contents"><b>[리워드]</b> 리워드 발송 시작합니다</div>
					<div class="news_contents"><b>[리워드]</b> 저런 일이 있슴</div>
					<div class="news_contents"><b>[리워드]</b> ㅇㅇㅇㅇㅇㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div>
					<div class="news_contents"><b>[리워드]</b> 좋은 소식 알려드립니다</div>
					<div class="news_contents"><b>[리워드]</b> 안녕하세요. 디자인 바이 디자이너입니다</div>
					<div class="news_contents"><b>[리워드]</b> 목표금액 증액을 실시합니다</div>
					<div class="news_contents"><b>[리워드]</b> 이런 일도 있음</div>
				</div>
				<div class="box_grid box_grid3">컨텐츠</div>
				<div class="box_grid box_grid4">넣으면 됨!!</div>
				
				
			</div>			
		</div>		
	</div>
	
</body>
</html>