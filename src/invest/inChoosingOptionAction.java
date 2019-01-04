package invest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import invest_db.InvestBean;
import invest_db.InvestDAO;


public class inChoosingOptionAction implements inAction {
	
	
	@Override
	public inActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		String inv_name = request.getParameter("pd_subject");
		String user_id = request.getParameter("user_id");
		
		//수량에 따른 각 옵션별 가격의 합을 받아옴. 이는 실제 DB와는 아무상관없으며 단순히 inv_price 값을 계산하기 위함
		int op1_priceTotal = Integer.parseInt(request.getParameter("op1_priceTotal"));
		int op2_priceTotal = Integer.parseInt(request.getParameter("op2_priceTotal"));
		int op3_priceTotal = Integer.parseInt(request.getParameter("op3_priceTotal"));
		//각 옵션과 총 개수를 모두 계산한 총 금액 값을 int타입으로 미리 저장해놓음
		int total_priceInt = op1_priceTotal+op2_priceTotal+op3_priceTotal;
		
		String op1_price = request.getParameter("op1_price");
		String op2_price = request.getParameter("op2_price");
		String op3_price = request.getParameter("op3_price");
		//위에서 저장해놓은 총 금액 값을 String 타입으로 받기 위해  +""  를 해줌
		String inv_price = total_priceInt+"";
		int op1_qty = Integer.parseInt(request.getParameter("op1_qty"));
		int op2_qty = Integer.parseInt(request.getParameter("op2_qty"));
		int op3_qty = Integer.parseInt(request.getParameter("op3_qty"));
		
		InvestBean ibean = new InvestBean();
		
		ibean.setUser_id(user_id);
		ibean.setPd_no(pd_no);
		ibean.setInv_name(inv_name);
		ibean.setInv_price(inv_price);
		ibean.setOp1_price(op1_price);
		ibean.setOp1_qty(op1_qty);
		ibean.setOp2_price(op2_price);
		ibean.setOp2_qty(op2_qty);
		ibean.setOp3_price(op3_price);
		ibean.setOp3_qty(op3_qty);
		
		request.setAttribute("ibean", ibean);
		
		
		inActionForward forward = new inActionForward();
		
		forward.setPath("./invest/checkingOut.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}
	

}
