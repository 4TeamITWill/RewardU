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

<link href="css/invest.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function pd_Check() {
		var total_price = $('#total_price').val();
		
		if(total_price == '0'){
			alert("옵션을 선택해주세요.");
			return false;
		}
	}
</script>

</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
  <center class="option_center">
   <form action="InvestingOptionController.in" method="post" onSubmit="return pd_Check();">
  	<input type="hidden" name="pd_no" value="${bean.pd_no}">
  	<input type="hidden" name="pd_subject" value="${bean.pd_subject}">
  	<input type="hidden" name="user_id" value="<%=id%>">
  	<input type="hidden" name="op1_price" value="${bean.pd_opprice1}">
  	<input type="hidden" name="op2_price" value="${bean.pd_opprice2}">
  	<input type="hidden" name="op3_price" value="${bean.pd_opprice3}">
  	<input type="hidden" name="pd_realfile" value="${bean.pd_realfile}">
  	
  	<input type="hidden" name="pd_opsubject1" value="${bean.pd_opsubject1}">
  	<input type="hidden" name="pd_opsubject2" value="${bean.pd_opsubject2}">
  	<input type="hidden" name="pd_opsubject3" value="${bean.pd_opsubject3}">
  
<div class="option_list">
	<!-- 제목 -->
	<h2 class="subject_title">${bean.pd_subject}</h2>
    
    <c:if test="${bean.pd_opcontent1 ne '' and bean.pd_opcontent1 ne null}">
     <h3>
    	 <input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent1">
    	 ${bean.pd_opsubject1}
    	 
     </h3>
     <span>${bean.pd_opcontent1}</span>
    </c:if>
   	 <div class="option1_div">
		<h4>금액 : <input type="text" id="expense_price1" size="10" value="${bean.pd_opprice1}" readonly>
			수량 : <input type="button" id="minus1" value=" - ">
			<input type="text" id="expense_amount1" value="0" size="3" name="op1_qty" readonly>
			<input type="button" id="plus1" value=" + ">
			합계 : <input type="text" name="op1_priceTotal" id="expense_total1" size="10" value="0" readonly >
		</h4>
     </div>
     <br/><br/>
     
     
    <c:if test="${bean.pd_opcontent2 ne '' and bean.pd_opcontent2 ne null}">
		<h3>
			<input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent2">
			${bean.pd_opsubject2}
		</h3>
		<span>${bean.pd_opcontent2}</span>
	</c:if>
	<div class="option2_div">
		<h4>금액 : <input type="text" id="expense_price2" size="10" value="${bean.pd_opprice2}" readonly>
			수량 : <input type="button" id="minus2" value=" - " >
			<input type="text" id="expense_amount2" value="0" size="3" name="op2_qty" readonly>
			<input type="button" id="plus2" value=" + ">
			합계 : <input type="text" name="op2_priceTotal" id="expense_total2" size="10" value="0" readonly >
		</h4>
	</div>
	<br/><br/>
           
    <c:if test="${bean.pd_opcontent3 ne '' and bean.pd_opcontent3 ne null}">         	
	 <h3>
		<input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent3">
		${bean.pd_opsubject3}
	 </h3>
	 <span>${bean.pd_opcontent3}</span>
	</c:if>
	<div class="option3_div">
	  <h4>
		금액 : <input type="text" id="expense_price3" size="10" value="${bean.pd_opprice3}" readonly>
		수량 : <input type="button" id="minus3" value=" - ">
		<input type="text" id="expense_amount3" value="0" size="3" name="op3_qty" readonly>
			<input type="button" id="plus3" value=" + ">
		합계 : <input type="text" name="op3_priceTotal" id="expense_total3" size="10" value="0" readonly >	 
	 </h4>
	</div>
	<br/><br/>
	
	<div class="section_chk">
		${bean.pd_subject}에 <input type="text" id="total_price" value="0" readonly>
		원을 펀딩합니다.
		 <br/><br/>
		<input type="submit" value="다음 단계로  >" class="next_btn">
	</div>
</div>
		
	</form>
  </center>
</body>
</html>