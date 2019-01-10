package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardDAO;

public class resultCheck implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.checkResult();
		
		adActionForward forward = new adActionForward();
		forward.setPath("./index.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
