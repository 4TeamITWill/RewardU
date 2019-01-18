package admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin_db.ReplyBean;
import admin_db.ReplyDAO;

import admin.adActionForward;


public class adRerepWriteActions implements adAction {

	@Override
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));
		String content = request.getParameter("content");
		int lev = Integer.parseInt(request.getParameter("lev"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		int group_num = Integer.parseInt(request.getParameter("group_num"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		
		ReplyBean bb=new ReplyBean();
		
		bb.setUser_id(user_id);
		bb.setPd_no(pd_no);
		bb.setContent(content);
		bb.setRe_no(re_no);
		bb.setLev(lev);
		bb.setSeq(seq);
		bb.setGroup_num(group_num);
		
		
		
		
		ReplyDAO bdao= new ReplyDAO();
		bdao.insertreReply(bb);
		

		
		
		
		
		adActionForward forward=new adActionForward();
		forward.setRedirect(true);
		forward.setPath("index.jsp?center=ContentInfo.jsp&gogo=star/reviewwrite.jsp&pd_no="+pd_no+"&group_num="+group_num);
		return forward;
	}

}
