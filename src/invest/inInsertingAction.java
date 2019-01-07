package invest;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import invest_db.InvestBean;
import invest_db.InvestDAO;

public class inInsertingAction implements inAction{

	@Override
	public inActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/plain;charset=UTF-8");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		String inv_price = request.getParameter("inv_price");
		
		InvestBean ibean = new InvestBean();
		
		ibean.setUser_id(request.getParameter("user_id"));
		ibean.setPd_no(Integer.parseInt(request.getParameter("pd_no")));
		ibean.setInv_orderno((int)(Math.round(Math.random()*10000)));
		ibean.setInv_name(request.getParameter("inv_name"));
		ibean.setInv_investor(request.getParameter("inv_investor"));
		
		String inv_addr1 = request.getParameter("inv_addr1");
		String inv_addr2 = request.getParameter("inv_addr2");
		ibean.setInv_addr(inv_addr1 + inv_addr2); 

		ibean.setInv_phone(request.getParameter("inv_phone"));
		ibean.setInv_price(request.getParameter("inv_price"));
		ibean.setOp1_price(request.getParameter("op1_price"));
		ibean.setOp1_qty(Integer.parseInt(request.getParameter("op1_qty")));
		ibean.setOp2_price(request.getParameter("op2_price"));
		ibean.setOp2_qty(Integer.parseInt(request.getParameter("op2_qty")));
		ibean.setOp3_price(request.getParameter("op3_price"));
		ibean.setOp3_qty(Integer.parseInt(request.getParameter("op3_qty")));
		ibean.setInv_date(new Timestamp(System.currentTimeMillis()));
		
		
		//db객체생성
		InvestDAO idao = new InvestDAO();
		
		idao.insertInvest(ibean);
		
		request.setAttribute("ibean", ibean);
		
		//참여자 관련 board db객체 생성
		
		idao.incParticipant(pd_no, inv_price);
		
		
		inActionForward forward = new inActionForward();
		
		forward.setPath("./index.jsp?center=invest/investResult.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
