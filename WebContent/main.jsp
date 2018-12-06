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

<title>Insert title here</title>
</head>
<body>
<%
//테스트를 위해 임의로 설정한 값 (실제로는 DB에서 값을 가져옴)
	int current_money = 4550;
	int goal_money = 10000;
	float percentage = ((float)current_money/goal_money) * 100;
	int current_money2 = 1450000;
	int goal_money2 = 2000000;
	float percentage2 = ((float)current_money2/goal_money2) * 100;
%>

	<div id="main">
		<!-- 캐러셀 -->	
		 <div id="carousel_section">
	        <ul>
	            <li > <img src="img/1.jpg"> </li>
	            <li > <img src="img/2.jpg"> </li>
	            <li > <img src="img/3.jpg"> </li>
	            <li > <img src="img/cat.jpg"> </li>
	        </ul>
	    </div>	
	
		<!-- 메인 아이템부분 -->
		<div class="maincontainer">
		
			<div class="subject">인기 리워드 상품
			</div>
			<!-- 인기 리워드 부분 -->
			<div class="box">		
				<!-- 1번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<div class="top1">리워드</div>
						<div class="top2">내 삶을 바꾸러 온 기업</div>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/2.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
						<!-- 목표금액 대비 현재금액의 % 를 span의 width: % 값으로 줘서 실제 %만큼 길이가 늘어남 -->
						<span class="current_money" style="width: <%=percentage%>%;"><%=percentage%>%</span>
						현재금액:<%=current_money %>, 목표금액:<%=goal_money %>
					</div>	
				</div>	
				<!-- 2번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<span class="top1">리워드</span>
						<span class="top2">내 삶을 바꾸러 온 기업</span>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/1.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
						<!-- 목표금액 대비 현재금액의 % 를 span의 width: % 값으로 줘서 실제 %만큼 길이가 늘어남 -->
						<span class="current_money" style="width: <%=percentage2%>%;"><%=percentage2%>%</span>
						현재금액:<%=current_money2%>, 목표금액:<%=goal_money2%>			
					</div>	
				</div>
				<!-- 3번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<span class="top1">리워드</span>
						<span class="top2">내 삶을 바꾸러 온 기업</span>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/3.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
						<!-- 목표금액 대비 현재금액의 % 를 span의 width: % 값으로 줘서 실제 %만큼 길이가 늘어남 -->
						<span class="current_money" style="width:100%;">100%</span>
						현재금액:3000000, 목표금액:3000000		
					</div>	
				</div>				
			</div>		
			<!-- 인기 리워딩 끝 -->
			
			<!-- 최신 리워드 부분 -->			
			<div class="subject">최신 리워드 상품
			</div>
			
			<div class="box">
				<!-- 1번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<div class="top1">리워드</div>
						<div class="top2">내 삶을 바꾸러 온 기업</div>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/2.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
								
					</div>	
				</div>	
				<!-- 2번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<span class="top1">리워드</span>
						<span class="top2">내 삶을 바꾸러 온 기업</span>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/1.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
									
					</div>	
				</div>
				<!-- 3번 그림 -->		
				<div class="contents">					
					<div class="contents_sub contents_top">
						<span class="top1">리워드</span>
						<span class="top2">내 삶을 바꾸러 온 기업</span>
					</div>
					<div class="contents_sub contents_mid">
						<div class="img_container">
							<img src="img/3.jpg">
						</div>
						<div class="cont_container">
							<h2>세계최초 5분만에 추출하는 콜드브루 커피머신</h2>
							<h3>(주)회사명</h3>
							<h4>카테고리</h4>
						</div>			
					</div>
					<div class="contents_sub contents_bottom">	
										
					</div>	
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