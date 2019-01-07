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
</div>

<div id="write_main">
	<div class="write_tab">
		<font style="font-size : 16px; font-weight : 550; color : rgba(20,20,20,0.8); display : block; margin : 15px 0; ">프로젝트 만들기</font>
		<a id="a1"onclick="seller_tab();">1. 제작자 정보</a><br/>
		<a id="a2"onclick="board_tab();">2. 프로젝트 소개</a><br/>
		<a id="a3"onclick="reward_tab();">3. 리워드 옵션</a>
	</div>
		
	<div class="write_content">
	
	</div>
</div>	



<script>
	
seller_tab();
	
	
	//판매자정보 탭 눌렀을때 페이지 받아오기
	function seller_tab(){
		$(".write_top_cont").html("제작자 정보");
		$(".write_content").load("./RewardingWrite_seller.jsp");
	}
	//상품소개 탭 눌렀을때 페이지 받아오기
	function board_tab(){
		$(".write_top_cont").html("프로젝트 소개");
		$(".write_content").load("./RewardingWrite_board.jsp");
	}
	
	function reward_tab(){
		$(".write_top_cont").html("리워드 옵션");
		$(".write_content").load("./RewardingWrite_reward.jsp");
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