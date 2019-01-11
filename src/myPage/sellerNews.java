package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_db.MyDAO;
import my_db.SellerNewsBean;

public class sellerNews implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		MyDAO mdao = new MyDAO();
		
		ArrayList<SellerNewsBean> sNewsList = mdao.getSellerNewsList();
		boolean count = mdao.getSellerNewsCount();
		
		request.setAttribute("sNewsList", sNewsList);
		request.setAttribute("count", count);
		
		myActionForward forward = new myActionForward();
		forward.setPath("./index.jsp?center=./myPage/sellerNews.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
