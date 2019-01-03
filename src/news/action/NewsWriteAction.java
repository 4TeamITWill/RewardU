package news.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;

public class NewsWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NewsWriteAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		Newsbean nbean =  new Newsbean();
		
		nbean.setUser_id(request.getParameter("user_id"));
		nbean.setUser_name(request.getParameter("user_name"));
		nbean.setReNews_title(request.getParameter("reNews_title"));
		nbean.setReNews_summary(request.getParameter("reNews_summary"));
		nbean.setReNews_content(request.getParameter("reNews_content"));
		nbean.setReNews_file(request.getParameter("reNews_file"));
		nbean.setReNews_date(new Timestamp(System.currentTimeMillis()));
		nbean.setReNews_category(request.getParameter("reNews_category"));
		
		NewsDAO ndao = new NewsDAO();
		
		ndao.insertNews(nbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./NewsAction.news");
		
		return forward;
	}

}
