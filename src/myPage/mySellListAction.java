package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin_db.BoardBean;
import admin_db.BoardDAO;
import my_db.SaveBoard;
import my_db.MyDAO;

public class mySellListAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		
		MyDAO mydao = new MyDAO();

		//페이징 변수
		//전체글 개수, 한페이지당 뿌려질 글 개수, 페이지 개수, 현재 페이지
		int count = mydao.getBoardCount(user_id);		
		int pageSize = 3;
		int pageCount = count/pageSize+(count%pageSize==0?0:1);		
		String currentPage1 = request.getParameter("currentPage1");
		if(currentPage1 == null) currentPage1 = "1";
		int currentPage = Integer.parseInt(currentPage1);
		//페이지 시작 글번호, 블록당 페이지 수, 블록에서 시작 페이지 번호, 끝 페이지 번호
		int startRow = (currentPage-1)*pageSize+1;
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) endPage = pageCount;
				
		//개설프로젝트  가져오기
		ArrayList<BoardBean> board1list = mydao.getBoardList(user_id, startRow, pageSize);		
		
		//임시저장글 가져오기
		
		
		request.setAttribute("board1list", board1list);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);		
		
		myActionForward forward = new myActionForward();
		
		forward.setPath("./myPage/sellList.jsp");

		forward.setRedirect(false);
		
		return forward;
	}

}
