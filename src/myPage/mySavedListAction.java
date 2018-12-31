package myPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my_db.SaveBoard;
import my_db.MyDAO;

public class mySavedListAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		
		MyDAO mydao = new MyDAO();
		
		ArrayList<SaveBoard> savelist = mydao.getSaveList(user_id);
		
		request.setAttribute("savelist", savelist);
		
		myActionForward forward = new myActionForward();
		
		forward.setPath("./myPage/savedList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
