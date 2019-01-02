<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        //저장하기를 눌렀다면
        $("#save").click(function () {
            $("#f").attr("action","./SaveAction.fu");
        });
        //승인요청하기를 눌렀다면
        $("#reward").click(function () {
            $("#f").attr("action","./RewardingWriteAction.fu");
        });
    });

    
   
    $(document).ready(function(){
        $('button').click(function(){
           window.open("fileUp.jsp","파일첨부","width=500,height=500,scrollbars=yes,top=100,left=40,resizable=yes")	
        });
  });

    
    //업로드 하면 미리보기도 변경되도록..실패
	/* $(document).ready(function(){
		//pd_realFile값 변경시 
		$("#pd_realFile").change(function(){
			var img = ("#pd_realFile").val();
			var thum = "./upload/sm_"+img
			$(".thum img").attr({"src":thum});
		});
	});
 */
	
</script>


</head>
<body>
	<center>
	<h1>펀딩오픈 신청하기</h1><br/>
	<h2 align="center">board정보</h2>
	<!--
		신청하기 버튼을 누르면 게시글 정보와 판매자 정보가 각각 테이블에 추가된다.
	 -->
		
		<form action="" method="post" id="f" name="form" >
		
			<%String id = (String)session.getAttribute("id");%>

			
			<table border="0">
				
				<tr>	
					<td align="right"> 판매자ID</td>
					<td align="left"><input type="text" name="user_id" value="${id}" readonly="readonly" ></td>
				</tr>
				
				<tr>	
					<td align="right"> 프로젝트 제목(상품명)</td>
					<td align="left"><input type="text" name="pd_subject" size="81"></td>
				</tr>
					
				<tr>		
					<td align="right"> 상품설명</td>
					<td align="left"><textarea name="pd_content" id="textAreaContent"></textarea></td>
				</tr>
					
				<tr>	
					<td align="right"> 카테고리</td>
					<td align="left">
						<select name="pd_category">
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
					
				<tr>		
					<td align="right"> 목표금액</td>
					<td align="left"><input type="text" name="pd_goalMoney">원</td>
				</tr>
					
				<tr>
					<td align="right"> 대표 이미지</td>
					<td align="left"><input type="text" name="pd_file" readonly="readonly">
					<!-- <input type="button" onclick="winopen();" value="첨부하기"><br/> -->
						<button>첨부하기</button><br/>
					</td>		
				</tr>
				<tr>
					<td align="right">실제파일(히든예정)</td>
					<td align="left">
						<input type="text" id="pd_realFile" name="pd_realFile"><br/>
					</td>
				</tr>
				
				<tr>
					<td align="right">마감일</td>
					<td><input type="date" name="pd_end"></td>			
				</tr>	
			</table>
			
			<br/><br/>
			
			<h2 align="center">리워드<br/><font size="2">*리워드는 최소 1개, 최대 3개까지 등록가능합니다.</font></h2>
			
			
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
			
			<h2 align="center">seller정보</h2>
			<table>	
				<tr align="center">	
					<td>회사이름</td>
					<td><input type="text" name="company"></td>
				</tr>
				<tr align="center">	
					<td>사업자등록번호</td>
					<td><input type="text" name="company_no"></td>
				</tr>
					
				<tr align="center">		
					<td>회사전화번호</td>
					<td><input type="text" name="company_tell"></td>
				</tr>
				
				<tr align="center">		
					<td>회사fax</td>
					<td><input type="text" name="company_fax"></td>
				</tr>
				
				<tr align="center">		
					<td>사업자주소</td>
					<td><input type="text" name="company_addr"></td>
				</tr>
					
				<tr align="center">	
					<td>계좌번호</td>
					<td align="left">
						은행<select name="sellerBank">
							<option value="국민">국민</option>
							<option value="농협">농협</option>
							<option value="우리">우리</option>
							<option value="신한">신한</option>
						</select>
					</td>
				</tr>
				<tr align="center">
					<td>
					</td>
					<td>
						<input type="text" name="sellerAcount" placeholder="계좌번호를 입력해주세요.">
					</td>
				</tr>		
			</table><br/>	
						<input id="save" type="submit" value="저장하기"> &nbsp;&nbsp;
						<input id="reward" type="submit" value="펀딩 신청하기">
						
					
			
		</form>	
	</center>
	
	
	
<script>

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
</script>
</body>
</html>