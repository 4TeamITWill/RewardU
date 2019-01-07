package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardDAO;
import reward.db.SaveBoard;

public class InsertSaveRewardAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" InsertSaveRewardAction excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		SaveBoard saveB = new SaveBoard();
		//리워드 옵션
		saveB.setPd_opprice1(request.getParameter("pd_opprice1"));
		saveB.setPd_opcontent1(request.getParameter("pd_opcontent1"));
		saveB.setPd_opprice2(request.getParameter("pd_opprice2"));
		saveB.setPd_opcontent2(request.getParameter("pd_opcontent2"));
		saveB.setPd_opprice3(request.getParameter("pd_opprice3"));
		saveB.setPd_opcontent3(request.getParameter("pd_opcontent3"));
		
		//저장 성공여부를 담을 변수 선언
		boolean result = false;
			
		//DB작업
			RewardDAO rdao = new RewardDAO();
			HttpSession session = request.getSession();
			String user_id = (String)session.getAttribute("id");
			
			//작성한 게시글내용을 담고있는 saveB, saveS객체를 전달하여 DB작업을 하는데
			//성공하면 true리턴, 실패하면 false리턴 받음.
			result = rdao.insertSaveReward(saveB, user_id);

			if (result==false) { //실패한 경우
				//System.out.println("양식을 다시 작성해주세요.");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('저장에 실패했습니다. 양식을 다시 작성해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				
				return null;
			}
	
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
		
			out.println("<script>");
			//out.println("location.href='./submit.fu';");
			out.println("window.alert('저장되었습니다.');");
			out.println("location.href='./RewardingSaveList.fu'");
			out.println("</script>");
			
			//저장에 성공했을 경우
			//페이지 이동방식 여부값, 이동할 페이지 주소값을 저장하여 리턴하는 역할을 하는 객체 생성
			ActionForward forward = new ActionForward();
			
			//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
			forward.setRedirect(false);
			
			// 마이페이지로 이동 예정... 일단 인덱스로.실제 페이지 주소 저장
			//forward.setPath("./submit.fu"); //가상 요청 주소값 저장		
	
			return forward;
	}

}
