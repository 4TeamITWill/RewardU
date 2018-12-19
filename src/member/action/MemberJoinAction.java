package member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;
import member.action.ActionForward;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("MemberJoinAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		MemberBean mbean = new MemberBean();
		
		mbean.setUser_id(request.getParameter("user_id"));
		mbean.setUser_name(request.getParameter("user_name"));
		mbean.setUser_pw(request.getParameter("user_pw"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		mbean.setUser_phone(request.getParameter("user_phone"));
		mbean.setUser_photo(request.getParameter("user_photo"));
		mbean.setUser_regDate(new Timestamp(System.currentTimeMillis()));
		
		boolean result = false;
		
		MemberDAO mdao = new MemberDAO();
		
		result = mdao.insertMember(mbean);
		
		//request영역에  mbean객체를 담는다
		request.setAttribute("mbean", mbean);
		
		if(result == false){
			System.out.println("---Join null---");
			return null;
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MemberJoinConfirm.me");
		
		return forward;
	}
}
