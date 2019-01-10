package reward.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;

public class TabSellerAction2 implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("TabBoardAction2 excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		//탭 이동하면서 session에 pd_no가 있는지 검사
		
		/*HttpSession session = request.getSession();
		int pd_no = 0;
		if(session.getAttribute("save") != null){
				
			pd_no=(Integer)session.getAttribute("save");
			RewardDAO rdao = new RewardDAO();
			//하나의 저장게시물 정보를 검색해오는 메소드를 호출
			RewardBean all = rdao.getSaveSeller(pd_no);
			request.setAttribute("all", all);
		}
		*/
		
		request.setAttribute("page", "sSeller");		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 		
		forward.setPath("./index.jsp?center=RewardingWrite_index.jsp"); 
		return forward;
	
	}

}
