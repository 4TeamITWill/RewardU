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
<%-- <script type="text/javascript">
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
 --%>


	<div class="ma2">


		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			<p style="color: #4a4a4a; font-size: 15px; line-height: 20px; margin-bottom: 5px;">���
				�ۼ� ���ǻ���</p>
			<ul style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
				<li>�ݵ� ��ҿ� ������ �ɼ� �� ����� ������ �ݵ� �Ⱓ(2019.01.08 ~ 2019.01.22)���ȸ� <a href="/web/wmypage/myfunding/fundinglist">�ݵ� ����</a>���� �����մϴ�.</li>
				<li>������ ���� ���� �� ��� ���Ǵ� '����Ŀ���� �����ϱ�'�� ���� ��Ȯ�� �亯�� ���� �� �ֽ��ϴ�.</li>
				<li>�����ʹ��� ����ó, ����, �̸��� ���� ������ ���������� ���� ������ ������.</li>
				<li>�� ������Ʈ�� ������ ��, ����, �弳, ���, ���� ���� ���� ���� ���� ���� �� ��ġ�� ������ ��
					������, �ش� �������� ���� ����Ŀ, ������, ��3�ڿ��� ���ذ� �߻����� �ʵ��� �����Ͻñ� �ٶ��ϴ�.</li>
			</ul>
		</div>
		<br/>
		<div style="padding: 20px; background: #F2F2F2; border-radius: 20px;">
			<div>
				<c:if test="${ id == null }">
					<textarea rows="5" cols="50"  readonly>�α��� �� ��� �ޱ�</textarea>
				</c:if>
				<c:if test="${ id != null }">
				 
					<form action="./ReplyWriteActions.ad" method="post">
					<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
					<input type="hidden" name="user_id"  value="<%=id%>">
												
						<textarea rows="5" cols="50" placeholder="��� �ۼ�" name="content"></textarea>
						<button type="submit">����Է�</button>
					</form>
				</c:if>
			</div>
		</div>
		<br/>
		
			<table>
				
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
						<tr>
							<td >${rlist.user_id}</td>
							<td > �ۼ� ���� : ${rlist.date}</td>
						</tr>	
						<tr>
							<td>${rlist.content}</td>
						</tr>
						<tr>
							<td><button class="buttonstar">���</button></td>
						</tr>		
						<tr>
							<td>		
							<form action="./RerepWriteActions.ad?re_no=${rlist.re_no }&group_num=${rlist.group_num}&seq=${rlist.seq}&lev=${rlist.lev}" method="post">
								<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
								<input type="hidden" name="user_id"  value="<%=id%>">
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="./img/rewrite.jpg" width="30" height="30"><textarea rows="1" cols="50" placeholder="���  �ۼ�" name="content"></textarea>
								<button type="submit"> ����Է� </button>
							</form>
							
							</td>						
						</tr>
						
							 		<%
										int group_num= Integer.parseInt(request.getParameter("group_num"));
										ArrayList<ReplyBean> list2 = dao.getList2(pd_no, group_num);
										if(list.size()>0){
											request.setAttribute("reply2", 1);
											request.setAttribute("replylis2", list2);
										}else{
											request.setAttribute("repl2", 0);
										}
									%>  
						<tr>	
						 	<c:if test="${reply2 == 1}">
									<c:forEach var="rlist2" items="${replylist2}">
										<td>${rlist2.content} </td>
									</c:forEach>
								
							</c:if>
								 
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