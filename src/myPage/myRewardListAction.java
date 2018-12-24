package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my_db.InvestBean;
import my_db.myDAO;

public class myRewardListAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		//세션에 있는 아이디로 검색해서 id 받아옴
		//String user_id = (String)session.getAttribute("id");
		String user_id = "id";
		
		myDAO mydao = new myDAO();
		
		int count = mydao.getRewardCount(user_id);
		
		/* 페이징 할 변수들 셋팅 */
		int pageSize = 5;
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		String currentPage1 = request.getParameter("currentPage1");
		
		if(currentPage1 == null) currentPage1= "1";
		
		int currentPage = Integer.parseInt(currentPage1);
		int startRow = (currentPage-1) * pageSize + 1;
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageSize - 1; 
				
		if(endPage > pageCount) endPage=pageCount;
		
		//투자리스트 전체 글 목록 ArrayList로 받아오기
		ArrayList<InvestBean> invelist =mydao.getRewardBoard(user_id,startRow, pageSize);
		
		request.setAttribute("invelist", invelist);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		
		myActionForward forward = new myActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./myPage/myRewardList.jsp");
		
		return forward;
	}

}
