package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.action.ActionForward;
import reward.db.RewardBean;
import reward.db.RewardDAO;

public class InsertSaveSellerAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("InsertSaveSellerAction excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardBean all = new RewardBean();
		
		all.setCompany(request.getParameter("company"));
		all.setCompany_no(request.getParameter("company_no"));
		all.setCompany_tell(request.getParameter("company_tell"));
		all.setCompany_fax(request.getParameter("company_fax"));
		all.setCompany_addr(request.getParameter("company_addr"));
		all.setSellerAccount(request.getParameter("sellerAccount"));
		
			//저장 성공여부를 담을 변수 선언
			boolean result = false;
			RewardDAO rdao = new RewardDAO();
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("id");
			
			
			//성공하면 true리턴, 실패하면 false리턴 받음.
			result = rdao.insertSaveSeller(all, user_id);

			if (result==false) { //실패한 경우
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('저장에 실패했습니다. 양식을 다시 작성해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				
				return null;
			}
	
			//방금 저장한 pd_no값과 정보들 넘기기
			int save = rdao.getMax_no(user_id);
			session.setAttribute("save", save);
			session.setAttribute("seller", all);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
		
			out.println("<script>");
			out.println("alert('저장되었습니다.');");
			out.println("location.href='seller2.fu'");
			out.println("</script>");
			
			//request.setAttribute("page", "board");
			//저장에 성공했을 경우
			//페이지 이동방식 여부값, 이동할 페이지 주소값을 저장하여 리턴하는 역할을 하는 객체 생성
			ActionForward forward = new ActionForward();
			
			//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
			//forward.setRedirect(false);
			forward.setRedirect(false); 		
			//forward.setPath("./index.jsp?center=RewardingWrite_index.jsp"); 
			return forward;
	
			

	}

}
