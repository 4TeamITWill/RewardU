<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//처음 저장하기를 눌렀다면 = session에 pd_no값이 없다면

	$("#insert").click(function () {
			$("#f").attr("action","./insertSaveSeller.fu");
	});
 	 $("#update").click(function () {
		$("#f").attr("action","./updateSaveSeller.fu");
	}); 
	
	function next() {
		if (confirm(" 저장하기를 하지 않았다면 작성된 내용은 저장되지 않습니다. \n 다음단계로 가시겠습니까? ") == true){ //check
			location.href='board.fu';
		}else{
		 return;
		}
	}
	
</script>
</head>
<body>

<div class="_container">
	<form action="" method="post" id="f" name="form">
			<table width="100%">	
				<tr height="40">	
					<td width="20%" style="font-weight : bold;">회사이름</td>
					<td width="80%"><input type="text" name="company" style="width : 60%;"></td>
				</tr>
				<tr height="40">	
					<td style="font-weight : bold;">사업자등록번호</td>
					<td><input type="text" name="company_no" style="width : 60%;"></td>
				</tr>
					
				<tr height="40">		
					<td style="font-weight : bold;">회사전화번호</td>
					<td><input type="text" name="company_tell" style="width : 40%;"></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">회사fax</td>
					<td><input type="text" name="company_fax" style="width : 40%;"></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">사업자주소</td>
					<td><input type="text" name="company_addr" style="width : 80%;"></td>
				</tr>
					
				<tr height="40">	
					<td style="font-weight : bold;">계좌번호</td>
					<td align="left">
						은행<select name="sellerBank">
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="신한">신한</option>
						</select>
					</td>
				</tr>
				<tr height="40">
					<td>
					</td>
					<td>
						<input type="text" name="sellerAccount" placeholder="계좌번호를 입력해주세요." style="width : 60%;">
					</td>
				</tr>		
			</table><br/><br/>	
			
<%-- <%
		HttpSession session2 = request.getSession();
		String pd_no = (String)session2.getAttribute("pd_no");
		
		
		if(pd_no==null){
%>
			<input id="insert" type="submit" value="저장하기"> 
<%		
					
		}else{
%>
			<input id="update" type="submit" value="저장하기">
<%
		}
%>			 --%> 

			<input id="insert" type="submit" value="저장하기">&nbsp;&nbsp;
	</form>	
			
			<button onclick="next();">다음단계로</button>
</div>
</body>
</html>