package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.SMTPAuthenticatior;
import member.db.MemberDAO;

public class MemberJoinEmailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinEmailAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		String to = request.getParameter("to");
		MemberDAO mdao = new MemberDAO();
		String authNum = mdao.randomNum();
	
		
		SMTPAuthenticatior smtp = new SMTPAuthenticatior();
		int check = smtp.sendEmail(to, authNum);
		request.setAttribute("authNum", authNum);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(check+"");
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/authMail.jsp");
			return forward;
			
			//return null;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/authFail.jsp");
			return forward;
			//return null;
		}

		
		//return null;
	}

}
