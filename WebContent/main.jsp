<%@page import="my_db.SellerNewsBean"%>
<%@page import="admin_db.BoardBean"%>
<%@page import="my_db.MyDAO"%>
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
	            <li	>
	            	<img src="img/contentimg/carousel_game.png" style="height : 100%;" > 
	            	<div style="position : absolute; left: 23%; width : 350px; 
	            			box-sizing : border-box;">
		            	<div style="color:#a5f; font-weight : bold;">리워드</div> 
		            	<div style="font-size : 38px; margin-top : 0.4rem; margin-bottom : 1.5rem; font-weight : bold;">
		            		엄마! 나 이거 사줘! <br/>
		            		<span style="font-size: 17px; text-indent: 5px;"> &nbsp;이 게임 안 사주면 <br> &nbsp;우리애가 왕따라면서요?</span>
	            		</div>
		            	<div style="color : rgba(0,0,0,0.6); font-weight : 600;">Editor가 추천하는 핫아이템</div>
	            	</div>
	            </li>
	             <li> 
	            	<img src="img/contentimg/carousel_paris.png" style="height : 100%;" >
	            	<div style="position : absolute; left: 23%;color : #fff; width : 350px;  
	            			background-color : rgba(255,255,255,0.1); box-sizing : border-box; padding : 2rem 1rem;">
		            	<div style="color:#a5f; font-weight : bold;">리워드</div> 
		            	<div style="font-size : 38px; margin-top : 0.4rem; margin-bottom : 1.5rem; font-weight : bold;">
		            		나만 가본 Paris<br/>
		            		<span style="font-size: 15px; font-weight: none; "> &nbsp;파리 로컬과 함께하는  <br> &nbsp;나만 가본 새로운 여행 상품!</span>
	            		</div>
		            	<div style="color : rgba(255,255,255,0.9); font-weight : 600;">Editor가 추천하는 핫아이템</div>
	            	</div>
	            </li>
	            <li>
	            	<img src="img/contentimg/carousel_lipstick.png" style="height : 100%;">
	            	<div style="position : absolute; left: 23%; width : 350px; 
	            			box-sizing : border-box;">
		            	<div style="color:#a5f; font-weight : bold;">리워드</div> 
		            	<div style="font-size : 38px; margin-top : 0.4rem; margin-bottom : 1.5rem; font-weight : bold;">
		            		착색 갑 <br/>가성비 갑
	            		</div>
		            	<div style="color : rgba(0,0,0,0.6); font-weight : 600;">Editor가 추천하는 핫아이템</div>
	            	</div>
	            
	            </li>
	            <li>
	            	<img src="img/contentimg/carousel_whisky.png" style="height : 100%;">
	            	<div style="position : absolute; left: 23%; width : 350px; 
	            			box-sizing : border-box;">
		            	<div style="color:#a5f; font-weight : bold;">리워드</div> 
		            	<div style="font-size : 38px; color:#fff; margin-top : 0.4rem; margin-bottom : 1.5rem; font-weight : bold;">
		            		위스키 <br/>즐거운딩
	            		</div>
		            	<div style="color : #fff; font-weight : 600;">Editor가 추천하는 핫아이템</div>
	            	</div>
	            </li>
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
						
					<!-- 최신뉴스 부분 Vector 로 받아오기 -->	
					<div class="box_grid1_">					
					<%
						
						NewsDAO newsDao = new NewsDAO();
						Vector<Newsbean> v = newsDao.getNewsList();
						
						for(Newsbean nbean : v){	
					%>
						<div class="box_grid1_cont">
							<div style="width : 100%; height : 100%; overflow:hidden; display : flex; align-items:center;">
								<img src="./upload/<%= nbean.getReNews_img()%>" style="width : 120%;">
								<div style="width:100%;height : 100%; position : absolute; left:0; top:0; background-color : rgba(0,0,0,0.5);"></div>
							</div>
							<div style="position : absolute;	left:5%;bottom:10%; width : 50%; padding-left : 10px; box-sizing : border-box;">
								<div style="color : #a5f; font-size:16px; font-weight : bold; height:20px; line-height : 20px; text-align:center; border-bottom : 1px solid #a5f; display : inline-block;">
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
				
				<!-- 리워드 소식 메인에 뿌려주는곳 -->
				<div class="box_grid box_grid2">
					<h2>리워드 소식</h2>
				<% 
					MyDAO mdao = new MyDAO();
					ArrayList<SellerNewsBean> sNewsList = mdao.getSellerNewsList();
					
					if(sNewsList != null){
						for(SellerNewsBean sbean : sNewsList){
				%>				
					
					<div class="news_contents">
						<!-- 글부분 -->
						<div style="flex : 2; box-sizing : border-box; padding : 0 8px;">
							<a href="Content.ad?pd_no=<%=sbean.getPd_no()%>" style="color:#000;">
								<b>[리워드 : <%=sbean.getPd_subject() %>]</b><br/> 
								<font><%=sbean.getSell_subject() %></font>
							</a>
						</div>
						<!-- 이미지부분 -->
						<div style="flex : 1;">
							<div style="width : 100%; height:100%; overflow : hidden; display : flex; align-items:center;">
								<img src="./upload/<%=sbean.getPd_realfile() %>" style="width : 100%;"/>
							</div>
						</div>
					</div>			
				<%
						}
					}
				%>
				</div>
				
				
				
				<!-- 마감임박 게시글리스트 메인페이지 뿌려주기 -->
				<div class="box_grid box_grid3">
				<%
					
					MyDAO mydao = new MyDAO();
					ArrayList<BoardBean> magamlist = mydao.getMagamList();
				if(magamlist != null){	
					for(BoardBean bbean : magamlist){
				%>
					<div class="box_grid3_cont">
						<div style="height : 42%; overflow:hidden; display:flex; align-items:center; border-bottom:1px solid; ">
							<img src="./upload/<%=bbean.getPd_file() %>" style="width:100%; background-color : #fff;">
						</div>
						<div style="display:flex; justify-content : center; margin : 20px 0; font-size : 14px;">
							<span style="display:block; height :30px;  line-height:30px; width:75px; border : 0.5px solid; text-align:center;">마감임박</span>
							<span style="display:block; height :30px;  line-height:30px; width:60px; border : 0.5px solid; text-align:center; border-left:0;">리워드</span>
						</div>
						<div style="margin : 26px 0;">
							<div style="width:80%; margin : 0 auto; text-align: center; font-size:18px; font-weight : bold;">
								<a href="./Content.ad?pd_no=<%=bbean.getPd_no()%>&user_id=<%=session.getAttribute("id")%>"
								style="text-decoration: none; color: #fff;">
								<%=bbean.getPd_subject()%>
								</a>
							</div>
							<div style="width : 50%; margin : 0 auto; margin-top : 2rem;text-align: center; font-size : 13px;">
								<%=bbean.getPd_category() %>
							</div>
						</div>						
					</div>
							
				<%
					}
				}else{
				%>
					<div style="height : 100%; background-color : #e17bf7; display:flex; justify-content : center; align-items : center;">
						<span style="color : white;">[마감임박]인 프로젝트가 없습니다.</span>
					</div>				
				<%
				}
				%><!-- 버튼 -->
					<div class="btnCont1" >
						<a id="left1">&nbsp;&lt;</a>
						<div class="pagenation">
						<!-- 밑에 동그란 점들 생기는 부분 -->							
						</div>
						<a id="right1">&gt;&nbsp;</a>
					</div>	
				</div>
				
				<!-- 태그 모음 부분 -->
				<div class="box_grid box_grid4">
					<div style="width : 90%; margin : 0 auto;">
						<div style="text-align : center; margin-bottom : 1.5rem ; font-weight : bold;">리워드 카테고리</div>
						<div>
							<span onclick="cateGo('패션뷰티')">패션·뷰티</span>
							<span onclick="cateGo('테크가전')">테크·가전</span>
							<span onclick="cateGo('반려동물')">반려동물</span><br/>
							<span onclick="cateGo('푸드')">푸드</span>
							<span onclick="cateGo('홈리빙디자인소품')">홈리빙·디자인소품</span><br/>
							<span onclick="cateGo('게임스포츠')">게임·스포츠</span>
							<span onclick="cateGo('여행레저')">여행·레저</span>
							<span onclick="cateGo('문화교양')">문화·교양</span><br/>
							<span onclick="cateGo('소셜캠페인')">소셜·캠페인</span>
							<span onclick="cateGo('교육키즈')">교육·키즈</span>
						</div>
					</div>
				</div>
				
				
			</div>			
		</div>		
	</div>
	
<script>
		
	//최신뉴스부분 자바스크립트	화살표 눌렀을때 슬라이드		
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
		$(".box_grid1_").animate({"left":-(sliderWidth*pos)},600);
		
	}
	
	function slideRight(){
		pos++;
		if(pos == totalSlides) pos = 0;
		$(".box_grid1_").animate({"left":-(sliderWidth*pos)},600);
	}
	//-----------------------------------------------최신뉴스부분 끝

	//마감임박 리스트 페이지 슬라이드
	var pos1 = 0;
	var totalSlides1 = $(".box_grid3_cont").length;	
	
	//밑에 동그란 점들 콘텐츠 갯수만큼 만들기
	$.each($(".box_grid3_cont"), function(){
		
		var div = document.createElement("div");
		$(".pagenation").append(div);
		
	});
	//처음으로 보여지고 있을 기본 값
	$(".box_grid3_cont").eq(pos1).css("opacity","1");
	pagenation();
	
	//동그란 점들 클릭했을때도 마찬가지로 슬라이드, 페이지네이션
	$(".pagenation div").click(function(){
		pos1 = $(this).index();
		$(".box_grid3_cont").eq(pos1).animate({"opacity":"1"},300);
		$(".box_grid3_cont").not(":eq("+pos1+")").animate({"opacity":"0"},300);
		
		pagenation();
	});
	
	$("#left1").click(function(){
		slideLeft1();
	});
	
	$("#right1").click(function(){
		slideRight1();
		
	});
	
	function slideLeft1(){
		pos1--;
		if(pos1 == -1) pos1=totalSlides1-1;
		$(".box_grid3_cont").eq(pos1).animate({"opacity":"1"},300);
		$(".box_grid3_cont").not(":eq("+pos1+")").animate({"opacity":"0"},300);
		
		pagenation();
	}
	
	function slideRight1(){
		pos1++;
		if(pos1 == totalSlides1) pos1 =0;
		$(".box_grid3_cont").eq(pos1).animate({"opacity":"1"},300);
		$(".box_grid3_cont").not(":eq("+pos1+")").animate({"opacity":"0"},300);
		
		pagenation();
	}
	
	function pagenation(){
		$(".pagenation div").removeClass("pagenationActive");
		$(".pagenation div").eq(pos1).addClass("pagenationActive");
		
	}	
	//-------------------------------------------------------------
	
	function cateGo(cate){
		location.href="PermitList.ad?category="+cate;
	}
</script>	
	
</body>
</html>