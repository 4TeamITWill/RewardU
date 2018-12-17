package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindIdAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		MemberBean mbean = new MemberBean();
		
		String user_id = null;
		
		mbean.setUser_phone(request.getParameter("user_phone"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		
		
		MemberDAO mdao = new MemberDAO();
		
		user_id = mdao.findId(mbean);
		
		request.setAttribute("mbean", mbean);
		
		if(user_id==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.print("alert('일치하는 아이디가 없습니다.')");
			//out.println("history.back();");
			out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.print("alert('회원님의 아이디는 입니다.')");
			//out.println("history.back();");
			out.println("</script>");
			
		}
	
		return null;
	}

}
