<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="_container">
	<font size="2" style="font-weight : 550;">*리워드는 최소 1개, 최대 3개까지 등록가능합니다.</font>	
<form action="dsf" method="post">
	<table width="100%">
		<!-- 리워드 1 -->
		<tr height="70">
			<td colspan="2"><font style="font-size : 22px; font-weight : bold;">리워드1</font></td>
		</tr>
		
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">가격</td>
			<td><input type="text" id="pd_opprice1" name="pd_opprice1" onblur="addOp1();"> 원</td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 명</td>
			<td><input type="text" id="pd_opcontent1" name="pd_opcontent1" onblur="addOp1();" style="width:100%;"></td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 설명</td>
		</tr>
		<!-- 리워드 2 -->		
		<tr height="70">	
			<td colspan="2"><font style="font-size : 22px; font-weight : bold;">리워드2</font></td>
		</tr>
		
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">가격</td>
			<td><input type="text" id="pd_opprice2" name="pd_opprice2" onblur="addOp2()"> 원</td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 명</td>
			<td><input type="text" id="pd_opcontent2" name="pd_opcontent2" style="width:100%;" onblur="addOp2()"></td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 설명</td>
		</tr>
		<!-- 리워드 3 -->
		<tr height="70">	
			<td colspan="2"><font style="font-size : 22px; font-weight : bold;">리워드3</font></td>
		</tr>
		
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">가격</td>
			<td><input type="text" id="pd_opprice3" name="pd_opprice3" onblur="addOp3()"> 원</td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 명</td>
			<td><input type="text" id="pd_opcontent3" name="pd_opcontent3" style="width:100%;" onblur="addOp3()"></td>
		</tr>
		<tr height="20">	
			<td width="100" style="padding-left : 12px; font-weight : bold;">리워드 설명</td>
		</tr>
	</table>
</form>
	<div class="op_teaser_container">
		<!-- 네모박스 -->
		<div id="op1_teaser">
			<!-- 리워드명 -->
			<div id="op1_name"></div>
			<!-- 리워드 내용 -->
			<div id="op1_desc"></div>
			<!-- 리워드 가격 -->
			<div id="op1_price"></div>
		</div>
		<div id="op2_teaser">
			<div id="op2_name"></div>
			<div id="op2_desc"></div>
			<div id="op2_price"></div>
		</div>
		<div id="op3_teaser">
			<div id="op3_name"></div>
			<div id="op3_desc"></div>
			<div id="op3_price"></div>
		</div>
	</div>
	
	<br/><br/>
	

		<input id="save" type="submit" value="저장하기"> &nbsp;&nbsp;
		<input id="reward" type="submit" value="펀딩 신청하기">
		
<script>
	//리워드 1번 값 입력 후 포커스 이동시 값 바로받아오기
	function addOp1(){
		
		var pd_opprice1 = document.getElementById("pd_opprice1").value;
		var pd_opcontent1 = document.getElementById("pd_opcontent1").value;
		
		var op1_teaser = document.getElementById("op1_teaser");		
		var op1_price = document.getElementById("op1_price");
		var op1_name = document.getElementById("op1_name");
		
		//둘다 빈칸이 아니면 박스가 생기고 값을 넣어준다.
		if($.trim(pd_opprice1) != "" && $.trim(pd_opcontent1) != ""){
			op1_price.innerHTML = pd_opprice1 + "원";
			op1_name.innerHTML = pd_opcontent1;		
			op1_teaser.style.display = "flex";
		//둘다 빈칸이면 박스가 없어진다
		}else if($.trim(pd_opprice1) == "" && $.trim(pd_opcontent1) == ""){
			op1_teaser.style.display = "none";
		//둘중 하나라도 값이 있으면 넣어져있는 값을 박스에 넣어준다 	
		}else{
			op1_price.innerHTML = pd_opprice1 + "원";
			op1_name.innerHTML = pd_opcontent1;		
			op1_teaser.style.display = "flex";
		}
	}
	//리워드 2번 값 입력 후 포커스 이동시 값 바로받아오기
	function addOp2(){
		
		var pd_opprice2 = document.getElementById("pd_opprice2").value;
		var pd_opcontent2 = document.getElementById("pd_opcontent2").value;
		
		var op2_teaser = document.getElementById("op2_teaser");		
		var op2_price = document.getElementById("op2_price");
		var op2_name = document.getElementById("op2_name");
		
		//둘다 빈칸이 아니면 박스가 생기고 값을 넣어준다.
		if(pd_opprice2 != "" && pd_opcontent2 != ""){
			op2_price.innerHTML = pd_opprice2 + "원";
			op2_name.innerHTML = pd_opcontent2;		
			op2_teaser.style.display = "flex";
		//둘다 빈칸이면 박스가 없어진다
		}else if(pd_opprice2 == "" && pd_opcontent2 == ""){
			op2_teaser.style.display = "none";
		//둘중 하나라도 값이 있으면 넣어져있는 값을 박스에 넣어준다 	
		}else{
			op2_price.innerHTML = pd_opprice2 + "원";
			op2_name.innerHTML = pd_opcontent2;		
			op2_teaser.style.display = "flex";
		}
	}
	//리워드 3번 값 입력 후 포커스 이동시 값 바로받아오기
	function addOp3(){
		
		var pd_opprice3 = document.getElementById("pd_opprice3").value;
		var pd_opcontent3 = document.getElementById("pd_opcontent3").value;
		
		var op3_teaser = document.getElementById("op3_teaser");		
		var op3_price = document.getElementById("op3_price");
		var op3_name = document.getElementById("op3_name");
		
		//둘다 빈칸이 아니면 박스가 생기고 값을 넣어준다.
		if(pd_opprice3 != "" && pd_opcontent3 != ""){
			op3_price.innerHTML = pd_opprice3 + "원";
			op3_name.innerHTML = pd_opcontent3;		
			op3_teaser.style.display = "flex";
		//둘다 빈칸이면 박스가 없어진다
		}else if(pd_opprice3 == "" && pd_opcontent3 == ""){
			op3_teaser.style.display = "none";
		//둘중 하나라도 값이 있으면 넣어져있는 값을 박스에 넣어준다 	
		}else{
			op3_price.innerHTML = pd_opprice3 + "원";
			op3_name.innerHTML = pd_opcontent3;		
			op3_teaser.style.display = "flex";
		}
	}

</script>		
</div>	
</body>
</html>