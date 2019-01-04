<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
 
<%
    	//인코딩
    	request.setCharacterEncoding("UTF-8");
    %> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/option.css" rel="stylesheet">

<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">


 $(document).ready(function(){
		  
			$('#minus1').click(function(){
				var stat = $('#expense_amount1').val();
				var num = stat * 1;
				num--;
				if(num <= -1){
					alert('0개 이하로 수량을 선택하실 수 없습니다');
					num=0;
				}
				var expense_price = parseInt($('#expense_price1').attr('value'));
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price1' + expense_price);
				$('#expense_amount1').val(num);
				$('#expense_total1').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			$('#plus1').click(function(){
				var stat = $('#expense_amount1').val();
				var num = stat * 1;
				console.log(num);
				num +=1;
				if(num > 3){
					alert('펀딩 수량은 3개까지 구입가능합니다');
					num=3;
				}
				var expense_price = 0;
				expense_price = $('#expense_price1').attr('value');
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price1' + expense_price);
				$('#expense_amount1').val(num);
				$('#expense_total1').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			/*  */
			
			$('#minus2').click(function(){
				var stat = $('#expense_amount2').val();
				var num = stat * 1;
				num--;
				if(num <= -1){
					alert('0개 이하로 수량을 선택하실 수 없습니다');
					num=0;
				}
				var expense_price = parseInt($('#expense_price2').attr('value'));
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price2' + expense_price);
				$('#expense_amount2').val(num);
				$('#expense_total2').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			$('#plus2').click(function(){
				var stat = $('#expense_amount2').val();
				var num = stat * 1;
				console.log(num);
				num +=1;
				if(num > 3){
					alert('펀딩 수량은 3개까지 구입가능합니다');
					num=3;
				}
				var expense_price = 0;
				expense_price = $('#expense_price2').attr('value');
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price2' + expense_price);
				$('#expense_amount2').val(num);
				$('#expense_total2').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			
			/*  */
			
			$('#minus3').click(function(){
				var stat = $('#expense_amount3').val();
				var num = stat * 1;
				num--;
				if(num <= -1){
					alert('0개 이하로 수량을 선택하실 수 없습니다');
					num=0;
				}
				var expense_price = parseInt($('#expense_price3').attr('value'));
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price3' + expense_price);
				$('#expense_amount3').val(num);
				$('#expense_total3').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			$('#plus3').click(function(){
				var stat = $('#expense_amount3').val();
				var num = stat * 1;
				console.log(num);
				num +=1;
				if(num > 3){
					alert('펀딩 수량은 3개까지 구입가능합니다');
					num=3;
				}
				var expense_price = 0;
				expense_price = $('#expense_price3').attr('value');
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price3' + expense_price);
				$('#expense_amount3').val(num);
				$('#expense_total3').val(expense_price);
				
				var expense_total1 = $('#expense_total1').val();
				var expense_total2 = $('#expense_total2').val();
				var expense_total3 = $('#expense_total3').val();
				var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
				$('#total_price').val(total_price);
			});
			
			$('#pd_opcontent1').click(function() {
				$('.option1_div').slideToggle();
				$('#expense_amount1').val('0');
				$('#expense_total1').val('0');
			});
			$('#pd_opcontent2').click(function() {
				$('.option2_div').slideToggle();
				$('#expense_amount2').val('0');
				$('#expense_total2').val('0');
			});
			$('#pd_opcontent3').click(function() {
				$('.option3_div').slideToggle();
				$('#expense_amount3').val('0');
				$('#expense_total3').val('0');
			});
			
		 });//$(document).ready(function()) 끝
		 
		 
		 
/*  var total =
		parseInt($('#expense_price3').attr('value'));
	console.log(total)
	$('#sumTotal').val(total); */
 
</script>

</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
  <center>
   <form action="InvestingOptionController.in" method="post">
  	<input type="hidden" name="pd_no" value="${bean.pd_no}">
  	<input type="hidden" name="pd_subject" value="${bean.pd_subject}">
  	<input type="hidden" name="user_id" value="<%=id%>">
  	<input type="hidden" name="op1_price" value="${bean.pd_opprice1}">
  	<input type="hidden" name="op2_price" value="${bean.pd_opprice2}">
  	<input type="hidden" name="op3_price" value="${bean.pd_opprice3}">
  	
  		
  
<div class="option_list">
	<!-- 제목 -->
	<h2>${bean.pd_subject}</h2>
    
    <c:if test="${bean.pd_opcontent1 ne ''}">
    	<h3><input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent1">옵션1 : ${bean.pd_opcontent1}</h3>
    </c:if>
   	 <div class="option1_div">
		금액 : <input type="text" id="expense_price1" size="10" value="${bean.pd_opprice1}" readonly>
		수량 : <input type="button" id="minus1" value=" - ">
		<input type="text" id="expense_amount1" value="0" size="3" name="op1_qty" readonly>
			<input type="button" id="plus1" value=" + ">
		합계 : <input type="text" name="op1_priceTotal" id="expense_total1" size="10" value="0" readonly >
     </div>
     <br/><br/>
     
     
    <c:if test="${bean.pd_opcontent2 ne ''}">
		<h3><input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent2">옵션2 : ${bean.pd_opcontent2}</h3>
	</c:if>
	<div class="option2_div">
		금액 : <input type="text" id="expense_price2" size="10" value="${bean.pd_opprice2}" readonly>
		수량 : <input type="button" id="minus2" value=" - " >
		<input type="text" id="expense_amount2" value="0" size="3" name="op2_qty" readonly>
			<input type="button" id="plus2" value=" + ">
			합계 : <input type="text" name="op2_priceTotal" id="expense_total2" size="10" value="0" readonly >
	</div>
	<br/><br/>
           
    <c:if test="${bean.pd_opcontent3 ne ''}">         	
		<h3><input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent3">옵션3 : ${bean.pd_opcontent3}</h3>
	</c:if>
	<div class="option3_div">
		금액 : <input type="text" id="expense_price3" size="10" value="${bean.pd_opprice3}" readonly>
		수량 : <input type="button" id="minus3" value=" - ">
		<input type="text" id="expense_amount3" value="0" size="3" name="op3_qty" readonly>
			<input type="button" id="plus3" value=" + ">
		합계 : <input type="text" name="op3_priceTotal" id="expense_total3" size="10" value="0" readonly >	 
	</div>
	<br/><br/>
	총 금액 : <input type="text" id="total_price" value="0" readonly> <br/>
	<input type="submit" value="다음 단계로  >">
</div>
		
	</form>
  </center>
</body>
</html>