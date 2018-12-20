package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberModifyPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyPwAction ()");
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		String user_pw = request.getParameter("user_pw");
		String user_pw3 = request.getParameter("user_pw3");
		
		MemberBean mbean = new MemberBean();
		
		mbean.setUser_id(user_id);
		
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.updatePw(user_id, user_pw, user_pw3);
		
		request.setAttribute("mbean", mbean);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./Main.me");
		
		return forward;
	}

}
