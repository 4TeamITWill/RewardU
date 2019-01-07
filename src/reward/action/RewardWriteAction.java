package reward.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RewardWriteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setAttribute("write_page", "RewardingWrite_board");		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 		
		forward.setPath("./index.jsp?center=RewardingWrite_index.jsp"); 
		return forward;
	}

}
