package member.action;

import java.io.PrintWriter;

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
		
		int check = mdao.updatePw(user_id, user_pw, user_pw3);
		
		
		request.setAttribute("mbean", mbean);
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			//request.setAttribute("mpw", 1);
			
			out.println("<script>");
			out.println("alert('비밀번호 수정이 완료되었습니다.')");
			out.println("location.href='./Main.me'");
			out.println("</script>");
			
			return null;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			request.setAttribute("mpw", 2);
			PrintWriter out = response.getWriter();
			out.println("<script>");

			out.println("location.href='./MemberModifyPw.me?mpw=2;'");
			out.println("</script>");
			
			return null;
		}
		
		

		
	}

}
