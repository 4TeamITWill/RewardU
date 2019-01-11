package save.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;

public class TabSellerAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("TabSellerAction2 excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		
		request.setAttribute("page", "seller");		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 		
		forward.setPath("./index.jsp?center=save/SaveWrite_index.jsp"); 
		return forward;
	
	}

}
