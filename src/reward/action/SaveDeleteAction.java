package reward.action;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reward.db.RewardDAO;

public class SaveDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("SaveDeleteAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		RewardDAO rdao = new RewardDAO();
		
		int result = rdao.allDel(pd_no);

		if (result != 0) { //삭제에 성공했다면
			
			response.setContentType("text/html;charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
				out.println("alert('프로젝트를 삭제 하였습니다.')");
				out.println("location.href='./mySellPro.my'");
			out.println("</script>");
		}
		
		//실패했다면
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		out.println("<script>");
		out.println("alert('삭제 실패');");
		out.println("location.href='./mySellPro.my'");
		out.println("</script>");
		

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);

		return forward;
	}
}
