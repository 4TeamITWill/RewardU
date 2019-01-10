<%@page import="reward.db.RewardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

//저장하기를 눌렀다면 - 처음저장
$("#insert").click(function () {
    $("#f").attr("action","./insertSaveReward.fu");
});
//저장하기를 눌렀다면 - 저장한 적 있음
$("#update").click(function () {
    $("#f").attr("action","./updateSaveReward.fu");
});

//신청하기를 눌렀다면
$("#reward").click(function () {
    $("#f").attr("action","./RewardingWrite2.fu");
});


</script>
</head>
<body>

<div class="_container">
	<font size="2">*리워드는 최소 1개, 최대 3개까지 등록가능합니다.</font>	
	<form action="" method="post" id="f" name="form">
	<table>
	<%
	RewardBean all = null;  //RewardBean all = new RewardBean();처럼 객체생성을 하면 null이 아니게된다 ㅜㅜ 
							//null로 초기화시켜주어야 아래 if else문을 탈수 있다.
	
	if(session.getAttribute("reward") != null){
		
		all = (RewardBean)session.getAttribute("reward");
		System.out.println("reward뷰페이지에서 "+all.getPd_opprice1());
	}
	
	if(all != null){
	%>
		<tr>
			<td width="100">리워드1</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice1" value="<%=all.getPd_opprice1()%>">원<br/>
							리워드 명<input type="text" name="pd_opcontent1"  value="<%=all.getPd_opcontent1()%>"><br/>
							리워드 설명(컬럼추가예정)<br/></td>

		</tr>
		<tr>	
			<td width="100">리워드2</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice2" value="<%=all.getPd_opprice2()%>">원<br/>
							리워드 명<input type="text" name="pd_opcontent2" value="<%=all.getPd_opcontent2()%>"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>
		<tr>	
			<td width="100">리워드3</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice3" value="<%=all.getPd_opprice3()%>">원<br/>
							리워드 명<input type="text" name="pd_opcontent3" value="<%=all.getPd_opcontent3()%>"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>	
	<%
	}else{	
	 %>
		<tr>
			<td width="100">리워드1</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice1">원<br/>
							리워드 명<input type="text" name="pd_opcontent1"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>
		<tr>	
			<td width="100">리워드2</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice2">원<br/>
							리워드 명<input type="text" name="pd_opcontent2"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>
		<tr>	
			<td width="100">리워드3</td>
			<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							가격 <input type="text" name="pd_opprice3" >원<br/>
							리워드 명<input type="text" name="pd_opcontent3"><br/>
							리워드 설명(컬럼추가예정)<br/></td>
		</tr>	
	<%
	}
	%>	
		
		
	</table>
	
	<%
	
	int save = 0;
	
	if(session.getAttribute("save") != null){
		
		save = (Integer)session.getAttribute("save");
	}
	
	if(save != 0){

		
%>		
		<input type="submit" id="update" value="저장하기(update)"/><%=save %>
<%		
 	}else{
%>		
		<input type="submit" id="insert" value="저장하기(insert)"/>
<%	 
	}
%>	

		<input type="submit" id="reward" value="신청하기"/>
	</form>
		
	<br/><br/>
	
		
</div>	
</body>
</html>