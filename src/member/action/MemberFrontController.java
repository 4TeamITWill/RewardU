package member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String RequestURI = request.getRequestURI();
		System.out.println(RequestURI);
		
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		
		if(command.equals("/MemberJoin.me")){
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member/join.jsp");
			
	//Join		
		}else if (command.equals("/MemberJoinAction.me")) {
			
			action = new MemberJoinAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
			
	//JoinConfirm		
		}else if(command.equals("/MemberJoinConfirm.me")){
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("member/joinConfirm.jsp");
		
			
			
		}else if (command.equals("/MemberLogin.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member/login.jsp");
			
	//Login
		}else if (command.equals("/MemberLoginAction.me")){
			
			action = new MemberLoginAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	
	//Logout
		}else if (command.equals("/MemberLogout.me")) {
			
			action  = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/Main.me")){
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
		
	//Mypage
		}else if (command.equals("/MemberMypage.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member/mypage.jsp");
			
		}else if (command.equals("/MemberMypageAction.me")) {
			action = new MemberMypageAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	//Member Modify	
		}else if (command.equals("/MemberModifyAction.me")) {
			
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

		}else if (command.equals("/MemberModifyPw.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member/modifyPw.jsp");
			
	
		}else if (command.equals("/MemberModifyPwAction.me")) {
			
			action = new MemberModifyPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	//Member delete			

		}else if (command.equals("/MemberDelete.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member//deleteform.jsp");
			
		}else if (command.equals("/MemberDeleteAction.me")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	//Find member id,pw		
		}else if (command.equals("/MemberFind_ID_PW.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./member/find_id_pw.jsp");
			
		}else if (command.equals("/MemberFindIdAction.me")) {
			action = new MemberFindIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/MemberFindPwAction.me")) {
			action = new MemberFindPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
				
			}else{
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}//if
		
	}//doProcess
	
}
