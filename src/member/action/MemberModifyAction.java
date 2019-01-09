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
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		
		MemberBean mbean = new MemberBean();

		//System.out.println(request.getParameter("user_content"));
		

		mbean.setUser_id(user_id);
		mbean.setUser_name(request.getParameter("user_name"));
		mbean.setUser_phone(request.getParameter("user_phone"));
		mbean.setUser_photo(request.getParameter("user_photo"));
		mbean.setUser_content(request.getParameter("user_content"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.updateUser(mbean);
		
		request.setAttribute("mbean", mbean);
		request.setAttribute("myPage_center", "../member/mypage.jsp");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		
		
		return forward;
	}

}
