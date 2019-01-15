package invest;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import invest_db.InvestBean;
import invest_db.InvestDAO;
import message.db.MessageDAO;

public class inInsertingAction implements inAction{

	@Override
	public inActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/plain;charset=UTF-8");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		int inv_orderno = 0;
		
		String inv_price = request.getParameter("inv_price");
		String user_id = request.getParameter("user_id");
		String inv_name = request.getParameter("inv_name");
		String op1_price = request.getParameter("op1_price");
		String op1_qty = request.getParameter("op1_qty");
		String op2_price = request.getParameter("op2_price");
		String op2_qty = request.getParameter("op2_qty");
		String op3_price = request.getParameter("op3_price");
		String op3_qty = request.getParameter("op3_qty");
		String pd_realfile = request.getParameter("pd_realfile");
		
		//db객체생성
		InvestBean ibean = new InvestBean();
		InvestDAO idao = new InvestDAO();
		
		ibean.setUser_id(request.getParameter("user_id"));
		ibean.setPd_no(Integer.parseInt(request.getParameter("pd_no")));
		
		for(;;){ //주문번호 중복검사를 위한 반복문
			inv_orderno = (int)(Math.round(Math.random()*10000));
			//중복검사해서 사용 가능한 주문번호면 setting 후 무한반복문 탈출
			if(idao.createOrderNo(inv_orderno)==1){
				ibean.setInv_orderno(inv_orderno);
				break;
			}
		}
		
		ibean.setInv_name(inv_name);
		ibean.setInv_investor(request.getParameter("inv_investor"));
		
		String inv_addr1 = request.getParameter("inv_addr1");
		String inv_addr2 = request.getParameter("inv_addr2");
		ibean.setInv_addr(inv_addr1 + inv_addr2); 

		ibean.setInv_phone(request.getParameter("inv_phone"));
		ibean.setInv_price(request.getParameter("inv_price"));
		ibean.setOp1_price(op1_price);
		ibean.setOp1_qty(Integer.parseInt(op1_qty));
		ibean.setOp2_price(op2_price);
		ibean.setOp2_qty(Integer.parseInt(op2_qty));
		ibean.setOp3_price(op3_price);
		ibean.setOp3_qty(Integer.parseInt(op3_qty));
		ibean.setInv_date(new Timestamp(System.currentTimeMillis()));
		ibean.setPd_realfile(pd_realfile);
		
		
		
		idao.insertInvest(ibean);
		
		request.setAttribute("ibean", ibean);
		
		//참여자 관련 board db객체 생성
		idao.incParticipant(pd_no, inv_price);
		
		//participate 테이블에 정보 삽입
		idao.insertParticipate(user_id, pd_no, inv_price, inv_orderno);
		
		MessageDAO mdao = new MessageDAO();
		//메시지 내용 설정
		StringBuffer payContent = new StringBuffer();
		payContent.append("["+inv_name+"]<br/><br/>--결제 정보--<br/>");
		
		if(!op1_qty.equals("0")){
			payContent.append("옵션 1 : "+op1_price+" x "+op1_qty+"<br/>");}
		if(!op2_qty.equals("0")){
			payContent.append("옵션 2 : "+op2_price+" x "+op2_qty+"<br/>");}
		if(!op3_qty.equals("0")){
			payContent.append("옵션 3 : "+op3_price+" x "+op3_qty+"<br/>");}
		payContent.append("총 결제 금액 : "+inv_price+"원<br/>");
		payContent.append("<a href='myPageReward.my' style='text-decoration: none; color: #b44af7;'>투자 현황보러가기</a>");
		
		//메시지 전송
		mdao.sendPayMessage(user_id, payContent.toString());
		
		inActionForward forward = new inActionForward();
		
		forward.setPath("./index.jsp?center=invest/investResult.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
