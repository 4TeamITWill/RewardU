package member.action;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyAction ()");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		String user_name = request.getParameter("user_name");
		
		MemberBean mbean = new MemberBean();

		//System.out.println(request.getParameter("user_content"));
		

		mbean.setUser_id(user_id);
		mbean.setUser_name(request.getParameter("user_name"));
		mbean.setUser_phone(request.getParameter("user_phone"));
		//mbean.setUser_photo(request.getParameter("user_photo"));
		mbean.setUser_content(request.getParameter("user_content"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		
		System.out.println(request.getParameter("user_photo"));
		System.out.println(user_id);
		
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.updateUser(mbean);
		
		request.setAttribute("mbean", mbean);
		request.setAttribute("myPage_center", "../member/mypage.jsp");
		
		System.out.println(user_name);
		session.setAttribute("name", user_name);
		//session.setAttribute("user_photo", user_photo);
			
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=./myPage/myIndex.jsp");
		
		
		return forward;
	}

}
