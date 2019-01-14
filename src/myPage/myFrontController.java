package myPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			
		}else if(command.equals("/mySavedList.my")){
		
			action = new mySavedListAction();
			
			forward = action.execute(request, response);
			
		}else if(command.equals("/myPageGood.my")){
			
			action = new myGoodListAction();
			
			forward = action.execute(request, response);
			
		}else if(command.equals("/myPageReward.my")){
			
			action = new myRewardListAction();
			
			forward = action.execute(request, response);
		}else if(command.equals("/myGoodDel.my")){
			
			action = new myGoodDelAction();
			
			forward = action.execute(request, response);
		}else if(command.equals("/RewardUIntro.my")){
			
			forward = new myActionForward();
			forward.setPath("./index.jsp?center=./RewardU_intro.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/sellernews.my")){
			
			action = new sellerNews();
			forward = action.execute(request, response);
					
		}else if(command.equals("/sellerNewsWrite.my")){

			action = new sellerNewsWrite();
			
			forward = action.execute(request, response);
		}else if(command.equals("/sellerNewsDel.my")){
			
			action = new sellerNewsDel();
			
			forward = action.execute(request, response);
			
		}else if(command.equals("/myRewardDel.my")){
			
			action = new myRewardDelAction();
			
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
