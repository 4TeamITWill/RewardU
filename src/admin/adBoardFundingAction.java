package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardDAO;
import admin_db.BoardBean;

public class adBoardFundingAction implements adAction {
	
	
	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		BoardDAO bdao = new BoardDAO();
		
		BoardBean bean = bdao.getBoard(pd_no);
		
		request.setAttribute("bean", bean);
		
		adActionForward forward = new adActionForward();
		
		forward.setPath("./index.jsp?center=invest/choosingFunding.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}
	

}
