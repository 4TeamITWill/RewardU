package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//愿�由ъ옄 �럹�씠吏� frontController
public class adFrontController extends HttpServlet{

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//媛��긽二쇱냼 �쟾泥�	
		String URI = request.getRequestURI();
		//�뙣�궎吏�紐�
		String contextPath = request.getContextPath();
		//�슂泥��럹�씠吏� 媛� 媛��졇�삤湲�
		String command = URI.substring(contextPath.length());
		
		adActionForward forward = null;
		adAction action = null;
		
		if(command.equals("/adminPage.ad")){
			
			forward = new adActionForward();
			forward.setPath("./admin/admin_index.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/board.ad")){
			action = new adBoardListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/getBoard.ad")){
			
			action = new adGetBoardAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/board_permit.ad")){
			
			action = new adBoardPermit();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/board_deny.ad")){
			
			action = new adBoardDeny();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/member.ad")){
			
			forward = new adActionForward();
			forward.setPath("./admin/admin_member.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/member_info.ad")){
			action = new adMemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/member_ban.ad")){
			
			action = new adMemberBanAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/PermitList.ad")){
			action = new adPermitAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/PermitListcategory.ad")){
			action = new adPermitcategoryAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/PermitMore.ad")){
			action = new adPermitMoreAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/getFunding.ad")){
			action = new adBoardFundingAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/Content.ad")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward = new adActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지함 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=ContentInfo.jsp");
			
		}else if(command.equals("/StarWriteActions.ad")){
			action = new adStarWriteActions();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//�씠�룞
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
}
