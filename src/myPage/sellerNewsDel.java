package myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_db.MyDAO;

public class sellerNewsDel implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String seller_id = request.getParameter("seller_id");
		
		MyDAO mdao = new MyDAO();
		mdao.delSellerNews(no);
			
		myActionForward forward = new myActionForward();
		forward.setPath("/sellernews.my?pd_no="+pd_no+"&seller_id="+seller_id);
		forward.setRedirect(false);
		return forward;
	}

}
