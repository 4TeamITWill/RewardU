package message.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectID implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("왜 안되는거야");
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		request.setAttribute("user_id", user_id);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./message/userList.jsp");
		
		return forward;
	}

}
