package admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.ReplyBean;
import admin_db.ReplyDAO;

import admin.adActionForward;


public class adReplyWriteActions implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String content = request.getParameter("content");
		
		
		
		ReplyBean bb=new ReplyBean();
		
		bb.setUser_id(user_id);
		bb.setPd_no(pd_no);
		bb.setContent(content);

		
		
		
		
		ReplyDAO bdao= new ReplyDAO();
		bdao.insertReply(bb);
		
		
		
		
		
		adActionForward forward=new adActionForward();
		forward.setRedirect(true);
		forward.setPath("./Content.ad?pd_no="+pd_no);
		return forward;
	}

}
