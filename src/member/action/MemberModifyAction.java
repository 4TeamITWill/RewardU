package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session = request.getSession();
	
		String user_id = (String)session.getAttribute("id");
		
		MemberBean mbean = new MemberBean();
		
		
		return null;
	}

}
