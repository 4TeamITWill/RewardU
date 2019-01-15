package reward.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reward.db.BoardBean;
import reward.db.RewardBean;
import reward.db.RewardDAO;

public class getSearchListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("SearchListAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardDAO rdao = new RewardDAO();
		String keyWord = request.getParameter("keyWord");

		/* 페이징 부분 작업 ...myGoodListAction 참고*/
		int count = rdao.getSearchCount(keyWord);		
		String currentPage1 = request.getParameter("currentPage1");
		if(currentPage1 == null) currentPage1 = "1";
		//한페이지당 뿌려질 글 개수, 현재 페이지, 페이지에서 시작하는 글 번호
		int pageSize = 12;
		int currentPage = Integer.parseInt(currentPage1);
		int startRow = (currentPage-1)*pageSize + 1;
		
		Vector<RewardBean> vector = rdao.getSearchList(keyWord, startRow, pageSize);
		
		//전체 페이지 개수, 블럭당 페이지 개수, 페이징 시작페이지, 페이징 끝페이지
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) endPage=pageCount;
		
		request.setAttribute("v", vector);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("index.jsp?center=SearchList.jsp"); 
		
		return forward;
	}

}
