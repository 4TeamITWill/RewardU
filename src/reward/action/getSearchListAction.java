package reward.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reward.db.BoardBean;
import reward.db.RewardBean;
import reward.db.RewardDAO;
import reward.db.SaveBoard;

public class getSearchListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("getSearchListAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		String keyWord = request.getParameter("keyWord");

		RewardDAO rdao = new RewardDAO();
		Vector<RewardBean> vector = rdao.getSearchList(keyWord);
		int count = rdao.getSearchCount(keyWord);
		
		request.setAttribute("v", vector);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("index.jsp?center=SearchList.jsp"); 
		
		return forward;
	}

}
