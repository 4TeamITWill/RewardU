package admin;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.MemberBean;
import admin_db.MemberDAO;

public class adMemberListAction implements adAction{

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberDAO mdao = new MemberDAO();
		
		String user_id = request.getParameter("user_id");
		
		ArrayList<MemberBean> list = mdao.getMember(user_id);
		
		if(list.size() >0 ){
			request.setAttribute("msg", 1);
			request.setAttribute("memberList", list);		
		}else{
			request.setAttribute("msg", 0);
		}
		
		adActionForward forward = new adActionForward();
		
		forward.setRedirect(false);
		forward.setPath("./admin/admin_member.jsp");
		
		return forward;
	}

	
}
