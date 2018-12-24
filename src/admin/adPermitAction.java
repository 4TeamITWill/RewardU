package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;


public class adPermitAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String center = request.getParameter("center");
		if(center == null){
			center = "pd_start";
		}
		BoardDAO bDAO = new BoardDAO();
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		list = bDAO.getPermitList(center);
		
		request.setAttribute("list", list);
		
		adActionForward forward = new adActionForward();
		forward.setRedirect(false);
		forward.setPath("./index.jsp?center=Reward/RewardMain.jsp&opt="+center);
		
		return forward;
	}

}
