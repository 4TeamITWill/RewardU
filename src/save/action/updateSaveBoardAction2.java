package save.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;


public class updateSaveBoardAction2 implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("updateSaveBoardAction excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardBean all = new RewardBean();
		
		//all.setPd_no(Integer.parseInt(request.getParameter("pd_no")));
		all.setUser_id(request.getParameter("user_id"));
		all.setPd_subject(request.getParameter("pd_subject")); //상품이름
		all.setPd_content(request.getParameter("pd_content")); //상품설명
		all.setPd_goalMoney(request.getParameter("pd_goalMoney")); //목표금액
		all.setPd_category(request.getParameter("pd_category")); //상품분류
		all.setPd_file(request.getParameter("pd_file")); //첨부파일
		all.setPd_realFile(request.getParameter("pd_realFile")); 
		all.setPd_end(request.getParameter("pd_end")); //마감일
		
		//저장 성공여부를 담을 변수 선언
		boolean result = false;
					
		//DB작업
		RewardDAO rdao = new RewardDAO();
		
		HttpSession session = request.getSession();
		int pd_no = (Integer)session.getAttribute("saveNum");	
		System.out.println("updateBoard에서 pd_no: " +pd_no);
		result = rdao.updateSaveBoard(all, pd_no);
		
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
		session.setAttribute("saveBoard", all);
		System.out.println("updateBoardAction에서"+all);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		out.println("<script>");
		out.println("alert('저장되었습니다.');");
		out.println("location.href='./board2.sa'");
		out.println("</script>");
		

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
	
		return forward;
	}

}
