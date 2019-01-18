package news.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class NewsFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String RequestURI = request.getRequestURI();
		System.out.println(RequestURI);
		
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/NewsWrite.news")){
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./news/newsWrite.jsp");
		
		}else if (command.equals("/RewardUNews.news")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=./news/rewarduNews.jsp");
			
		}else if (command.equals("/NewsAction.news")) {
			
			action = new NewsAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/NewsWriteAction.news")){
			
			action = new NewsWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/NewsReadContentAction.news")){
			
			action = new NewsReadContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/NewsDeleteAction.news")) {
			
			action = new NewsDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
	//--------------------------------------------------여기서부터 리워드 소식--------------------------------------------
			
		}else if (command.equals("/sellerNewsAction.news")) {
			
			action = new SellerNewsAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			
			}
			
		}else if (command.equals("/SellerNewsReadContentAction.news")) {
			
			action = new SellerNewsReadContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			
			}	
			
		}else if (command.equals("/SellerNewsDeleteAction.news")) {
			
			action = new SellerNewsDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
				
			
	//filedown		
		}else if (command.equals("/AttachmentDownloadAction.news")) {
			
			action = new AttachmentDownloadAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}	
	}//doProcess
	
}
