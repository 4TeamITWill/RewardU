package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.MemberDAO;

public class adMemberBanAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String user_id = request.getParameter("user_id");
		
		MemberDAO mdao = new MemberDAO();
		mdao.memberBan(user_id);
		
		adActionForward forward = new adActionForward();
		
		forward.setPath("./index.jsp?center=./admin/admin_index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
