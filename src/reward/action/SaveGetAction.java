package reward.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;
import reward.db.SaveBoard;
import reward.db.SaveSeller;

public class SaveGetAction implements Action{
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("SaveGetAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		
		RewardDAO rdao = new RewardDAO();
		
		//하나의 저장게시물 정보를 검색해오는 메소드를 호출
		RewardBean saveB = rdao.getSaveBoard(pd_no);
		RewardBean saveS = rdao.getSaveSeller(pd_no);
		String end = saveB.getPd_end().substring(0,10);
		
		
		HttpSession session =  request.getSession();
		//request영역에 저장
		session.setAttribute("board", saveB);
		session.setAttribute("seller", saveS);
		session.setAttribute("reward", saveB);
		session.setAttribute("save", pd_no);
		//request.setAttribute("end", end); 
		
		ActionForward forward = new ActionForward();
		
		//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
		forward.setRedirect(false);
		
		// 전송완료페이지로 이동!!!!할 실제 페이지 주소 저장
		forward.setPath("./index.jsp?center=./RewardingWrite_index.jsp"); //가상 요청 주소값 저장

		return forward;
		
	}

}
