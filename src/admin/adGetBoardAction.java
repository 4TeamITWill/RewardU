package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;
import admin_db.SellerBean;
import admin_db.SellerDAO;

public class adGetBoardAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		BoardDAO bdao = new BoardDAO();
		SellerDAO sdao = new SellerDAO();
		
		BoardBean bbean = bdao.getBoard(pd_no);
		SellerBean sbean = sdao.getSeller(pd_no);
		
		request.setAttribute("bbean", bbean);
		request.setAttribute("sbean", sbean);
		
		adActionForward forward = new adActionForward();
		
		forward.setPath("./admin/admin_board_look.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
