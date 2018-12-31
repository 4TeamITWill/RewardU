package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.BoardBean;
import my_db.MyDAO;

public class myGoodListAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		MyDAO mydao = new MyDAO();
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");		
		
		/* 페이징 부분 작업 */
		int count = mydao.getGoodCount(user_id);		
		//myGoodList.jsp 페이지에서 페이지 번호 클릭시 받아오는 currentpage
		String currentPage1 = request.getParameter("currentPage1");
		
		if(currentPage1 == null) currentPage1 = "1";
		//한페이지당 뿌려질 글 개수, 현재 페이지, 페이지에서 시작하는 글 번호
		int pageSize = 8;
		int currentPage = Integer.parseInt(currentPage1);
		int startRow = (currentPage-1)*pageSize + 1;
		
		//아이디로 검색해서 좋아요 누른 게시물 전체 ArrayList로 받아오기
		ArrayList<BoardBean> goodlist = mydao.getGoodBoard(user_id, startRow, pageSize);
		
		//전체 페이지 개수, 블럭당 페이지 개수, 페이징 시작페이지, 페이징 끝페이지
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) endPage=pageCount;
		
		/*-------------------페이징 부분 작업 */
			
		//request영역에 좋아요리스트 저장
		request.setAttribute("goodlist", goodlist);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		
		request.setAttribute("myPage_center", "myGoodList.jsp");
		
		myActionForward forward = new myActionForward();
		
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
