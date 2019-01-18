package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindIdAction ()");
		
		request.setCharacterEncoding("utf-8");
		
		MemberBean mbean = new MemberBean();
		
		String user_id = null;
		
		mbean.setUser_phone(request.getParameter("user_phone"));
		mbean.setBirthyyyy(request.getParameter("birthyyyy"));
		mbean.setBirthmm(request.getParameter("birthmm"));
		mbean.setBirthdd(request.getParameter("birthdd"));
		
		
		MemberDAO mdao = new MemberDAO();
		user_id = mdao.findId(mbean);
		
		mbean.setUser_id(user_id);
		
		
		
		request.setAttribute("mbean", mbean);
		
		
		System.out.println(user_id);
		
		if(user_id==null){
			System.out.println("---noooooooooo--");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 정보에 해당하는 아이디가 존재하지 않습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else{
			System.out.println("---yessssss--");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('회원님의 아이디는 "+ user_id +"입니다.')");
			out.println("history.back();");
			out.println("</script>");
			
			/*ActionForward forward = new ActionForward();
			
			forward.setRedirect(false);
			
			forward.setPath("member/idConfirm.jsp");
			return forward;*/
			
		}	
		
	return null;
		
	}

}
