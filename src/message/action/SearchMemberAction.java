package message.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.db.MemberBean;
import message.db.MessageDAO;

public class SearchMemberAction implements Action {

	@SuppressWarnings("null")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search = request.getParameter("search");
		ArrayList<MemberBean> list = new ArrayList<MemberBean>();
		MessageDAO mdao = new MessageDAO();
		list = mdao.searchMember(search);
		
		request.setAttribute("user_list", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./message/userList.jsp");
		
		return forward;
	}

}
