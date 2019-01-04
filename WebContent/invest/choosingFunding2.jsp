<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/option.css" rel="stylesheet">
<script src="jquery-3.3.1.min.js"></script>

<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

/*
 
 $(document).ready(function(){
	
	 마우스 over 시 컬러 변경 */
	 
   /*     $("#pd_opcontent1").change(function(){
    	  if($("#pd_opcontent1").is(":checked")){
		alert("pd_opcontent1 체크했음");
	}else{
		alert("pd_opcontent1 체크해제");
	}
      });
      
	
	$("li").mouseover(function(){
		$("li").css("background-color", "#E51075");
	});
	$("li").mouseout(function(){
		$("li").css("background-color", "#f9f9f9");
	});
	   */
	  
	  /*  $("input[name=option_check1]:checked").each(function(){
		 // $(this).css("background-color", "#E51075");
		   var test = $(this).val(); 

		   alert("벨류값확인 : " + test);
	  }); */
	  
	  
	  
	 /*   $(".reward-check").click(function(){
		 var str="";
		 $(".reward-check").each(function(){
			if($(this).is(":checked"))
				str += $(this).val() + " ";
				
		 });
		$("#multiPrint").text(str);
	  });
	
	  
	 
	  $(".option_function").hide();
	  
	  
	  $("li").each(function(){
	    $(document).on("click",".option",function(){
				$(this).css("background-color", "#E51075");
			//	$(".reward-check").checkValue(this);
				$(".option_function").show( );
		 });
	   });
	  
	 
	 
});
 */
//-------------------------------------------------------------- 
 /* $(document).ready(function(){
		  
			$('#minus').click(function(){
				var stat = $('#expense_amount').val();
				console.log('stat : ' + stat);
				var num = stat * 1;
				num--;
				if(num <= 0){
					alert('1개 이하로 수량을 선택하실 수 없습니다');
					num=1;
				}
				var expense_price = parseInt($('#expense_price').attr('value'));
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price' + expense_price);
				$('#expense_amount').val(num);
				$('#expense_total').val(expense_price);
			});
			$('.option_function #plus').click(function(){
				var stat = $('.option_function #expense_amount').val();
				console.log('plus stat : ' + stat);
				var num = stat * 1;
				console.log(num);
				num +=1;
				if(num > 3){
					alert('펀딩 수량은 3개까지 구입가능합니다');
					num=3;
				}
				var expense_price = 0;
				expense_price = $('#expense_price').attr('value');
				expense_price *=1;
				expense_price *=num;
				console.log('expense_price' + expense_price);
				$('#expense_amount').val(num);
				$('#expense_total').val(expense_price);
			});
		 }); */
		 function checkQty(kind,qty){
				if(qty != 1){
					location.href="FundingQtyDown.in?kind="+ encodeURIComponent(kind);
				}
			}

 
</script>

</head>
<body>
  <center>
  
  		상품 번호 : ${bean.pd_no}  //  게시글 제목 : ${bean.pd_subject}
  
 checkbox 확인 : <span id="multiPrint"></span><br/>
   <form action="index.jsp?center=checkingOut.jsp" method="post">
		<div class="option_list">
		  <ul class="option_sel">
			  <li class="option">
			    <input type="checkbox" name="option_check1" class="reward-check"  id="pd_opcontent1" value="69,900"><br/>
			         <h3>옵션1 가격 : ${bean.pd_opprice1}</h3><br/>
			           
			     <p>${bean.pd_opcontent1}<br/></p>
			     
		    	 <div class="option_function">
					금액 : <input type="text" id="expense_price" size="10" value="${bean.pd_opprice1}" readonly>
					수량 : <input type="button" id="minus" value=" - ">
					<input type="text" id="expense_amount" value="0" size="3">
						<input type="button" id="plus" value=" + ">
					합계 : <input type="text" id="expense_total" size="10" readonly >
			     </div>
			     
			     
			    </li>
              <li class="option">
              	<input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent2" value="79,900"><br/>
				 <h3>옵션2 가격 : ${bean.pd_opprice2}</h3><br/>
				 <p>${bean.pd_opcontent2}<br/></p>
				 
				<div class="option_function">
					금액 : <input type="text" id="expense_price" size="10" value="${bean.pd_opprice2}" readonly>
					수량 : <input type="button" id="minus" value=" - ">
					<input type="text" id="expense_amount" value="0" size="3">
						<input type="button" id="plus" value=" + ">
						<!-- 수량 변경 <input type="text" id="testvalue">
						 -->
				</div>
				
              </li>
              <li class="option">
            	<input type="checkbox" name="option_check" class="reward-check"  id="pd_opcontent3" value="89,900"><br/>
				<h3>옵션3 가격 : ${bean.pd_opprice3}</h3><br/>
				<p>${bean.pd_opcontent3}<br/></p>
				
				
				<div class="option_function">
					금액 : <input type="text" id="expense_price" size="10" value="${bean.pd_opprice3}" readonly>
					수량 : <input type="button" id="minus" value=" - ">
					<input type="text" id="expense_amount" value="0" size="3">
						<input type="button" id="plus" value=" + ">
						<!-- 수량 변경 <input type="text" id="testvalue">
						 -->
						 
				</div>
					
              </li>
             </ul>
		</div>
합계 : <input type="text" id="expense_total" size="10" readonly >
	   <input type="submit" value="다음 단계로  >">
	</form>
  </center>
</body>
</html>