package myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class myFrontController extends HttpServlet{
	
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String URI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String command = URI.substring(contextPath.length());
		
		myActionForward forward = null;
		myAction action = null;
		
		if(command.equals("/myIndex.my")){
			
			action = new myIndexAction();
			
			forward = action.execute(request, response);
			
		}else if(command.equals("/mySellPro.my")){
			
			action = new mySellIndex();
			
			forward=action.execute(request, response);
			
		}else if(command.equals("/mySellList.my")){
			
			action = new mySellListAction();
			
			forward=action.execute(request, response);
			
		}else if(command.equals("/myPageGood.my")){
			
			action = new myGoodListAction();
			
			forward = action.execute(request, response);
			
		}else if(command.equals("/myPageReward.my")){
			
			action = new myRewardListAction();
			
			forward = action.execute(request, response);
		}else if(command.equals("/myGoodDel.my")){
			
			action = new myGoodDelAction();
			
			forward = action.execute(request, response);
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPro(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPro(req,resp);
	}
		

	
}
