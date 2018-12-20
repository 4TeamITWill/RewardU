package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;

public class adBoardListAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO bdao = new BoardDAO();
		
		int count = bdao.getBoardCount();
		
		int pageSize = 3;

		String currentPage1 = request.getParameter("currentPage1");
		
		if(currentPage1 == null){
			currentPage1 = "1";
		}
		int currentPage = Integer.parseInt(currentPage1);
		int startRow = (currentPage-1) * pageSize + 1;
		
		int endRow = currentPage * pageSize;
		
		ArrayList<BoardBean> list = bdao.getBoardList(startRow, pageSize);
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 10;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage=pageCount;
		}
		request.setAttribute("boardList", list);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);	
		
		adActionForward forward = new adActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./admin/admin_board.jsp");
		
		return forward;
	}

}
