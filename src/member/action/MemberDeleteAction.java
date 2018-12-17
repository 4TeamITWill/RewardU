package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDelteAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		//ActionForward forward = null;

		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("id");
		String user_pw = request.getParameter("user_pw");
		
		MemberDAO mdao = new MemberDAO();
		
		MemberBean mbean = new MemberBean();
		
		int check = mdao.deleteMember(user_id, user_pw);
		
		
		if(check == 1){
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
						
			
			out.println("<script>");
			out.print("alert('Ż�� �Ϸ� �Ǿ����ϴ�.')");
			
			out.println("</script>");
			out.close();
			session.invalidate();
			
			/*ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./Main.me");
			
			return forward;*/
			
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
		
			out.println("<script>");
			out.print("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
						
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./Main.me");
		
		return forward;
		//return forward;
	}

}
