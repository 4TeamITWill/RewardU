package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;

public class InsertSaveRewardAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" InsertSaveRewardAction excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardBean all = new RewardBean();
		//리워드 옵션
		all.setPd_opprice1(request.getParameter("pd_opprice1"));
		all.setPd_opcontent1(request.getParameter("pd_opcontent1"));
		all.setPd_opprice2(request.getParameter("pd_opprice2"));
		all.setPd_opcontent2(request.getParameter("pd_opcontent2"));
		all.setPd_opprice3(request.getParameter("pd_opprice3"));
		all.setPd_opcontent3(request.getParameter("pd_opcontent3"));
		
		//저장 성공여부를 담을 변수 선언
		boolean result = false;
			
			//DB작업
			RewardDAO rdao = new RewardDAO();
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("id");
			
			//성공하면 true리턴, 실패하면 false리턴 받음.
			result = rdao.insertSaveReward(all, user_id);

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
			int pd_no = rdao.getMax_no(user_id);
			//RewardBean saveAll = rdao.getSaveAll(pd_no);
			//String price = saveAll.getPd_opprice1();
			//System.out.println("insertReward에서 "+price);
			
			
			session.setAttribute("save", pd_no);
			session.setAttribute("reward", all);
			System.out.println("insertReward에서 "+all);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
		
			out.println("<script>");
			out.println("window.alert('저장되었습니다.');");
			out.println("location.href='./reward2.fu'");
			out.println("</script>");
			
			//저장에 성공했을 경우
			//페이지 이동방식 여부값, 이동할 페이지 주소값을 저장하여 리턴하는 역할을 하는 객체 생성
			ActionForward forward = new ActionForward();
			
			//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
			forward.setRedirect(false);
			
			// 마이페이지로 이동 예정... 일단 인덱스로.실제 페이지 주소 저장
			//forward.setPath("./reward.fu"); //가상 요청 주소값 저장		
	
			return forward;
	}

}
