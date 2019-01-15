package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberPhotoDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PhotoDeleteAction ()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		String user_photo = request.getParameter("user_photo");
		
		MemberBean mbean = new MemberBean();
		
		mbean.setUser_id(user_id);
		mbean.setUser_photo(user_photo);
		
		MemberDAO mdao = new MemberDAO();
		
		mdao.deletePhoto(mbean);
		
		return null;
	}

}
