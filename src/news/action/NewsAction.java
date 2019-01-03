package news.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;

public class NewsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RewardUNewsAction ()");
		
		NewsDAO ndao = new NewsDAO();
		
		Vector<Newsbean> v = ndao.getNewsList();
		
		request.setAttribute("v", v);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/rewarduNews.jsp");
		
		return forward;
	}

}
