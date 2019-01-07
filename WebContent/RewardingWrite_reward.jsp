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
/* $("#update").click(function () {
    $("#f").attr("action","./updateSaveReward.fu");
});
 */
//신청하기를 눌렀다면
$("#reward").click(function () {
    $("#f").attr("action","./RewardingSaveGet.fu");
});
 
 function prev() {
		if (confirm(" 저장하기를 하지 않았다면 작성된 내용은 저장되지 않습니다. \t 이전단계로 가시겠습니까? ") == true){ //check
			location.href='board.fu';
		}else{
		 return;
		}
	}


</script>
</head>
<body>

<div class="_container">
	<font size="2">*리워드는 최소 1개, 최대 3개까지 등록가능합니다.</font>	
	
	<form action="" method="post" id="f" name="form">
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
		<input id="prev" type="button" value="이전단계" onclick="prev();">	&nbsp;&nbsp;
		<input id="insert" type="submit" value="저장하기(insert)">
		<!-- <input id="update" type="submit" value="저장하기(update)"> -->
		<input id="reward" type="submit" value="펀딩 신청하기">
	
	</form>
	<br/><br/>
	
		
</div>	
</body>
</html>