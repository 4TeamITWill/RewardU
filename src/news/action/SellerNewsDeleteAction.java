package news.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;



public class SellerNewsDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NewsDeleteAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NewsDAO ndao = new NewsDAO();
		
		ndao.sellerDelelteNews(no);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>");
		out.println("alert('done')");
		out.println("location.href='./sellerNewsAction.news';");
		out.println("</script>");
		
	
		return null;
	}

}
