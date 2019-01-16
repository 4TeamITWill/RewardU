<%@page import="java.util.ArrayList"%>
<%@page import="admin_db.ReplyBean"%>
<%@page import="admin_db.ReplyDAO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<%@page import="java.util.List"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
div.user{
	font-size: 30px;
}

div.date{
	font-size: 10px;
}

div.content{
	padding: 20px;
	background: #F4F2F2; 
	border-radius: 20px;
	 word-break: keep-all;
      word-wrap: break-word;
}
/*  뎃글 버튼 css */
#replybutton{
	display : inline-block;
	border: 1 ;
	outline: 0; 
	padding: 10px;
	float: right;
	border-radius: 0.35em;
	background-color: #FFFFFF;
}



/* 답글버튼 css */
#button{
	background-color: #FFFFFF;
	border: 1;
	outline: 0;
	
}

#content2{
	background: #FFFFFF;
	padding: 20px;
	word-break: keep-all;
    word-wrap: break-word;
}
</style>
</head>




<body>
<%
String id = (String)session.getAttribute("id");
int pd_no = Integer.parseInt(request.getParameter("pd_no"));
BoardDAO bdao = new BoardDAO();
BoardBean bdto = new BoardBean();
bdto = bdao.getBoard(pd_no);
int group_num= Integer.parseInt(request.getParameter("group_num"));

	
%>

<!-- 답글  버튼 클릭 효과  -->
<script type="text/javascript">
		$(document).ready(function() { 
					
			$(".buttonstar").show(); 

            $(".buttonstarrate").hide(); 


			
			$(".buttonstar").on("click", function() {
				<%
					if(id==null){
					%>
						alert("로그인해주세요");	
					<%
					}else{
					%>
						$(".buttonstarrate").slideToggle('3000');
						
					<%
					}
				%>
				
			});
		});	
		
</script>



	<div class="ma2">


		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			<p style="color: #4a4a4a; font-size: 15px; line-height: 20px; margin-bottom: 5px;">댓글
				작성 유의사항</p>
			<ul style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
				<li>펀딩 취소와 리워드 옵션 및 배송지 변경은 펀딩 기간(2019.01.08 ~ 2019.01.22)동안만 <a href="#">펀딩 내역</a>에서 가능합니다.</li>
				<li>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한 답변을 받을 수 있습니다.</li>
				<li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li>
				<li>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수
					있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			
				<c:if test="${ id == null }">
					<textarea rows="5" cols="130"  readonly>로그인 후 댓글 달기</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 
					<form action="./ReplyWriteActions.ad" method="post">
					<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
					<input type="hidden" name="user_id"  value="<%=id%>">
												
						<textarea rows="5" cols="110" placeholder="댓글 작성" name="content"></textarea>
					</div>
					<br/>
						<button type="submit" id="replybutton">댓글입력</button>
					</form>
				</c:if>
			
		
		
		<br/>
		
			
				
				<%
					ReplyDAO dao = new ReplyDAO();
					ArrayList<ReplyBean> list = dao.getList(pd_no);
					if(list.size()>0){
						request.setAttribute("reply", 1);
						request.setAttribute("replylist", list);
					}else{
						request.setAttribute("reply", 0);
					}
				%>
				
				
				<c:if test="${reply == 1}">
					
					<c:forEach var="rlist" items="${replylist}">
						<c:choose>
							<c:when test= "${rlist.seq == 0 }">
					
								<div class="user">
										${rlist.user_id}
								</div>
								<div class="date">
									작성 날자 : ${rlist.date}	
								</div>
							
								<div  class="content">
								${rlist.content}
								</div>
						<tr>
							<td><button class="buttonstar" id="button">답글</button></td>
						</tr>		
						<tr>
							<td>		
							<form action="./RerepWriteActions.ad?re_no=${rlist.re_no }&group_num=${rlist.group_num}&seq=${rlist.seq}&lev=${rlist.lev}" method="post" class="buttonstarrate">
								<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
								<input type="hidden" name="user_id"  value="<%=id%>">
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="./img/rewrite.jpg" width="30" height="30"><textarea rows="1" cols="50" placeholder="답글 입력" name="content"></textarea>
								<button type="submit" class="" > 답글입력 </button>
							</form>
							</td>
													
						</tr>
							<hr>
						</c:when>
						<c:when test="${rlist.seq >0 }">
							
							<div class="buttonstarrate" id="content2">
								<table>
									<tr>
										<td><img alt="" src="./img/rewrite.jpg" width="30" height="30">${rlist.user_id }</td>
									</tr>
									<tr>
										<td style="font-size: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${rlist.date }</td>
									</tr>
								</table>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="content">${rlist.content }</div>
							</div>
						</c:when>
							</c:choose>
							
								
					</c:forEach>
	
				</c:if>
				
		
		
	
	
		</div>
	




</body>
</html>