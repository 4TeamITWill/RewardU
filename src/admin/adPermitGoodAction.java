package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.BoardBean;
import admin_db.BoardDAO;


public class adPermitGoodAction implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				
				BoardDAO bDao = new BoardDAO();
				//List
				ArrayList<BoardBean> list = new ArrayList<BoardBean>();
				list = bDao.getPermitGoodList();
				request.setAttribute("list", list);
				adActionForward forward = new adActionForward();
				forward.setRedirect(false);
				forward.setPath("./Reward/MorePage.jsp");
				return forward;
			}
}
