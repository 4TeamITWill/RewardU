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

<link href="css/option.css" rel="stylesheet">
<script src="jquery-3.3.1.min.js"></script>
<style type="text/css">

.margin{margin-top: 100px;}
.margin2{margin-top: 50px;}
.margin3{margin-top: 20px;}
.margin4{margin-bottom: 100px;}

#funding_content {
	border: 1px solid;
	width: 600px;
	font-size: 14px;
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

#sidebar {
        width: 260px;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
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
결정시간 :  <b> <%= today.format(date.getTime()) %></b> 입니다. <br>


  <center>
	<div class="wrap">
		<div class="margin"></div>
	
	<form action="InvestingInsertController.in" method="post" onsubmit="return checks()">
		
	<div class="container" align="center">
		
		<div id="funding_content" align="center" >
		 <div class="ibean_hidden" align="center">
     		<h2> 아이디 : ${ibean.user_id}</h2>
			<h2> 게시글 번호 : ${ibean.pd_no}</h2>
			
			<h2> 게시글 제목 : ${ibean.inv_name}</h2>
			<hr>
			<h2> 옵션1 ${ibean.op1_price} x ${ibean.op1_qty} : ${ibean.op1_price * ibean.op1_qty} </h2><br/>
			<h2> 옵션2 ${ibean.op2_price} x ${ibean.op2_qty} : ${ibean.op2_price * ibean.op2_qty} </h2><br/>
			<h2> 옵션3 ${ibean.op3_price} x ${ibean.op3_qty} : ${ibean.op3_price * ibean.op3_qty} </h2><br/>
			
			<h2 id="inv_price" value="${ibean.inv_price}"> 총 금액 : ${ibean.inv_price}원</h2>
			
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
		</div>
		
			<fieldset>
				<!-- 이름 -->
					<input type="text" name="inv_investor" id="inv_investor" placeholder="이름" ><br/>
				<!-- 주소 -->
					<input type="text" name="inv_addr1" id="searched_addr" placeholder="배송주소">
					<input type="button" onclick="finding_address()" value="우편번호 찾기">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="inv_addr2" id="inv_addr2" placeholder="상세주소"><br/>
				<!-- 연락처 -->
					<input type="text" name="inv_phone" id="inv_phone" placeholder="연락처를  '-'없이 입력해 주세요 ">
			</fieldset>
		</div>
		
	<div class="margin3"></div>
	
		<fieldset class="confirm">
			<input type="submit" value="결정"><br>
			<input type="reset" value="취소" onclick="location.href='index.jsp'">
		</fieldset>
		
		</form>
		
	</div><!-- funding_content -->

	
	
	<div class="margin4"></div>
	
	</div><!-- container -->
	
	</div><!-- wrap -->
  </center>
</body>

</html>