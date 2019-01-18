package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import email.SMTPAuthenticatior;
import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberFindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindPwAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		MemberBean mbean = new MemberBean();
		
		String user_id =request.getParameter("user_id");
		
		mbean.setUser_id(user_id);
		mbean.setUser_phone(request.getParameter("user_phone"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		
	
		System.out.println(user_id);
		
		MemberDAO mdao = new MemberDAO();
		//int result = mdao.findPw(mbean);
		
		mbean = mdao.findPw(mbean);
		
		String user_pw = mbean.getUser_pw();
		if(user_pw == null) user_pw="";
		
		request.setAttribute("mbean", mbean);
		
		if(user_pw == "" || user_pw.equals("")){
			
			System.out.println("failed..");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 정보에 해당하는 아이디가 존재하지 않습니다.')");
			out.println("history.back();");
			out.println("</script>");
			
	//sending pw to user Email
		}else{
			
			System.out.println("okayyyy send pw");
			System.out.println(user_pw);
			
			//String user_id = request.getParameter("user_id");
			
			SMTPAuthenticatior smtp = new SMTPAuthenticatior();
			smtp.sendPw(user_id, user_pw);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이메일로 비밀번호가 전송되었습니다.')");
			out.println("location.href='./Main.me'");
			out.println("</script>");
			
			/*ActionForward forward = new ActionForward();
			
			forward.setRedirect(false);
			
			forward.setPath("member/pwConfirm.jsp");
			return forward;*/
		}

		return null;
	}

	
}
