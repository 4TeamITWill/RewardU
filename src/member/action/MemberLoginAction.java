package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.userCheck(user_id, user_pw);
		
		
		if(check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.print("alert('반갑습니다')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			return null;
			
		}else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.print("alert('���̵� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		HttpSession session = request.getSession();
		
		
		session.setAttribute("id", user_id);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		
		forward.setPath("index.jsp");
		
		return forward;
	}

}
