package reward.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;


public class TabBoardAction2 implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("TabBoardAction2 excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");

		//탭이름 전달
		request.setAttribute("page", "bBoard");	
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 		
		forward.setPath("./index.jsp?center=RewardingWrite_index.jsp"); 
		return forward;
	}

}
