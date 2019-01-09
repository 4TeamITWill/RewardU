package admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.BoardBean;
import admin_db.BoardDAO;
import admin_db.RateBean;
import admin_db.RateDAO;

public class adStarWriteActions implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		double pd_rate = Double.parseDouble(request.getParameter("pd_rate"));
	
		
		
		//평점 정보 DB작업 rate테이블
		RateBean rbean = new RateBean();
		RateDAO rdao = new RateDAO();
		rbean.setPd_no(pd_no);
		rbean.setUser_id(user_id);
		rbean.setMy_rate(pd_rate);
		int result = 0;
		result = rdao.insertRate(rbean);
	
		if(result==1){
			BoardDAO bdao = new BoardDAO();
			bdao.rate(pd_rate , pd_no);
			bdao.ratecount(pd_no);
		}
		
		adActionForward forward = new adActionForward();
		
		forward.setRedirect(true);
		forward.setPath("./Content.ad?pd_no="+pd_no+"&result="+result);
		
		return forward;
	}

}
