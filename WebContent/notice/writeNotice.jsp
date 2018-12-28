<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<td><textarea name="content" class="writeNotice_con" placeholder="내용 입력" resize:none;></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>
	
</section>
</body>
</html>