<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>


<div id="write_top">
	<div class="write_top_cont"></div>


<div id="write_main">
	<div class="write_tab">
		<font style="font-size : 16px; font-weight : 550; color : rgba(20,20,20,0.8); display : block; margin : 15px 0; ">프로젝트 만들기</font>
		<a id="a1" class="a1" onclick="seller_tab();">1. 제작자 정보</a><br/>
		<a id="a2" class="a1" onclick="board_tab();">2. 프로젝트 소개</a><br/>
		<a id="a3" class="a1" onclick="reward_tab();">3. 리워드 옵션</a>
	</div>
		
	<div class="write_content">
	</div>
</div>	

<script>

<%
	String pagename = (String)request.getAttribute("page");
	if(pagename == null || pagename=="sSeller"){
%>		
		firstSeller_tab();
<%
	}else if(pagename == "seller"){ //탭
%>		
		seller_tab();		
<%		
	}else if(pagename == "board"){	//탭
%>
		board_tab();
		
<%
	}else if(pagename == "reward"){	//탭
%>
		reward_tab();
<%		
	}else if(pagename == "bBoard"){ 
%>
		SaveBoard_tab();
<%
	}else if(pagename == "rReward"){
%>
		SaveReward_tab();
<%
	}
%>
		

	//처음 신청하기 메뉴로 들어갔을때.또는 판매자 저장후 페이지이동
	function firstSeller_tab(){
		$(".a1:eq(0)").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
		$(".a1").not($(".a1:eq(0)")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});
		$(".write_top_cont").html("제작자 정보");
		$(".write_content").load("./RewardingWrite_seller.jsp");
	}

	//상품소개 저장했을때 페이지 받아오기
	function SaveBoard_tab(){
		$(".a1:eq(1)").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
		$(".a1").not($(".a1:eq(1)")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});
		$(".write_top_cont").html("프로젝트 소개");
		$(".write_content").load("./RewardingWrite_board.jsp");
	}
	//리워드저장했을때
	function SaveReward_tab(){		
		$(".a1:eq(2)").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
		$(".a1").not($(".a1:eq(2)")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});
		$(".write_top_cont").html("리워드 옵션");
		$(".write_content").load("./RewardingWrite_reward.jsp");
	}

	
	
	//판매자정보 탭 눌렀을때 페이지 받아오기
	function seller_tab(){
		if (confirm(" 저장하기를 하지 않았다면 수정사항은 저장되지 않습니다. \n 이동하시겠습니까? ") == true){ //check
			
			$("#a1").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
			$(".a1").not($("#a1")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});
			$(".write_top_cont").html("제작자 정보");
			$(".write_content").load("./RewardingWrite_seller.jsp");
			
		}else{
		 return;
		}
	}
	//상품소개 탭 눌렀을때 페이지 받아오기
	function board_tab(){
		if (confirm(" 저장하기를 하지 않았다면 수정사항은 저장되지 않습니다. \n 이동하시겠습니까? ") == true){ //check
			
		$("#a2").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
		$(".a1").not($("#a2")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});	
		$(".write_top_cont").html("프로젝트 소개");
		$(".write_content").load("./RewardingWrite_board.jsp");
		
		}else{
			 return;
			}
	}
	//리워드 탭 눌렀을때
	function reward_tab(){
		if (confirm(" 저장하기를 하지 않았다면 수정사항은 저장되지 않습니다. \n 이동하시겠습니까? ") == true){ //check
			
			$("#a3").css({"color":"rgba(80,80,80,1)", "font-weight" : "bold", "font-size":"15px"});
			$(".a1").not($("#a3")).css({"color":"rgba(150,150,150,1)", "font-weight" : "550", "font-size" : "14px"});	
		$(".write_top_cont").html("리워드 옵션");
		$(".write_content").load("./RewardingWrite_reward.jsp");
	}else{
		 return;
		}
	}


//업로드 하면 미리보기도 변경되도록..실패
/* $(document).ready(function(){
	//pd_realFile값 변경시 
	$("#pd_realFile").change(function(){
		var img = ("#pd_realFile").val();
		var thum = "./upload/sm_"+img
		$(".thum img").attr({"src":thum});
	});
});
*/

</script>

</body>
</html>