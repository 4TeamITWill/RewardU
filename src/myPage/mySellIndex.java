package myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mySellIndex implements myAction{

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("myPage_center", "mySellIndex.jsp");
		
		myActionForward forward = new myActionForward();
		
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
