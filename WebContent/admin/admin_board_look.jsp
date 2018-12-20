<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="font-size : 30px;">판매자 정보</div>
		<div>id : ${sbean.user_id }</div>
		<div>사업자 번호 : ${sbean.company_no }</div>
		<div>회사명 : ${sbean.company }</div>
		<div>회사 주소 : ${sbean.company_addr }</div>
		<div>회사 전화 : ${sbean.company_tell }</div>
		<div>팩스 : ${sbean.company_fax }</div>
		<div>판매자 계좌번호 : ${sbean.sellerAccount }</div>
		<div>등록날짜 : ${sbean.seller_date }</div>
		
	<div style="font-size : 30px;">판매 글</div>	
		<div>글번호 : ${bbean.pd_no }, 글제목 : ${bbean.pd_subject }</div>
		<div>아이디 : ${bbean.user_id }</div>
		<div>좋아요 : ${bbean.pd_good }, 조회수 : ${bbean.pd_count }, 참여자 : ${bbean.pd_participant }</div>
		<div>결과 : ${bbean.pd_result }, 승인결과 ${bbean.pd_permit }, 파일명 : ${bbean.pd_file }, 파일진짜명 : ${bbean.pd_realfile }</div>
		<div>분류 : ${bbean.pd_category }, 목표금액 : ${bbean.pd_goalmoney }, 현재금액 : ${bbean.pd_curmoney }</div>
		<div>내용 : ${bbean.pd_content }</div>
		<div>시작 : ${bbean.pd_start }, 끝 : ${bbean.pd_end }</div>
		<div>옵션 ${bbean.pd_opcontent1 }, ${bbean.pd_opcontent2 }, ${bbean.pd_opcontent3 }</div>
		<div>${bbean.pd_opprice1 }, ${bbean.pd_opprice2 }, ${bbean.pd_opprice3 }</div>
		
		<a href="board_permit.ad?pd_no=${bbean.pd_no }">승인</a>
		<a href="board_deny.ad?pd_no=${bbean.pd_no }">거절</a>
</body>
</html>