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
	<font size="2">*리워드는 최소 1개, 최대 3개까지 등록가능합니다.</font>	
	
	<table>
		<tr>
			<td width="100">리워드1</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 <input type="text" name="pd_opprice1">원<br/>
							리워드 명<input type="text" name="pd_opcontent1"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>
		<tr>	
			<td width="100">리워드2</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 <input type="text" name="pd_opprice2">원<br/>
							리워드 명<input type="text" name="pd_opcontent2"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>
		<tr>	
			<td width="100">리워드3</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 <input type="text" name="pd_opprice3">원<br/>
							리워드 명<input type="text" name="pd_opcontent3"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>	
	</table>
	
	<br/><br/>
	

		<input id="save" type="submit" value="저장하기"> &nbsp;&nbsp;
		<input id="reward" type="submit" value="펀딩 신청하기">
</div>	
</body>
</html>