<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="admin_db.BoardDAO"%>
<%@page import="admin_db.BoardBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table { border-collapse: collapse; }

th, td {
	padding: 0;
}

	

.to img{
width : 100%;	
	
}

.to{
 
	text-align: left;
	
}

/* /* ���̾� ���� �̵� */	
#layer_fixed
{
    height:35px;
    width:100%;

    
   position:fixed;
	  z-index:999;
    top:500px;
    left:1000px;
  	
   
} */
</style>
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
		<table style="margin-left: 400px;">			
			<tr>
				<td style="table-layout: fixed; max-height: 100%; padding: 0 40px;" valign="top" width="50%"> <img alt="" src="./upload/<%=bdto.getPd_realfile() %>" width="700"	
					height="500" style= "display:block;">	
					<br/>
					<div style="padding:20px;  background:#ced3f5;	">
				          <p style="color:#8a80a0;font-size:13px;line-height:20px;">
				        	  <strong>��ǥ �ݾ�</strong> <%=bdto.getPd_goalmoney()%> �� &nbsp; &nbsp; <strong>�ݵ��Ⱓ</strong> <%=bdto.getPd_startf()%> - <%=bdto.getPd_endf()%>
				          </p>
				          
				          
				          <p style="color:#4a4a4a;font-size:12px;line-height:19px;"><strong>100% �̻� ���̸� �ݵ��� �����Ǵ� ������Ʈ</strong><br><br> 	
		         			 �� ������Ʈ�� �ݵ� �����ϱ��� ��ǥ �ݾ��� 100% ������ ������ ������ ������� �ʽ��ϴ�.</p>
      
       				 </div>
       				 <div class="to">
						<div class="in">
							<%=bdto.getPd_content()%>		
						</div>
					</div>			
				</td >			
				<td style="table-layout: fixed; max-height: 100%; padding-top :80px;" valign="top">	
				 			<jsp:include page="day.jsp"/> 
				</td> 	
						
			</tr>
</table>
		
		<!-- <div id="layer_fixed" >	 		
					
					<div>����asd����</div>		   
			</div> -->
</div>
	
</body>
</html>