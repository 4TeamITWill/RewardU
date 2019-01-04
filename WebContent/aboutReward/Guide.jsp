<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- 드롭다운 -->
<script type="text/javascript">
		$(document).ready(function(){
			$("#nav ul.sub").hide();
			$("#nav ul.menu li").click(function(){
				$("ul",this).slideToggle("fast");
			});
		});
</script>

<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background-image: url(); // 이미지 경로 
	width : 100%; // 가로 폭 
	height : 100%;//세로폭 
	overflow: hidden; // 범위를 넘엇을시 넘는 영역 숨김 
	background-position : 0 0;//시작위치 
	background-repeat: no-repeat; // 배경화면 반복 
	background-attachment :
	fixed; // 배경화면 스크롤시 고정
	background-size : cover; // 배경화면 비율유지
	position :relative; //위치지정 
	overflow-y: auto;//스크롤
}

aside {
	border: 1px solid;
	border-radius: 10px 10px;
	margin: 3em;
	margin-top: 180px;
	width: 350px;
	position: fixed;
	background: white;
	color: #999999;
	overflow: hidden;
	float: left;
}

nav {
	font-size: xx-large;
	text-align: center;
	width: 100%;
	height: 50px;
	margin-top: 30px;
	background: white;
}

section {
	margin-top: 100px;
	margin-left: 50px;
	margin-right: 500px;
	margin-bottom: 100px;
	background: white;
}

.text {
	/* border-bottom : 3px solid ;  */
	font-size: 30px;
	background: #white;
	color: #7644B9;
	height: 50px;
	padding: 10px;
	vertical-align: middle;
	font-weight: bold;
}

.box {
	margin-left: 450px;
	border-left: 3px solid #F4ECFF;
}

/* 사이드메뉴 css */
#nav {
	font-family: 'arial';
}

#nav ul {
	width: 100%;
	margin: 0;
	padding: 0;
}

#nav ul.menu li {
	position: relative;
	width: 100%;
	list-style-type: none;
	font-size: 15px;
}

#nav ul.menu li a {
	display: block;
	width: 100%;
	line-height: 30px;
	text-indent: 30px;
	color: #000;
	font-weight: bold;
	text-decoration: none;
}

#nav ul.menu li a:hover {
	/* background: #ECDCFF; */
	color: #7644B9;
}

#nav ul.menu li .sub a {
	position: relative;
	float: left;
	display: block;
	width: 100%;
	z-index: 999;
	/* background: #E8E8E8; */
}

#nav ul.menu li .sub a:hover {
	/* background: #B9A4D5; */
	color: #7644B9;
	/* border-bottom: 3px solid;
	border-bottom-width: thin; */
}


</style>

</head>
<body>

  </head>
  <body>

	<aside>
		<div id="nav">
			<ul class="menu">
				<li><a href="#whatIs">크라우드펀딩이란?</a></li>
				<li><a href="#notShopping">펀딩하기는 쇼핑하기가 아닙니다.</a></li>
				<li><a href="#">운영정책</a></li>
			</ul>
			<ul class="menu">	
				<li><a>자주묻는 질문 </a>
					<ul class="sub">
						<li><a href="#howReward">> Q1. 리워드 펀딩 참여하기</a></li>
		      			<li><a href="#howOpen">> Q2. 리워드 펀딩 오픈하기</a></li>
		      			<li><a href="#fail">> Q3. 펀딩 실패시 어떻게 되나요?</a></li>
		      			<li><a href="#find">> Q6. 비밀번호를 잃어버렸어요!</a></li>
		      			<li><a href="#delete">> Q7. 회원 탈퇴하고 싶어요!</a></li>
					</ul>
				</li>
				<li><a href="#etc">기타</a></li>
			</ul>
		</div>
      </aside>

      <nav>이용가이드</nav>
     
    	<div class="box">
      	<section id="whatIs">
      		<div class="text">크라우드펀딩이란?</div>
				<p>
					크라우드펀딩은 군중 또는 다수를 뜻하는 영어 단어 ‘크라우드(crowd)’와 자금조달을 뜻하는 ‘펀딩(funding)’을 조합한 용어로, 
					창의적 기업가를 비롯한 자금수요자가 인터넷 등의 온라인상에서 자금모집을 중개하는 자(크라우드펀딩 중개업자)를 통하여 불특정다수의 소액투자자로부터 자금을 조달하는 행위를 말합니다.
				</p>
				<p>	
					크라우드펀딩은 금융중개기관(예: 은행)을 통하는 간접 금융과 달리, IT 기술의 발전을 기반으로 인터넷 등 온라인을 통해 연결된 자금수요자들이 크라우드펀딩 중개업체를 통하여 직접 자금을 조달하는 직접 금융의 한 형태로 볼 수 있습니다.
					크라우드펀딩은 자금모집 및 보상 방식에 따라 리워드형, 투자형(증권형), 대출형으로 구분되고 있습니다. 
				</p>
				<p>	
					리워드형이란
					세상을 따뜻하게 만드는 멋진 아이디어 혹은 제품이나 서비스에 관련하여 이야기를 소개하고 다수의 사람들로부터 자금을 모으는 형태를 말합니다.
					메이커는 프로젝트 진행중 서포터에게 받은 피드백을 보상품 제작에 반영하거나
					프로젝트 홍보에 도움을 준 서포터들을 위해 이벤트를 진행하는 등
					펀딩하는 서포터와 제품/서비스를 만드는 메이커간의 
					긴밀한 소통이 이루어지는 점이 특징입니다.
				</p>	
				<p>RewardU라는 이름은 Reward with you를 줄여 만들었으며
					RewardU는 리워드형 프로젝트만 오픈되고 참여할 수 있는 리워드 크라우드펀딩 플랫폼입니다.
				</p>	
				<p>	리듀에 대헤 더 자세히 알고싶다면? 리듀소개 바로가기  -> <a href="리뉴소개링크">클릭!</a></p>
		</section>		
	
	      <section id="notShopping">
	      	<div class="text">펀딩하기는 쇼핑하기가 아닙니다.</div>
	      	
				<p><b>펀딩과 쇼핑은 다릅니다. 어떻게 다른지 안내드리겠습니다.</b></p>
					<p>쇼핑과 어떻게 다른지 아래 내용을 읽어주세요! :)</p>
					<p>리듀의 리워드 프로젝트에 펀딩하는 것은 메이커의 창작물을 단순히 사고파는 쇼핑이 아니라, 메이커의 창작활동 및 목표실현을 위한 과정을 지원하는 것입니다. </p>
						<p class="p">1. 펀딩 즉시, 결제가 진행되지 않아요.</p>
					<p> 결제 수단을 등록하면 결제가 바로 진행되는 쇼핑하기와 다르게 펀딩하기는 프로젝트의 목표금액과 마감일이 있어 해당 프로젝트가 목표금액을 달성했을 때만, (프로젝트의 펀딩 타입에 따라 그렇지 않은 경우도 있습니다.) 마감일 다음날 펀딩에 참여한 서포터 모두 함께 결제가 진행됩니다.</p>
						<p class="p">2. 배송이 바로 진행되지 않아요.</p>
					 <p>결제가 모두 완료되었다고 펀딩한 리워드가 바로 발송되지 않습니다. 메이커는 각 리워드마다 리워드 발송 시작일을 명시하고 있으며, 메이커가 약속한 리워드 발송 시작일에 발송이 진행되는 것을 원칙으로 합니다.</p>
						<p class="p">3. 메이커의 사정으로 리워드 발송이 지연 또는 불가할 수도 있습니다.</p>
					<p>펀딩 금액을 전달받아 리워드 제작을 시작하는 크라우드펀딩의 특성 상, 메이커가 약속한 리워드 발송이 지연 또는 불가할 수도 있습니다. 스토리 하단에 메이커가 약속한 리워드 발송 지연 시에 대한 약속과 교환 및 환불 정책에 대한 설명이 작성되어 있으니 펀딩 참여 전 꼭 읽어주세요.</p>
			
			</section>
			
			<section id="howReward">
	          <div class="text">Q1. 리워드 펀딩에 참여하는 방법이 궁금하다면!</div>
	          
	          	<p>아직 리듀 회원이 아니시라면, 회원가입을 해주세요.</p>
	          	<p>1. 회원가입 하기 </p>
	          	캡쳐
	          	<p>2. 로그인하기</p>
	          	캡쳐
	          	<p>메인페이지에서 인기리워드와 최신리워드를 확인할수 있고<br/> 
	          	상단메뉴바 클릭 -> 펀딩시작하기 -> 리워드 게시판  에서 카테고리별로 프로젝트를 분류하여 볼수 있습니다.</p>
	          	
	          	<p>참여방법</p>
	          	<p>와디즈는 결제하고 바로 배송하는 쇼핑몰이 아닙니다 :) 
	          	세상에 아직 출시되지 않은 제품을 생산자(메이커)가 직접 소개하고 정해진 기간동안 오픈예정(펀딩)을 받는 방식이랍니다. 
	          	따라서 프로젝트가 종료되고 목표금액을 달성 해야만 카드결제가 실행이 되며, 프로젝트가 종료 이후인 '리워드 발송 시작일'부터 제품 발송이 시작됩니다.<p>
	          	<p>캡쳐</p>
	          	<p>먼저 펀딩하실 프로젝트를 클릭해주세요.</p>
	          	<p>캡쳐</p>
				<p>오른쪽 상단에 있는 펀딩하기 버튼을 클릭해주세요.</p>
				<p>결제페이지 캡쳐</p>
				<p>리워드 종류와 수량을 선택 후  결제버튼을 클릭합니다.</p>
				<p>캡쳐</p>
				<p>리워드를 받을 주소와 전화번호가 다르다면 마이페이지>개인정보 설정에서 수정해주세요!</p>
				
				<p>※ 프로젝트의 펀딩기간, 리워드 발송 시작일을 다시 한번 확인해주세요<br/>
				※ 펀딩 취소는 프로젝트 기간 내에만 가능한 점 유의해주세요 :)
	          	</p>
	           </section>
	      
	      <section id="howOpen" >  
	          <div class="text">Q2. 리워드 펀딩 오픈은 어떻게 하나요?</div>
	          <p>회원가입을 하지 않으셨다면 먼저 회원가입을 해주시고 로그인을 해주세요.</p>
	          	
	          	<p>상단메뉴바 클릭 -> 펀딩시작하기 -> 리워드 신청하기</p>
	          
	          	<p>양식작성 후 신청하기 버튼을 누르면 관리자에게 전송되며 
	          	승인요청을 해주신 프로젝트는 리듀의 검수 후 등록이 완료됩니다.<br/>
				승인요청을 해주신 프로젝트가 리듀의 내부규정을 준수하고 있지 않다면 프로젝트 승인이 반려될 수 있습니다. 
				이 부분은 [<a>리워드 프로젝트 시작하기 가이드북</a>]을 참고해주세요.</p>
				
				<p>프로젝트를 작성 도중 준비가 아직 덜 된 부분이 있거나 나중에 다시 작성하고 싶다면 하단의 저장하기 버튼을 눌러 저장할 수 있으며
				'마이페이지>개설프로젝트>임시저장프로젝트' 에서 확인할 수 있습니다.</p>
	
				<p>다 작성하신 프로젝트는 승인을 요청하기 전에 다시 한 번 꼭 검토해 주시기 바랍니다. 모든 것들이 준비 되셨다면 승인요청을 해 주세요. 
				리듀의 운영자가 3 영업일 이내로 검토 결과를 알려드립니다. <br/>
				승인이 완료되면 프로젝트가 바로 시작되며 ‘마이페이지 > 개설프로젝트'에서 확인할수 있습니다.</p><br/>
				
				<p>리워드 프로젝트 오픈 신청 바로가기 -> <a href="./RewardingWrite.fu">클릭!</a></p>
	          </section>
			
			 <section id="fail" >  
	          <div class="text">Q3. 펀딩 실패시 어떻게 되나요?</div>
				<p>프로젝트의 리워드 선택 후 결제하기버튼을 누르시면 즉시 결제가 됩니다.</p> 
				<p>프로젝트 마감일을 기준으로 목표금액의 100% 이상 달성 시 리워드 발송이 확정되지만
				안타깝게 100%를 달성하지 못한 경우에는 실패한 프로젝트가 되어 결제가 취소되고 환불처리가 됩니다.</p>
			</section>
			
			<section id="find" >  
	          <div class="text">Q4. 아이디/비밀번호를 잃어버렸어요!</div>
	          <p>오른쪽 상단에 로그인을 클릭-> ID/PASS 입력부분 밑에 아이디찾기/비밀번호찾기에서 찾을수 있습니다.</p>
	          <p>아이디찾기/비밀번호찾기 바로가기 -> <a href="./MemberFind_ID_PW.me">클릭!</a>
	        </section>
			
			 <section id="delete" >  
	          <div class="text">Q5. 회원 탈퇴하고 싶어요!</div>
	          <p>메인페이지 오른쪽 상단에 마이페이지 -> 개인정보 설정에서 탈퇴하실 수 있습니다.</p>
	          <p>회원탈퇴 바로가기 -> 
	          <%
	         	 String id = (String)session.getAttribute("id");
				//로그인되지 않았다면 탈퇴하기 링크 눌러도 이동되지 않음..
	          if(id == null){
	          %>
	         	 <a href="#">클릭!</a>
	          <%
	          	 }else{
	          %>
	          	<a href="./MemberMypageAction.me">클릭!</a>
				<%
		          	 }
				%>          
	          </p>
	          </section>
	          
	          <section id="etc" >  
		          <div class="text">기타</div>
		          <p>그 외 궁금한 점이나 문의사항이 있다면 페이지 하단에 메세지 아이콘을 클릭하여 운영자에게 쪽지를 보낼 수 있습니다.</p>
	          
	        </section>
			
		</div>
      

</body>
</html>