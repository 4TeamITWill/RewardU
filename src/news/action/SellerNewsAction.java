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
		String currentPageP = request.getParameter("currentPageP");
		
		if(currentPageP == null) currentPageP = "1"; 
		
		int currentPage = Integer.parseInt(currentPageP); //2
		int startRow = (currentPage-1) * pageSize +1;	// 9
		int pageBlock = 5;	/*pageBlock(pagePerBlock)*/	
		int firstPage = ((currentPage-1)/pageBlock)*pageBlock + 1; //2
		int lastPage = firstPage + pageBlock -1;	//6
		
		if(lastPage > pageCount){lastPage = pageCount;}
		
	//get News lists
		Vector<SellerNewsBean> v = new Vector<>();
		if(newsKeyword == null){
			
			v =ndao.getSellerNewsList(startRow, pageSize);
			request.setAttribute("v", v);
			System.out.println(count);
		
		}else {	//if searchBar(newsKeyword) has any input value
			v = ndao.totalSellerNewsSearch(startRow, pageSize, newsKeyword);
			request.setAttribute("v", v);
		}
		
		
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("firstPage", firstPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("pageBlock", pageBlock);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./news/sellerNews.jsp");
		
		return forward;
	}

}
