<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>리듀 RewardU | News</title>
<style type="text/css">

#newsWrite_header {
	font-size: 25px;
	font-weight: 500;
	padding: 40px 0;
	background-color: #efedea;
}

#newsWrite_content {

	width: 850px;
	border: 1px solid #fff;
	text-align: left;
}

</style>

<script type="text/javascript">
	


</script>

</head>
<body>
<div class="wrap">
	<div class="container" align="center">
		<div id="newsWrite_header">리듀 News Form</div>
		<div id="newsWrite_content">
			<hr>
			<form action="./NewsWriteAction.news" method="post" enctype="multipart/form-data" name="f">
			<table width="1000px">
				<tr>
					<td>작성자</td>
					<td>
						<input type="hidden" name="user_id" value="${sessionScope.id }">
						<input type="text" name="user_name" style="height: 25px;" value="${sessionScope.name }" readonly">
					</td>
				</tr>
				<tr>
					<td width="80">제목</td>
					<td width="300" ><input type="text" style="width: 650px; height: 25px;" name="reNews_title"></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="reNews_category">
							<option>리듀이야기</option>
							<option>새소식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>글 요약</td>
					<td><input type="text" style="width: 650px; height: 25px;" name="reNews_summary" placeholder="글 목록에서 보여짐"></td>
				</tr>
				<tr>
					<td>대표 이미지</td>
					<td><input type="file" name="reNews_img"></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td ><textarea style="width:750px;" id="reNews_content_editor" name="reNews_content"></textarea></td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td><input type="file" name="reNews_file"></td>
				</tr>
			</table>
			<hr>
			<div align="center">
				<div class="margin2"></div>
				<input type="submit" id="newsWrite_submit" value="작성완료">
				<input type="reset" value="다시 작성">
				<div class="margin2"></div>
			</div>
			</form>
		</div><!-- newsWrite_content -->
	
	</div><!-- container -->
	
</div><!-- wrap -->
<script>

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "reNews_content_editor",
	    sSkinURI: "./se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	 
	$("#newsWrite_submit").click(function(){
	
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["reNews_content_editor"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	 
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
	    oEditors.getById["reNews_content_editor"].exec("PASTE_HTML", [sHTML]);
	}
	
	
	
	
</script>
</body>
</html>