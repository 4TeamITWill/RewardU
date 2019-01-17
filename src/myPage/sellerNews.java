package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;
import my_db.MyDAO;
import my_db.SellerNewsBean;

public class sellerNews implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("sellerNews()호출");
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String seller_id = request.getParameter("seller_id");
		
		MyDAO mdao = new MyDAO();
		BoardDAO bdao = new BoardDAO();
		//글제목 가져오기
		BoardBean bbean = bdao.getBoard(pd_no);		
		
		ArrayList<SellerNewsBean> sNewsList = mdao.getSellerNewsList(pd_no);
		int count = mdao.getSellerNewsCount(pd_no);
		
		request.setAttribute("sNewsList", sNewsList);
		request.setAttribute("count", count);
		request.setAttribute("pd_no", pd_no);
		request.setAttribute("seller_id", seller_id);		
		request.setAttribute("boardbean", bbean);
		
		myActionForward forward = new myActionForward();
		forward.setPath("./index.jsp?center=./ContentInfo.jsp&gogo=./myPage/sellerNews.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
