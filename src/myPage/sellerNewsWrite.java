package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_db.MyDAO;
import my_db.SellerNewsBean;

public class sellerNewsWrite implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//인서트용 nbean
		SellerNewsBean nbean = new SellerNewsBean();
				
		nbean.setSell_content(request.getParameter("sell_content"));
		nbean.setSell_subject(request.getParameter("sell_subject"));
		nbean.setUser_id(request.getParameter("user_id"));
		System.out.println(request.getParameter("sell_subject"));		
		
		MyDAO mdao = new MyDAO();
		
		mdao.insertSellerNews(nbean);
				
		myActionForward forward = new myActionForward();
		forward.setPath("sellernews.my");
		forward.setRedirect(false);
		return forward;
	}

}
