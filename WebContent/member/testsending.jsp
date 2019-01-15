<%@page import="member.db.MemberBean"%>
<%@ page pageEncoding="utf-8"%>
<jsp:useBean id="mbean" class="member.db.MemberBean"/>
<jsp:setProperty property="*" name="mbean"/>
<div width='200' height='300px' align='center' style='background-color: #aaa;'>
	<h2>&nbsp;&nbsp;</h2>
	<span style='background-color:white; color:#b44af7; font-size: 30px; font-weight: bold;'>
	&nbsp; 리듀 <i>RewardU</i> &nbsp; </span>
	<br><br>
	<font size='3' color='white'>
	리듀 회원가입을 축하드립니다. <br>
	저희 리듀에 방문하시고 나의 마음을 채워줄 리워드를 경험해보세요<br><br>
	<a href="http://localhost:8080/RewardU/index.jsp">리듀  RewardU</a>
	</font>
	<h2>&nbsp;&nbsp;</h2>
</div>