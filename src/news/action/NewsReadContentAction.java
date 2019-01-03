package news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;

public class NewsReadContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NewsReadContentAction ()");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NewsDAO ndao = new NewsDAO();
		ndao.updateViews(no);
		
		Newsbean nbean = ndao.readContent(no);
		
		
		request.setAttribute("nbean", nbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/newsContent.jsp");
		
		return forward;
	}

}
