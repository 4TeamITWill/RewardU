<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 RewardU | News</title>
</head>
<body>
<div class="wrap">
	<div class="container" align="center">
	<h2>리듀 News Form</h2>
		<div id="newsWrite_content">
			<form action="./NewsWriteAction.news">
			<table>
				<tr>
					<td>작성자</td>
					<td>
						<input type="hidden" name="user_id" value="${sessionScope.id }">
						<input type="text" name="user_name" value="${sessionScope.name }" readonly>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="reNews_title"></td>
					<td>
						<select name="reNews_category">
							<option>리듀이야기</option>
							<option>새소식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>글 요약</td>
					<td><input type="text" name="reNews_summary" placeholder="글 목록에서 보여짐"></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea id="reNews_content_editor" name="reNews_content"></textarea></td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td><input type="file" name="reNews_file"></td>
				</tr>
			</table>
			<input type="submit" value="작성완료">
			<input type="reset" value="다시 작성">
			</form>
		</div><!-- newsWrite_content -->
	
	</div><!-- container -->
	
</div><!-- wrap -->

</body>
</html>