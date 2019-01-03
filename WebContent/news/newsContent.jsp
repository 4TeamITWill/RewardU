<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리듀 RewardU | News</title>
<style type="text/css">

#reNewsRead_content { width: 800px;
	text-align: left;
	border: 1px solid red;
}

.reNewsRead_container {
	border: 1px solid blue;
}

</style>

</head>
<body>
<div class="wrap">
	<div class="container" align="center">
	
	<div id="reNewsRead_content">
		<div align="right"><input type="button" value="글삭제" onclick="location.href='./NewsDeleteAction.news?no=${nbean.reNews_no}'"></div>
		<div class="reNewsRead_container">
			<h6>${nbean.reNews_category }</h6>
			<h3>${nbean.reNews_title}</h3>
			<span>${nbean.user_name }(${nbean.user_id })</span>&nbsp;&nbsp;<span>${nbean.reNews_date }</span>
			<span>&nbsp;&nbsp;조회수 ${nbean.reNews_views }</span>
			<hr>
			<div>
			${nbean.reNews_content }
			</div>
		</div><!-- reNewsRead_contaioner -->
	
		<div align="center"><input type="button" value="목록으로" onclick="location.href='./NewsAction.news'"></div>
	</div><!-- reNewsRead_content -->
	
	
	</div><!-- container -->
	
</div><!-- wrap -->


</body>
</html>