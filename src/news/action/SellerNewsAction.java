package news.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.db.NewsDAO;
import news.db.SellerNewsBean;


public class SellerNewsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RewardUNewsAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		NewsDAO ndao = new NewsDAO();
		
		String sortNews = request.getParameter("sortNews");
		String newsKeyword = request.getParameter("newsKeyword");
		String reload = request.getParameter("reload");
		
		if(reload != null){
			if(reload.equals("true")){
				newsKeyword = "";
			}
		}
		
		int count = ndao.getSellerNewsCount();
		//paging variables	
		/*int pageNo = 0;*/
		int pageSize = 8; /*pageCount(totalPage)*/
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		String newsCurrentP = request.getParameter("newsCurrentP");
		
		if(newsCurrentP == null) newsCurrentP = "1"; 
		
		int currentPage = Integer.parseInt(newsCurrentP);
		int startRow = (currentPage-1) * pageSize +1;
		int pageBlock = 5;	/*pageBlock(pagePerBlock)*/
		int firstPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		int lastPage = firstPage + pageBlock -1;
		
		if(lastPage > pageCount){lastPage = pageCount;}
		
		
		
	//get News lists
		if(newsKeyword == null){
			
			Vector<SellerNewsBean> v = ndao.getSellerNewsList(startRow, pageSize);
			request.setAttribute("v", v);
			count = v.size();
		
		}else {	//if searchBar(newsKeyword) has any input value
			Vector<SellerNewsBean> v = ndao.totalSellerNewsSearch(startRow, pageSize, newsKeyword);
			request.setAttribute("v", v);
			count = v.size();
		}
		
		/*Newsbean bestNews = new Newsbean();
		
	  	bestNews = ndao.bestNewsViews();
	  	request.setAttribute("bestNews", bestNews);*/
		
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startRow", startRow);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/sellerNews.jsp");
		
		return forward;
	}

}
