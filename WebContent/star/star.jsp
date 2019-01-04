<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>

</head>


<body>
<table>
	<%
	int pd_no = Integer.parseInt(request.getParameter("pd_no"));
	
	BoardBean bdto = new BoardBean();
	BoardDAO bdao = new BoardDAO();
	%>

	<tr>
	<td>
	<form action="./StarWriteActions.bd?pd_no=<%=pd_no%>" method="post">
		<span class="star-input"> 
		<span class="input"> 
		<input type="radio" name="pd_rate" value="1" id="p1"> 
			<label for="p1">1</label> 
		<input type="radio" name="pd_rate" value="2" id="p2">
			 <label for="p2">2</label> 
		<input type="radio" name="pd_rate" value="3" id="p3"> 
			<label for="p3">3</label>
		<input type="radio" name="pd_rate" value="4" id="p4"> 
			<label for="p4">4</label> 
		<input type="radio" name="pd_rate" value="5" id="p5"> 
			<label for="p5">5</label>
		
		</span> 
	
		
		</span>
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/star.js"></script>
		
		 <button type="submit" class="review_button_DY"
			onClick="alert('리뷰가 제출되었습니다')">별점평가</button> 
			<%
			
		
			//double avg = bdao.avgReview(pd_no);
			%>
			<div>명이 참여 하였습니다.</div>
			<%-- <div><%=avg %>평균 평점</div> --%>
			
		</form>
		
		<!--별점 스크립트  -->
	
	
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ 'Effort', 'Amount given' ], [ '남자', 50 ], [ '여자', 40 ],
					[ '기타', 10 ], ]);

			var options = {
				pieHole : 0.5,
				pieSliceTextStyle : {
					color : '#',
				},
				legend : 'none'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('donut_single'));
			chart.draw(data, options);
		}
	</script>

	<div id="donut_single" style="width: 150px; height: 100px;"></div>
<script type="text/javascript">

$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
</script>
<!--별점 스크립트  -->
</td>
<td>
 2번쨰 테이블 부분  sadsad
</td>
	</tr> 
	
</table>
	
	
</body>
</html>