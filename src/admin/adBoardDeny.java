package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardDAO;

public class adBoardDeny implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		BoardDAO bdao = new BoardDAO();
		bdao.boardDeny(pd_no);
		
		adActionForward forward = new adActionForward();
		
		forward.setPath("adminPage.ad");
		forward.setRedirect(false);
		return forward;
		
	}

}
