package news.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;



public class NewsDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NewsDeleteAction ()");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NewsDAO ndao = new NewsDAO();
		
		ndao.delelteNews(no);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>");
		out.println("alert('글 삭제가 완료 되었습니다.')");
		out.println("location.href='./NewsAction.news';");
		out.println("</script>");
		
		
		/*ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./RewardUNewsAction.news");*/
		
		
		return null;
	}

}
