<%@page import="java.util.ArrayList"%>
<%@page import="admin_db.ReplyBean"%>
<%@page import="admin_db.ReplyDAO"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="member.db.MemberBean"%>
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

/*   ���� �κ� */
#content2{
	background: #F4F2F2;
	padding: 20px;
	word-break: keep-all;
    word-wrap: break-word;
    margin-left: 50px;
   	border-radius: 20px;	
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
	


	<div style="margin-left:400px; margin-right:400px;text-align: left;">


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
									<img alt="" src="./img/re1.jpg" width="30"height="30">	${rlist.user_id}	
								</div>
								<div class="date">
									�ۼ� ���� : ${rlist.date}	
								</div>
							
								<div  class="content">
								<img src="./img/level.gif">	${rlist.content}
								</div>
									
						<tr>
							<td>		
							<form action="./RerepWriteActions.ad?re_no=${rlist.re_no }&group_num=${rlist.group_num}&seq=${rlist.seq}&lev=${rlist.lev}" method="post" class="buttonstarrate">
								<input type="hidden" name="pd_no"  value="<%=pd_no%>"> 
								<input type="hidden" name="user_id"  value="<%=id%>">
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="./img/rewrite.jpg" width="30" height="30"><textarea rows="1" cols="50" placeholder="��� �Է�" name="content"></textarea>		 
							</td>
													
						</tr>
							<button type="submit" id="replybutton" > ����Է� </button>
							<hr>			
							</form>
						</c:when>
						<c:when test="${rlist.seq >0 }">
					
								<div style="margin-left: 30px; "><img alt="" src="./img/rewrite.jpg" width="30" height="30"><img src="./img/re2.jpg" width="30"height="30">${rlist.user_id }</div>		
									
								<div style="margin-left: 60px;  font-size: 10px;" >${rlist.date }</div> 
									
								
								<div id="content2"><img src="./img/level.gif">${rlist.content }</div>
						
						</c:when>
							</c:choose>
							
								
					</c:forEach>
	
				</c:if>
				
		
		
	
	
		</div>
	




</body>
</html>