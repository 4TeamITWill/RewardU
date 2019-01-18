<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
            <%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="css/invest2.css" rel="stylesheet">

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
		<h2> '${ibean.inv_name}' 상품을 구매해주셔서 감사합니다.</h2>
		<h3> 안녕하세요 '${ibean.user_id}'님, 신청해주신 상품이 구매완료되었습니다. 이후 구매이력 열람은 '마이페이지'->'투자 현황'에서 확인 가능합니다.</h3>
		<hr>
		<div class="invoice">
		<h2>주문 정보</h2>
		<div class="table">
		  <div class="row header">
			<div class="cell">
			   주문번호
			</div>
			<div class="cell">
			   받는이
			</div>
			<div class="cell">
			  연락처
			</div>
			<div class="cell_addr">
			    배송지
			</div>
			<div class="row">
				<div class="cell" data-title="orderno">
				 ${ibean.inv_orderno}
				</div>
				<div class="cell" data-title="inv_investor">
				 ${ibean.inv_investor}
				</div>
				<div class="cell" data-title="inv_phone">
				 ${ibean.inv_phone}
				</div>
				<div class="cell_addr" data-title="inv_addr">
				 ${ibean.inv_addr}
				</div> 
			</div> <!-- row  -->
		  </div> <!-- row header  -->
		 
		  <h2>선택 옵션</h2>
		  <!-- 옵션1  -->
		  <div class="row header">
			<div class="cell">
			  상품명
			</div>
			<div class="cell">
			  가격
			</div>
			<div class="cell">
			  수량
			</div>
			<div class="cell_addr">
			 금액
			</div>
			<div class="first">
				<div class="cell" data-title="pd_opsubject1">
				 ${bean.pd_opsubject1}
				</div>
				<div class="cell" data-title="op1_price">
				₩${ibean.op1_price}
				</div>
				<div class="cell" data-title="op1_qty">
				 ${ibean.op1_qty}개
				</div>
				<div class="cell_addr">
				 <a href="javascript:;" id="op1_price" value="${ibean.op1_price * ibean.op1_qty}">${ibean.op1_price * ibean.op1_qty}원</a>
				</div> 
			</div> <!-- row  -->
			
			<!-- 옵션2  -->
			<div class="second">
				<div class="cell" data-title="pd_opsubject2">
				 ${bean.pd_opsubject2}
				</div>
				<div class="cell" data-title="op2_price">
				₩${ibean.op2_price}
				</div>
				<div class="cell" data-title="op2_qty">
				 ${ibean.op2_qty}개
				</div>
				<div class="cell_addr">
				 <a href="javascript:;" id="op2_price" value="${ibean.op2_price * ibean.op2_qty}">${ibean.op2_price * ibean.op2_qty}원</a>
				</div> 
			</div> <!-- row  -->
			
			<!-- 옵션3  -->
			<div class="third">
				<div class="cell" data-title="pd_opsubject3">
				 ${bean.pd_opsubject3}
				</div>
				<div class="cell" data-title="op3_price">
				₩${ibean.op3_price}
				</div>
				<div class="cell" data-title="op3_qty">
				 ${ibean.op3_qty}개
				</div>
				<div class="cell_addr">
				 <a href="javascript:;" id="op3_price" value="${ibean.op3_price * ibean.op3_qty}">${ibean.op3_price * ibean.op3_qty}원</a>
				</div> 
			</div> <!-- row  -->
		  </div> <!-- row header  -->
		  
		<h2> 총 결제금액 : ${ibean.inv_price}원</h2>
		
	  <input type="button" class="pay_btn" value="투자 현황 확인" onclick="location.href='./myPageReward.my'">
	  <input type="button" class="pay_btn" value="메인으로 돌아가기" onclick="location.href='./ReturnMain.in'">
	</div>			
</body>
</html>