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
/*  ���� ��ư css */
#replybutton{
	display : inline-block;
	border: 1 ;
	outline: 0; 
	padding: 10px;
	float: right;
	border-radius: 0.35em;
	background-color: #FFFFFF;
}



/* ��۹�ư css */
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

<!-- ���  ��ư Ŭ�� ȿ��  -->
<script type="text/javascript">
		$(document).ready(function() { 
					
			$(".buttonstar").show(); 

            $(".buttonstarrate").hide(); 


			
			$(".buttonstar").on("click", function() {
				<%
					if(id==null){
					%>
						alert("�α������ּ���");	
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
			<p style="color: #4a4a4a; font-size: 15px; line-height: 20px; margin-bottom: 5px;">���
				�ۼ� ���ǻ���</p>
			<ul style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
				<li>�ݵ� ��ҿ� ������ �ɼ� �� ����� ������ �ݵ� �Ⱓ(2019.01.08 ~ 2019.01.22)���ȸ� <a href="#">�ݵ� ����</a>���� �����մϴ�.</li>
				<li>������ ���� ���� �� ��� ���Ǵ� '����Ŀ���� �����ϱ�'�� ���� ��Ȯ�� �亯�� ���� �� �ֽ��ϴ�.</li>
				<li>�����ʹ��� ����ó, ����, �̸��� ���� ������ ���������� ���� ������ ������.</li>
				<li>�� ������Ʈ�� ������ ��, ����, �弳, ���, ���� ���� ���� ���� ���� ���� �� ��ġ�� ������ ��
					������, �ش� �������� ���� ����Ŀ, ������, ��3�ڿ��� ���ذ� �߻����� �ʵ��� �����Ͻñ� �ٶ��ϴ�.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			
				<c:if test="${ id == null }">
					<textarea rows="5" cols="130"  readonly>�α��� �� ��� �ޱ�</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 
					<form action="./ReplyWriteActions.ad" method="post">
					<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
					<input type="hidden" name="user_id"  value="<%=id%>">
												
						<textarea rows="5" cols="110" placeholder="��� �ۼ�" name="content"></textarea>
					</div>
					<br/>
						<button type="submit" id="replybutton">����Է�</button>
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
									�ۼ� ���� : ${rlist.date}	
								</div>
							
								<div  class="content">
								${rlist.content}
								</div>
						<tr>
							<td><button class="buttonstar" id="button">���</button></td>
						</tr>		
						<tr>
							<td>		
							<form action="./RerepWriteActions.ad?re_no=${rlist.re_no }&group_num=${rlist.group_num}&seq=${rlist.seq}&lev=${rlist.lev}" method="post" class="buttonstarrate">
								<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
								<input type="hidden" name="user_id"  value="<%=id%>">
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="./img/rewrite.jpg" width="30" height="30"><textarea rows="1" cols="50" placeholder="��� �Է�" name="content"></textarea>
								<button type="submit" class="" > ����Է� </button>
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