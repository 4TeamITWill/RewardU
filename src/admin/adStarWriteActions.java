package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.BoardBean;
import admin_db.BoardDAO;

public class adStarWriteActions implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		double pd_rate = Double.parseDouble(request.getParameter("pd_rate"));
		
		
		
		BoardDAO bdao = new BoardDAO();
		
		
		bdao.rate(pd_rate , pd_no);
		bdao.ratecount(pd_no);
		
		adActionForward forward = new adActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./Content.ad");
		
		return forward;
	}

}
