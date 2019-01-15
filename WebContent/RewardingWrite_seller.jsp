<%@page import="reward.db.RewardBean"%>
<%@page import="reward.db.RewardDAO"%>
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

	
</script>
</head>
<body>

<div class="_container">
	<form action="" method="post" id="f" name="form">
			<table width="100%">
			
			<%
			RewardBean all = null;
			
			
			if(session.getAttribute("seller") != null){
				all =(RewardBean)session.getAttribute("seller");
			}
			
			if(all != null){
			%>
				
				<tr height="40">	
					<td width="20%" style="font-weight : bold;">회사이름</td>
					<td width="80%"><input type="text" name="company" style="width : 60%;" value="<%=all.getCompany()%>"></td>
				</tr>
				<tr height="40">	
					<td style="font-weight : bold;">사업자등록번호</td>
					<td><input type="text" name="company_no" style="width : 60%;"  value="<%=all.getCompany_no()%>" ></td>
				</tr>
					
				<tr height="40">		
					<td style="font-weight : bold;">회사전화번호</td>
					<td><input type="text" name="company_tell" style="width : 40%;"  value="<%=all.getCompany_tell()%>"></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">회사fax</td>
					<td><input type="text" name="company_fax" style="width : 40%;"  value="<%=all.getCompany_fax()%>" ></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">사업자주소</td>
					<td><input type="text" name="company_addr" style="width : 60%;"  value="<%=all.getCompany_addr()%>"></td>
				</tr>
					
				<tr height="70">	
					<td style="font-weight : bold;">계좌번호</td>
					<td align="left">
						<select name="sellerBank" style="height : 30px;">
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="신한">신한</option>
						</select>
						<font style="font-size : 13px;">은행</font><br/>
						<input type="text" name="sellerAccount" placeholder="계좌번호를 입력해주세요." style="width : 60%;" value="<%=all.getSellerAccount()%>">
					</td>
				</tr>

<%
			}else{
	
%>
				<tr height="40">	
					<td width="20%" style="font-weight : bold;">회사이름</td>
					<td width="80%"><input type="text" name="company" style="width : 60%;" ></td>
				</tr>
				<tr height="40">	
					<td style="font-weight : bold;">사업자등록번호</td>
					<td><input type="text" name="company_no" style="width : 60%;" ></td>
				</tr>
					
				<tr height="40">		
					<td style="font-weight : bold;">회사전화번호</td>
					<td><input type="text" name="company_tell" style="width : 40%;" ></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">회사fax</td>
					<td><input type="text" name="company_fax" style="width : 40%;" ></td>
				</tr>
				
				<tr height="40">		
					<td style="font-weight : bold;">사업자주소</td>
					<td><input type="text" name="company_addr" style="width : 60%;" ></td>
				</tr>
					
				<tr height="40">	
					<td style="font-weight : bold;">계좌번호</td>
					<td align="left">
						<select name="sellerBank" style="height : 30px;">
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="신한">신한</option>
						</select>
						<font style="font-size : 13px;">은행</font><br/>
						<input type="text" name="sellerAccount" placeholder="계좌번호를 입력해주세요." style="width : 60%;">
					</td>
				</tr>
				
				
<%
		}
			
%>		
			</table><br/><br/>				
<%
		

		int save = 0;
		
		if(session.getAttribute("save") != null){
			
			save = (Integer)session.getAttribute("save");
		}
		
		if(save != 0){
		%>			 
				<center style="min-height : 20px;"><input type="submit" id="update" value="저장하기(update)"/></center>
		<%		
			}else{
		%>		
				<center style="min-height : 20px;"><input type="submit" id="insert" value="저장하기(insert)"/></center>
		<%	 
		}
		%>	

	</form>	

</div>
</body>
</html>