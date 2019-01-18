package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my_db.MyDAO;
import my_db.SellerNewsBean;

public class sellerNewsWrite implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String seller_id = request.getParameter("seller_id");
		String user_id = (String)session.getAttribute("id");
		String pd_subject = request.getParameter("pd_subject");
		String pd_realfile = request.getParameter("pd_realfile");
		//인서트용 nbean
		SellerNewsBean nbean = new SellerNewsBean();
				
		nbean.setSell_content(request.getParameter("sell_content"));
		nbean.setSell_subject(request.getParameter("sell_subject"));
		nbean.setUser_id(user_id);
		nbean.setNo(pd_no);
		nbean.setPd_subject(pd_subject);
		nbean.setPd_realfile(pd_realfile);
				
		MyDAO mdao = new MyDAO();
		
		mdao.insertSellerNews(nbean);
						
		myActionForward forward = new myActionForward();
		forward.setPath("sellernews.my?pd_no="+pd_no);
		forward.setRedirect(false);
		return forward;
	}

}
