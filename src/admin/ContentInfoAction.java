package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardDAO;

public class ContentInfoAction implements adAction{

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String id = request.getParameter("user_id");
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.upCount(pd_no);//게시글 조회수 증가
		
		adActionForward forward = new adActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=ContentInfo.jsp");
		return forward;
	}
	
}
