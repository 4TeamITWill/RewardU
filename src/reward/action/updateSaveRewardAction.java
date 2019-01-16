package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;

public class updateSaveRewardAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UpdateSaveRewardAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardBean all = new RewardBean();
		
		//리워드 옵션
		all.setPd_opprice1(request.getParameter("pd_opprice1").replace(",", ""));
		all.setPd_opcontent1(request.getParameter("pd_opcontent1"));
		all.setPd_opprice2(request.getParameter("pd_opprice2").replace(",", ""));
		all.setPd_opcontent2(request.getParameter("pd_opcontent2"));
		all.setPd_opprice3(request.getParameter("pd_opprice3").replace(",", ""));
		all.setPd_opcontent3(request.getParameter("pd_opcontent3"));
		all.setPd_opsubject1(request.getParameter("pd_opsubject1"));
		all.setPd_opsubject2(request.getParameter("pd_opsubject2"));
		all.setPd_opsubject3(request.getParameter("pd_opsubject3"));

				//저장 성공여부를 담을 변수 선언
				boolean result = false;
					
				//DB작업
				RewardDAO rdao = new RewardDAO();
				HttpSession session = request.getSession();
				int pd_no = (Integer)session.getAttribute("save");	
				System.out.println("updateReward에서 pd_no: " +pd_no);
				result = rdao.updateSaveReward(all, pd_no);
				
					
					
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
					session.setAttribute("reward", all);
					
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
				
					out.println("<script>");
					out.println("alert('저장되었습니다.');");
					out.println("location.href='./reward2.fu'");
					out.println("</script>");
					

					ActionForward forward = new ActionForward();
					
					forward.setRedirect(false);
					
				
					return forward;
	}

}
