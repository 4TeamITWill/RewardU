<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 등록</title>
</head>
<body>
<section class="writeNotice_sec"><!-- TOP과 FOOTER 사이를 차지하는 공간. -->
	<div class="writeNotice_div"><!-- 실제로 공지사항을 담는 공간 -->
	<form action="./WriteNoticeAction.no">
		<table align="center" class="writeNotice_table">
			<tr>
				<td><input type="text" name="subject" class="writeNotice_sub" placeholder="제목 입력"/></td> 
			</tr>
			<tr>
				<td><textarea name="content" id="textAreaNotice" class="writeNotice_con" placeholder="내용 입력" resize:none;></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록" id="notice_register">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>
	
</section>

<script>

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "textAreaNotice",
    sSkinURI: "./se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
 
$("#notice_register").click(function(){

    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaNotice"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
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
    oEditors.getById["textAreaNotice"].exec("PASTE_HTML", [sHTML]);
}
</script>

</body>
</html>