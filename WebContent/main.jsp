<%@page import="news.db.Newsbean"%>
<%@page import="java.util.Vector"%>
<%@page import="news.db.NewsDAO"%>
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
		
			<div class="subject">인기 리워드 상품</div>

			<!-- 인기 리워드 부분 -->
			<div class="box">		
				<!-- 1번 그림 -->		
				<div id="good" class="contents">					
			
				</div>	
								
			</div>		
			<!-- 인기 리워딩 끝 -->
			
			<!-- 최신 리워드 부분 -->	
					
			<div class="subject">최신 리워드 상품</div>
			
			<div class="box">
				<!-- 1번 그림 -->		
				<div id="start" class="contents">					
					
				</div>		
			</div>
			<!-- 최신 리워드 끝 -->
			
			<div class="subject">다양한 소식들
			
			</div>
			<!-- 아래쪽 추가 컨텐츠 -->			
			<div class="box1">	
				<div class="box_grid box_grid1">
				
					<!-- 좌우 버튼 부분 -->
					<div class="btnCont">
						<a id="prev" class="icon-left-big"></a><a id="next" class="icon-right-big"></a>
					</div>	
						
					<div class="box_grid1_">
					
					<%
						//최신뉴스 Vector 로 받아오기
						NewsDAO newsDao = new NewsDAO();
						Vector<Newsbean> v = newsDao.getNewsList();
						
						for(Newsbean nbean : v){	
					%>
						<div class="box_grid1_cont">
							<div style="width : 100%; height : 100%; overflow:hidden; display : flex; align-items:center;">
								<img src="./upload/<%= nbean.getReNews_img()%>" style="width : 120%;">
								<div style="width:100%;height : 100%; position : absolute; left:0; top:0; background-color : rgba(0,0,0,0.5);"></div>
							</div>
							<div style="position : absolute;	top:55%; width : 80%; padding-left : 10px; box-sizing : border-box;">
								<div style="color : #24eae0; font-size:16px; font-weight : bold; height:20px; line-height : 20px; text-align:center; border-bottom : 1px solid #24eae0; display : inline-block;">
									<%=nbean.getReNews_category() %>
								</div>
								<div style="font-size : 32px; font-weight : 600; margin-top : 10px;">
									<a href="NewsReadContentAction.news?no=<%=nbean.getReNews_no()%>">
										<font style="color : white;"><%=nbean.getReNews_title() %></font>
									</a>
								</div>
								<div style="font-size : 14px; font-weight : 600;">
									<%=nbean.getReNews_summary() %>
								</div>
							</div>
						</div>
					<%
						} 
					%>								
					</div>
				
				</div>
				<div class="box_grid box_grid2">
					<h2>리워드 소식</h2>
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
	
<script>
		
	//최신뉴스부분 자바스크립트	
		
	var pos=0;	
	var totalSlides = $(".box_grid1_cont").length;
	var sliderWidth = $(".box_grid1_cont").width();
	
	$("#next").click(function(){
		slideRight();
	});
	
	$("#prev").click(function(){
		slideLeft();
	});
	
	function slideLeft(){
		pos--;
		if(pos == -1) pos = totalSlides - 1;
		$(".box_grid1_").animate({"left":-(sliderWidth*pos)},300);
		
	}
	
	function slideRight(){
		pos++;
		if(pos == totalSlides) pos = 0;
		$(".box_grid1_").animate({"left":-(sliderWidth*pos)},300);
	}
	

</script>	
	
</body>
</html>