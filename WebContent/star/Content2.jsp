<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
			int pd_no = Integer.parseInt(request.getParameter("pd_no"));
			BoardDAO bdao = new BoardDAO();
			BoardBean bdto = new BoardBean();
			bdto = bdao.getBoard(pd_no);
%>


<div class="ma">
		<table style="margin-left: 400px; margin-right: auto;">
			<tr>
				<td><img alt="" src="./upload/<%=bdto.getPd_realfile() %>" width="600"	
					height="500"></td>

				 <td><jsp:include page="day.jsp" />	
				 </td> 	
			</tr>	
		
		</table>
		
		<hr class="body">
	</div>
	<div class="ma2" >
		
			<div style="padding:20px;  background:#CEECF5; border-radius: 20px;	">
		          <p style="color:#8a80a0;font-size:13px;line-height:20px;margin-bottom:10px; ">
		        	  <strong>��ǥ �ݾ�</strong> <%=bdto.getPd_goalmoney()%> �� &nbsp; &nbsp; <strong>�ݵ��Ⱓ</strong> <%=bdto.getPd_startf()%> - <%=bdto.getPd_endf()%>
		          </p>
		          
		          
		          <p style="color:#4a4a4a;font-size:12px;line-height:19px;"><strong>100% �̻� ���̸� �ݵ��� �����Ǵ� ������Ʈ</strong><br>
         			 �� ������Ʈ�� �ݵ� �����ϱ��� ��ǥ �ݾ��� 100% ������ ������ ������ ������� �ʽ��ϴ�.</p>
      
       		 </div>
				
	</div> 
	<hr class="body">
	<div class="ma3">
		<div class="in">
			��ǰ ���뼳�� ��  �ϴ� �κ� 
			<%=bdto.getPd_content()%>
		</div>	
	
	</div>
	
	<hr class="body">

	
</body>
</html>