package news.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.Newsbean;
import news.db.SellerNewsBean;

public class NewsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RewardUNewsAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		NewsDAO ndao = new NewsDAO();
		
		String sortNews = request.getParameter("sortNews");
		String newsKeyword = request.getParameter("newsKeyword");
		String reload = request.getParameter("reload");
		String currentPageP = request.getParameter("currentPageP");
		if(currentPageP == null) currentPageP = "1"; 
		int currentPage = Integer.parseInt(currentPageP); //2
		int pageSize = 3; 
		int startRow = (currentPage-1) * pageSize +1;	// 9
		int countS = 0;
		int pageCount =0;/*pageCount(totalPage)*/
		int pageBlock=5;/*pageBlock(pagePerBlock)*/	 
		int firstPage=0;
		int lastPage=0;
		
		
		if(reload != null){
			if(reload.equals("true")){
				newsKeyword = "";
			}
		}
		
	//get News lists
		Vector<Newsbean> v = new Vector<>();
		int count = ndao.getNewsCount();
		
		if(newsKeyword == null || newsKeyword == ""){
			v = ndao.getNewsList(sortNews,startRow, pageSize);
			request.setAttribute("v", v);
			pageCount = count/pageSize + (count%pageSize==0?0:1);
			
		}else {	//if searchBar(newsKeyword) has any input value
			countS = ndao.NewSearchCount(newsKeyword);
			v = ndao.totalNewsSearch(newsKeyword,startRow, pageSize);
			request.setAttribute("v", v);
			pageCount = countS/pageSize + (countS%pageSize==0?0:1);
			
		}
		
		firstPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		lastPage = firstPage + pageBlock -1;	
		
		if(lastPage > pageCount){lastPage = pageCount;}
		
	//paging variables	
		//int pageNo = 0;
		
		/*int currentPage = Integer.parseInt(newsCurrentP);
		int startRow = (currentPage-1) * pageSize +1;
		int pageBlock = 5;	pageBlock(pagePerBlock)
		int firstPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		int lastPage = firstPage + pageBlock -1;
		
		if(lastPage > pageCount){
			lastPage = pageCount;
		}
		*/
		
		Newsbean bestNews = new Newsbean();
	  	bestNews = ndao.bestNewsViews();
	  	request.setAttribute("bestNews", bestNews);
		
		request.setAttribute("count", count);
		request.setAttribute("countS", countS);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startRow", startRow);
		request.setAttribute("keyward", newsKeyword);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/rewarduNews.jsp");
		
		return forward;
	}

}
