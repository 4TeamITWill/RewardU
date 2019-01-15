package member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberDAO;


// index.jsp?—?„œ ?•„?´?”” ì¤‘ë³µì²´í¬ ?š”ì²??„ ë°›ì•„ ?‘?‹µ?•  ?„œë¸”ë¦¿ 
@WebServlet("/UserRegisterCheck")
public class UserRegisterCheck extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		
		String user_id = request.getParameter("user_id");

		/*
		 check = 0  -> duplicated id
		 check = 1  -> join available 
		  */
		PrintWriter out = response.getWriter();
		out.write(new MemberDAO().userCheck(user_id)+"");
	
	}

}









