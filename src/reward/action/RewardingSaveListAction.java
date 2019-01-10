package reward.action;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;
import reward.db.SaveBoard;

public class RewardingSaveListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RewardingSaveListAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		RewardDAO rdao = new RewardDAO();
		
		Vector<RewardBean> vector = rdao.getSaveList(user_id);
		request.setAttribute("v", vector);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("./SaveList.jsp"); 
		
		return forward;
	
	}
	
	
}
