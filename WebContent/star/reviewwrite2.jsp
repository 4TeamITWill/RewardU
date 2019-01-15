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
</head>





<body>
<%
String id = (String)session.getAttribute("id");
int pd_no = Integer.parseInt(request.getParameter("pd_no"));
BoardDAO bdao = new BoardDAO();
BoardBean bdto = new BoardBean();
bdto = bdao.getBoard(pd_no);


	
%>
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
				<li>펀딩 취소와 리워드 옵션 및 배송지 변경은 펀딩 기간(2019.01.08 ~ 2019.01.22)동안만 <a href="/web/wmypage/myfunding/fundinglist">펀딩 내역</a>에서 가능합니다.</li>
				<li>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한 답변을 받을 수 있습니다.</li>
				<li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li>
				<li>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수
					있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
		<div>
				<c:if test="${ id == null }">
					<textarea rows="5" cols="50"  readonly>로그인 후 댓글 달기</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 
					<form action="./ReplyWriteActions.ad" method="post">
					<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
					<input type="hidden" name="user_id"  value="<%=id%>">
												
						<textarea rows="5" cols="50" placeholder="댓글 작성" name="content"></textarea>
						<button type="submit">댓글입력</button>
					</form>
				</c:if>
			</div>
		</div>
		<br/>
		
			<table>
				
				<%
					ReplyDAO dao = new ReplyDAO();
					ReplyBean bb = dao.getData(pd_no);
					request.setAttribute("bb",bb);
					
					
					ArrayList<ReplyBean> list = dao.getList(pd_no);
					if(list.size()>0){
						request.setAttribute("reply", 1);
						request.setAttribute("replylist", list);
					}else{
						request.setAttribute("reply", 0);
					}
				%>
				
				
				<c:if test="${reply == 1 }">
					
					<c:forEach var="rlist" items="${replylist }">
						<tr>
							<td >${rlist.user_id}</td>
							<td > 작성 날자 : ${rlist.date}</td>
						</tr>	
						<tr>
							<td>${rlist.content}</td>
						</tr>
						<tr>
							<td><button class="buttonstar">답글</button></td>
						</tr>
							<tr>
										
							 <td class="buttonstarrate">
										<form action="./RerepWriteActions.ad" method="post">
											<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
											<input type="hidden" name="user_id"  value="<%=id%>">
											<input type="hidden" name="group_name"  value="<%=bb.getGroup_num()%>">
											<input type="hidden" name="seq"  value="<%=bb.getSeq()%>">
											<input type="hidden" name="lev"  value="<%=bb.getLev()%>">
								
											 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="1" cols="50" placeholder="답글  작성" name="content"></textarea>
											<button type="submit"> 댓글입력 </button>
										</form>
										<div>${rlist.user_id},작성 날자 : ${rlist.date},답글내용 ${rlist.content}</div>
							</td>
											
							</tr>
						<tr>
							<td>-------------------------------------------------------------------------</td>
						</tr>
						</c:forEach>
					
						
					
				
				</c:if>
				
		
			</table>
		</div>
	
	
	<hr>




</body>
</html>