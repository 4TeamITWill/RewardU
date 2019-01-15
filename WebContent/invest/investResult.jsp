<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		var op1= $("#op1_price").attr('value');
		 var op2= $("#op2_price").attr('value');
		 var op3= $("#op3_price").attr('value');
		  if(op1 == '0'){
			 $(".first").hide();
		 }if(op2 == '0'){
			 $(".second").hide();
		 }if(op3 == '0'){
			 $(".third").hide();
		 } 
		 
	});

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" id="button" value="click me">
		<h2> '${ibean.inv_name}' 상품을 구매해주셔서 감사합니다.</h2>
		<h3> 안녕하세요 '${ibean.user_id}'님, 신청해주신 상품이 구매완료되었습니다. 이후 구매이력 열람은 '마이페이지'->'투자 현황'에서 확인 가능합니다.</h3>
		<hr>
		<h2>주문 정보</h2>
		<ul>
			<li>
			  <h2> 주문번호 : ${ibean.inv_orderno}</h2>
			</li>
			<li class="first">
			  <h2> 옵션1 ${ibean.op1_price} x ${ibean.op1_qty} :
			   <a href="javascript:;" id="op1_price" value="${ibean.op1_price * ibean.op1_qty}">${ibean.op1_price * ibean.op1_qty}</a></h2>
			</li>
			<li class="second">
			  <h2> 옵션2 ${ibean.op2_price} x ${ibean.op2_qty} :
			   <a href="javascript:;" id="op2_price" value="${ibean.op2_price * ibean.op2_qty}">${ibean.op2_price * ibean.op2_qty}</a></h2>
			</li>
			<li class="third">
			  <h2> 옵션3 ${ibean.op3_price} x ${ibean.op3_qty} :
			   <a href="javascript:;" id="op3_price" value="${ibean.op3_price * ibean.op3_qty}">${ibean.op3_price * ibean.op3_qty}</a></h2>
			</li>
		</ul>	
		
		<h2> 총 구매금액 : ${ibean.inv_price}원</h2>
			
	<input type="button" value="투자 현황 확인" onclick="location.href='./myPageReward.my'">
	<input type="button" value="메인으로 돌아가기" onclick="location.href='./ReturnMain.in'">
			
</body>
</html>