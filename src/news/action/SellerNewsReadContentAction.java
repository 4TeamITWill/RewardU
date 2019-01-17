package news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;
import news.db.SellerNewsBean;

public class SellerNewsReadContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NewsReadContentAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NewsDAO ndao = new NewsDAO();
		ndao.updateViews(no);
		
		SellerNewsBean nbean = ndao.sellerReadContent(no);
		
		
		request.setAttribute("nbean", nbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/sellerNewsContent.jsp");
		
		return forward;
	}

}
