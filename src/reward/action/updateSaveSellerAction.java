package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;
import reward.db.SaveSeller;

public class updateSaveSellerAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RewardingSaveUpdateAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		//판매자 정보
		RewardBean all = new RewardBean();
		
		all.setCompany(request.getParameter("company"));
		all.setCompany_no(request.getParameter("company_no"));
		all.setCompany_tell(request.getParameter("company_tell"));
		all.setCompany_fax(request.getParameter("company_fax"));
		all.setCompany_addr(request.getParameter("company_addr"));
		all.setSellerAccount(request.getParameter("sellerAccount"));

		//저장 성공여부를 담을 변수 선언
		boolean result = false;
			
		//DB작업
		RewardDAO rdao = new RewardDAO();
		
		HttpSession session = request.getSession();
		int pd_no = (Integer)session.getAttribute("save");	
		System.out.println("updateSeller에서 pd_no: " +pd_no);
		result = rdao.updateSaveSeller(all, pd_no);
		
		
		if (result==false) { //실패한 경우
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('저장에 실패했습니다. 양식을 다시 작성해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			
			return null;
		}
		
		//update한 정보 넘겨서 뿌려주기
		session.setAttribute("seller", all);
		System.out.println("updateSellerAction에서"+all);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		out.println("<script>");
		out.println("alert('저장되었습니다.');");
		out.println("location.href='./seller2.fu'");
		out.println("</script>");
		

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
	
		return forward;
	}

}
