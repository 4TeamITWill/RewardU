<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="adBoardLook_main" style="width : 900px; margin : 3rem auto;">
	<table width="100%">
		<tr height="100" >
			<td colspan="4" >
				<font style="font-size : 24px;">판매자 정보</font>
			</td>
		</tr>
		<tr height="40">
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">ID </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${sbean.user_id }</font>
			</td>
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">회사명 </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${sbean.company }</font>
			</td>
		</tr>	
		
		<tr height="40">
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">사업자 번호 </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${sbean.company_no }</font>
			</td>
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">회사 전화 </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${sbean.company_tell }</font>
			</td>
		</tr>
		
		<tr height="40">
			<td colspan="1">
				<font style="font-size : 17px; font-weight : bold;">회사 주소 </font>
			</td>
			<td colspan="3">
				<font style="font-size : 17px;">${sbean.company_addr }</font>
			</td>			
		</tr>
		
		<tr height="40">
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">회사 팩스 </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${sbean.company_fax }</font>
			</td>
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">판매자 계좌번호 </font>
			</td>
			<td width="30%" >
				<font style="font-size : 17px;">${sbean.sellerAccount }</font>
			</td>
		</tr>
		<tr height="40" >
			<td colspan="1">
				<font style="font-size : 17px; font-weight : bold;">등록 날짜 </font>
			</td>
			<td colspan="3" >
				<font style="font-size : 17px;">${sbean.seller_date }</font>
			</td>
		</tr>
		
	</table>


	<table width="100%" >
		<tr height="100">
			<td colspan="4">
				<font style="font-size : 24px;">프로젝트 소개</font>
			</td>
		</tr>
		<tr height="40">
			<td colspan="4">
				<font style="font-size : 17px; font-weight : bold;"> 글제목</font>
			</td>
		</tr>
		<tr height="40">
			<td colspan="4">
				<font style="font-size : 17px;">${bbean.pd_subject }</font>
			</td>
		</tr>
		<tr height="40">	
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">아이디  </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${bbean.user_id }</font>
			</td>
			<td width="20%">
				<font style="font-size : 17px; font-weight : bold;">카테고리  </font>
			</td>
			<td width="30%">
				<font style="font-size : 17px;">${bbean.pd_category }</font>
			</td>
		</tr>	
		
		<tr height="40">			
			<td colspan="1">
				<font style="font-size : 17px; font-weight : bold;">기간  </font>
			</td>
			<td colspan="3">
				<font style="font-size : 17px;">${bbean.pd_start } ~ ${bbean.pd_end }</font>
			</td>
		</tr>
		
		<tr height="300px">
			<td colspan="1">
				<font style="font-size : 17px; font-weight : bold;">대표 이미지  </font>
			</td>
			<td colspan="3">
				<img src="./upload/${bbean.pd_file }"/>
			</td>			
		</tr>
		
		<tr height="40">
			<td colspan="1">
				<font style="font-size : 17px; font-weight : bold;">목표금액 </font>
			</td>
			<td colspan="3" >
				<font style="font-size : 17px;">${bbean.pd_goalmoney } 원</font>
			</td>
		</tr>
		<tr height="40">
			<td colspan="4">
				<font style="font-size : 17px; font-weight : bold;">내용  </font>
			</td>
		</tr>
		<tr height="400">	
			<td colspan="4">
				<font style="font-size : 17px;">${bbean.pd_content }</font>
			</td>
		</tr>
		
		<tr>	
			<td colspan="1">
				<font style="font-size : 17px;">옵션1 (${bbean.pd_opprice1 }원)</font>
			</td>
			<td colspan="3">
				<font style="font-size : 17px;">${bbean.pd_opcontent1 }</font>
			</td>
		</tr>
		
		<tr>	
			<td colspan="1">
				<font style="font-size : 17px;">옵션2 (${bbean.pd_opprice2 }원)  </font>
			</td>
			<td colspan="3">
				<font style="font-size : 17px;">${bbean.pd_opcontent2 }</font>
			</td>
		</tr>
		
		<tr>	
			<td colspan="1">
				<font style="font-size : 17px;">옵션3 (${bbean.pd_opprice3 }원)  </font>
			</td>
			<td colspan="3">
				<font style="font-size : 17px;">${bbean.pd_opcontent3 }</font>
			</td>
		</tr>
		
		
	</table>
	
	<div style="width : 100%; text-align : center;">		
		<a href="board_permit.ad?pd_no=${bbean.pd_no }">승인</a>
		<a href="board_deny.ad?pd_no=${bbean.pd_no }">거절</a>
	</div>
</div>	
</body>
</html>