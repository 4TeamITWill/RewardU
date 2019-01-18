package member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberMypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberMypageAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		//String user_id = request.getParameter("user_id");
		String user_id = (String)session.getAttribute("id");
		//session.setAttribute("id", user_id);
		
		MemberDAO mdao = new MemberDAO();

		MemberBean mbean = new MemberBean();
		
		
		mbean = mdao.getMember(user_id);
		
		request.setAttribute("myPage_center", "../member/mypage.jsp");
		
		session.setAttribute("mbean", mbean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		
		
		return forward;
	}

}
