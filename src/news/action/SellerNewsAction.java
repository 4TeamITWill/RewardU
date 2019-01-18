package news.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.SellerNewsBean;


public class SellerNewsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SellerNewsAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		NewsDAO ndao = new NewsDAO();
		
		String newsKeyword = request.getParameter("newsKeyword");
		String reload = request.getParameter("reload");
		String currentPageP = request.getParameter("currentPageP");
		if(currentPageP == null) currentPageP = "1"; 
		int currentPage = Integer.parseInt(currentPageP); //2
		int pageSize = 5;
		int startRow = (currentPage-1) * pageSize +1;	// 9
		int countS = 0;
		int pageCount =0;
		int pageBlock=5;/*pageBlock(pagePerBlock)*/	
		int firstPage=0;
		int lastPage=0;
		
		int count = ndao.getSellerNewsCount();

		if(reload != null){
			if(reload.equals("true")){
				newsKeyword = "";
			}
		}
		
		//get News lists
		Vector<SellerNewsBean> v = new Vector<>();
		if(newsKeyword == null || newsKeyword==""){
			v =ndao.getSellerNewsList(startRow, pageSize);
			request.setAttribute("v", v);
			pageCount = count/pageSize + (count%pageSize==0?0:1);	
		
		}else {	//if searchBar(newsKeyword) has any input value
			countS = ndao.SellerNewSearchCount(newsKeyword);
			v = ndao.totalSellerNewsSearch(startRow, pageSize, newsKeyword);
			request.setAttribute("v", v);
			pageCount = countS/pageSize + (countS%pageSize==0?0:1);

		}
		
		firstPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		lastPage = firstPage + pageBlock -1;	
		
		if(lastPage > pageCount){lastPage = pageCount;}

		//count = ndao.getSellerNewsCount();
		//paging variables	
		/*int pageNo = 0;*/

		request.setAttribute("count", count);
		request.setAttribute("countS", countS);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("keyword", newsKeyword);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/sellerNews.jsp");
		
		return forward;
	}

}
