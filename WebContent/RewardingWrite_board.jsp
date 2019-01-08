<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--
		신청하기 버튼을 누르면 게시글 정보와 판매자 정보가 각각 테이블에 추가된다.
	 -->
<div class="_container">		
	<form action="" method="post" id="f" name="form" >
	
		<%String id = (String)session.getAttribute("id");%>
			
		<table width = "100%">
			
			<tr height="40">	
				<td width="15%" style="font-weight : bold;"> 판매자ID</td>
				<td width="85%"><input type="text" name="user_id" value="${id}" readonly="readonly"  style="width : 50%;"></td>
			</tr>
			
			<tr height="40">	
				<td colspan="2" style="font-weight : bold;"> 프로젝트 제목
				<font style="font-size : 14px;"> (상품명)</font></td>				
			</tr>
			
			<tr height="40">
				<td colspan="2"><input type="text" name="pd_subject" style="width : 100%;"></td>
			</tr>
				
			<tr height="40">		
				<td colspan ="2" style="font-weight : bold;"> 상품설명
				<font style="font-size : 13px"> (이미지 포함 상세하게 적어주세요)</font></td>				
			</tr>
			
			<tr height="40">
				<td colspan="2"><textarea name="pd_content" id="textAreaContent" rows="30"  style="width : 100%"></textarea></td>
			</tr>
				
			<tr height="40">	
				<td style="font-weight : bold;"> 카테고리</td>
				<td>
					<select name="pd_category" style="height : 30px;">
						<option value="패션뷰티">패션·뷰티</option>
						<option value="테크가전">테크·가전</option>
						<option value="반려동물">반려동물</option>
						<option value="푸드">푸드</option>
						<option value="홈리빙디자인소품">홈리빙·디자인소품</option>
						<option value="게임스포츠">게임·스포츠</option>
						<option value="여행레저">여행·레저</option>
						<option value="문화교양">문화·교양</option>
						<option value="소셜캠페인">소셜·캠페인</option>
						<option value="교육키즈">교육·키즈</option>
					</select>
				</td>
			</tr>
				
			<tr height="40">		
				<td style="font-weight : bold;">목표금액</td>
				<td><input type="text" name="pd_goalMoney" style="width : 50%;"> 원</td>
			</tr>
				
			<tr height="40">
				<td style="font-weight : bold;"> 대표 이미지</td>
				<td><input type="text" name="pd_file" readonly="readonly" style="width : 50%;">
				<!-- <input type="button" onclick="winopen();" value="첨부하기"><br/> -->
					<button>첨부하기</button><br/>
				</td>		
			</tr>
			<tr height="40">
				<td style="font-weight : bold;">실제파일(히든예정)</td>
				<td>
					<input type="text" id="pd_realFile" name="pd_realFile" style="width : 50%;"><br/>
				</td>
			</tr>
			
			<tr height="40">
				<td style="font-weight : bold;">마감일</td>
				<td><input type="date" name="pd_end" style="width : 50%;"></td>			
			</tr>	
		</table>
		
		<br/><br/>
		
				<input id="save" type="submit" value="저장하기"> &nbsp;&nbsp;
				<input id="reward" type="submit" value="펀딩 신청하기">
	</form>	
</div>
<script>
//스마트 에디터 부분
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "textAreaContent",
    sSkinURI: "./se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
 
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

$("#reward").click(function(){

    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}); 

$("#save").click(function(){

    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}); 

// textArea에 이미지 첨부
function pasteHTML(fname){
	var sHTML = "<img src='http://localhost:8080/RewardU/upload/"+fname+"'>";
    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);

}


$('button').click(function(event){
    window.open("fileUp.jsp","파일첨부","width=500,height=500,scrollbars=yes,top=100,left=40,resizable=yes");
    event.preventDefault();
 });


</script>
		
</body>
</html>