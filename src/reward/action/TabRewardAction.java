package reward.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TabRewardAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setAttribute("page", "reward");		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 		
		forward.setPath("./index.jsp?center=RewardingWrite_index.jsp"); 
		return forward;
	
	}

}
