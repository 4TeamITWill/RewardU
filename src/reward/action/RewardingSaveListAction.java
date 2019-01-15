package reward.action;

import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;

public class RewardingSaveListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RewardingSaveListAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		RewardDAO rdao = new RewardDAO();
		
		//페이징 변수
			//전체글 개수, 한페이지당 뿌려질 글 개수, 페이지 개수, 현재 페이지
			int count = rdao.getBoardCount(user_id);		
			int pageSize = 3;
			int pageCount = count/pageSize+(count%pageSize==0?0:1);		
			String currentPage1 = request.getParameter("currentPage1");
			if(currentPage1 == null) currentPage1 = "1";
			int currentPage = Integer.parseInt(currentPage1);
			//페이지 시작 글번호, 블록당 페이지 수, 블록에서 시작 페이지 번호, 끝 페이지 번호
			int startRow = (currentPage-1)*pageSize+1;
			int pageBlock = 5;
			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) endPage = pageCount;
		
		
		Vector<RewardBean> vector = rdao.getSaveList(user_id, startRow, pageSize);
		request.setAttribute("v", vector);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("./myPage/mySavedList.jsp"); 
		
		return forward;
	
	}
	
	
}
