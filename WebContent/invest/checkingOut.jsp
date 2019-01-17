<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//인코딩
    	request.setCharacterEncoding("UTF-8");
    %>
    
        <%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="jquery-3.3.1.min.js"></script>
<style type="text/css">


#funding_content {
	border: 1px solid #b44af7;
	width: 800px;
	font-size: 14px;
}

#funding_content hr {
	weight : 50%;
}

#funding_content #form_font_left {
 text-align: left;
 padding-left: 11px;
}

#funding_content #form_font_left h2{
 text-align: left;
 padding-left: 14px;

}

[type='text'] {
  width : 90%;
  height : 50px;
  padding-left : 15px;
  font-size: 14px;
}

.pay_btn{
	background-color: #b44af7;
	color : #fff;
	board : 1px solid;
	padding : 0 1.4em;
	height : 48px;
	line-height : 1;
	font-size : 17px;
}

.addr_btn{
	background-color: #b44af7;
	color : #fff;
	board : 1px solid;
	padding : 0 1em;
	height : 30px;
	line-height : 1;
	font-size : 13px;
}

#searched_addr{
	width: 580px;
}

#inv_price{
	text-decoration: underline;
	color : #b44af7;
	font-size : 20px;
}

ul li{
	padding : 15px;
	border-bottom: 1px solid #e4e4e4;
}

ul li .opsubject{
	margin-bottom: 8px;
    font-size: 14px;
    line-height: 17px;
    color: #b44af7;
    text-align: left;
}

ul li .opcontent{
	margin-bottom: 20px;
    font-size: 12px;
    line-height: 16px;
    color: #686868;
	text-align: left;
}

ul li .sum{
	font-size: 14px;
    line-height: 24px;
    font-weight: 500;
    text-align: right
}


</style>
<title>주문페이지</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

function finding_address() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('searched_addr').value = data.zonecode + ' ' + roadAddr + ' ' + data.jibunAddress;
            

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

//페이지 유효성 체크
function checks(){
	var getName = RegExp(/^[가-힣]+$/);
	var phNumber = /^(010[1-9][0-9]{7})$/;

	
	if($("#inv_investor").val() == ""){
		alert("수령인을 입력해주세요");
		$("#inv_investor").focus();
		return false;
	}
	//이름 유효성 검사
     if(!getName.test($("#inv_investor").val())){
       alert("이름형식에 맞게 입력해주세요")
       $("#inv_investor").val("");
       $("#inv_investor").focus();
       return false;
     }
	
	//주소 공백 검사
	if($("#searched_addr").val() == ""){
		alert("주소를 입력해주세요");
		$("#searched_addr").focus();
		return false;
	}
	//주소2 공백 검사
	if($("#inv_addr2").val() == ""){
		alert("상세주소를 입력해주세요");
		$("#inv_addr2").focus();
		return false;
	}
	//연락처 공백 검사
	if($("#inv_phone").val() == ""){
		alert("연락처를 입력해주세요");
		$("#inv_phone").focus();
		return false;
	}
	//이름 유효성 검사
    if(!phNumber.test($("#inv_phone").val())){
      alert("전화번호 형식에 맞게 입력해주세요")
      $("#inv_phone").val("");
      $("#inv_phone").focus();
      return false;
    }
	//총금액 "0"일때 결제 불가
    var total= $("#inv_price").attr('value');
	  if(total == '0'){
		 alert("결제할 상품이 없습니다. 다시 선택해주세요")
		 return false;
	 }
	 
}





 
</script>

</head>
<body>
<%
	Calendar date = Calendar.getInstance();
	SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
%>


  <center>
	<div class="wrap">
		<div class="margin"></div>
	
	<form action="InvestingInsertController.in" method="post" onsubmit="return checks()">
		
	<div class="container" align="center">
		
		<div id="funding_content" align="center" >
		 <div class="ibean_hidden" align="center">
     		  <h2>${ibean.user_id}의  "${ibean.inv_name}" <br/>
     		    	 상품선택내역
     		  </h2>
			<hr>
		<ul>
		  <li><!-- 옵션1  -->
			<h2 class="opsubject"> ${bean.pd_opsubject1}</h2> 
			<p class="opcontent">${bean.pd_opcontent1}</p>
			<p class="sum">수량 : ${ibean.op1_qty}개
			<br/> 
			 ${ibean.op1_price * ibean.op1_qty}원 </p>
		  </li>
		  <li><!-- 옵션2  -->
			 <h2 class="opsubject"> ${bean.pd_opsubject2} </h2>
			 <p class="opcontent">${bean.pd_opcontent2}</p>
			<p class="sum">수량 : ${ibean.op2_qty}개 
			<br/>
			 ${ibean.op2_price * ibean.op2_qty}원 </p>
		  </li>
		  <li><!-- 옵션3  -->
			 <h2 class="opsubject"> ${bean.pd_opsubject3}</h2>
			 <p class="opcontent">${bean.pd_opcontent3}</p>
			<p class="sum">수량 : ${ibean.op3_qty}개 
			<br/>
			 ${ibean.op3_price * ibean.op3_qty}원 </p>
		  </li>
		</ul>	
			<h2 id="inv_price" value="${ibean.inv_price}"> 최종결제금액 : ${ibean.inv_price}원</h2>
			
			<input type="hidden" name="user_id" value="${ibean.user_id}">
			<input type="hidden" name="pd_no" value="${ibean.pd_no}">
			<input type="hidden" name="inv_name" value="${ibean.inv_name}">
			<input type="hidden" name="inv_price" value="${ibean.inv_price}">
			<input type="hidden" name="op1_price" value="${ibean.op1_price}">
			<input type="hidden" name="op1_qty" value="${ibean.op1_qty}">
			<input type="hidden" name="op2_price" value="${ibean.op2_price}">
			<input type="hidden" name="op2_qty" value="${ibean.op2_qty}">
			<input type="hidden" name="op3_price" value="${ibean.op3_price}">
			<input type="hidden" name="op3_qty" value="${ibean.op3_qty}">
			<input type="hidden" name="pd_realfile" value="${ibean.pd_realfile}">
		</div>
			<fieldset>
				<!-- 이름 -->
					<input type="text" name="inv_investor" id="inv_investor" placeholder="이름" ><br/>
				<!-- 주소 -->
					<input type="text" name="inv_addr1" id="searched_addr" placeholder="배송주소">
					<input type="button" class="addr_btn" onclick="finding_address()" value="우편번호 찾기">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="inv_addr2" id="inv_addr2" placeholder="상세주소"><br/>
				<!-- 연락처 -->
					<input type="text" name="inv_phone" id="inv_phone" placeholder="연락처를  '-'없이 입력해 주세요 ">
			</fieldset>
		</div>
		
	<div class="margin3"></div>
	
		<fieldset class="confirm">
			<input type="submit" class="pay_btn" value="결정"><br>
			<input type="reset" class="pay_btn" value="취소" onclick="location.href='./ReturnMain.in'">
		</fieldset>
		
		</form>
		
	</div><!-- funding_content -->

	
	
	<div class="margin4"></div>
	
	</div><!-- container -->
	
	</div><!-- wrap -->
  </center>
</body>

</html>