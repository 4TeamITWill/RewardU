package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberLoginAction ()");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MemberDAO mdao = new MemberDAO();
		
		MemberBean mbean = mdao.getMember(user_id);
		
		String user_name = mbean.getUser_name();
		
		
		
		int check = mdao.userCheck(user_id, user_pw);
		
		HttpSession session = request.getSession();
		
		if(check == 0){	//incorrect password
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			request.setAttribute("login", 1);
			
			out.println("<script>");
			//out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
			out.println("location.href='./MemberLogin.me?login=1';");
			out.println("</script>");
			
			
			/*ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			
			return forward;*/
			
			return null;
			
		}else if (check == -1) {	//incorrect id
			response.setContentType("text/html; charset=UTF-8");
			request.setAttribute("login", 2);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			//out.println("alert('일치하는 아이디가 없습니다.')");
			out.println("location.href='./MemberLogin.me?login=2';");
			out.println("</script>");

			
			return null;
		}
		
		
		session.setAttribute("id", user_id);
		session.setAttribute("name", user_name);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("./Main.me");
		
		return forward;
	}

}
