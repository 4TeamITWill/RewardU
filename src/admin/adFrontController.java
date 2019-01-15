package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�꽴占썹뵳�딆쁽 占쎈읂占쎌뵠筌욑옙 frontController
public class adFrontController extends HttpServlet{

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//揶쏉옙占쎄맒雅뚯눘�꺖 占쎌읈筌ｏ옙	
		String URI = request.getRequestURI();
		//占쎈솭占쎄텕筌욑옙筌륅옙
		String contextPath = request.getContextPath();
		//占쎌뒄筌ｏ옙占쎈읂占쎌뵠筌욑옙 揶쏉옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
		String command = URI.substring(contextPath.length());
		
		adActionForward forward = null;
		adAction action = null;
		
		if(command.equals("/adminPage.ad")){
			
			forward = new adActionForward();
			forward.setPath("./index.jsp?center=./admin/admin_index.jsp");
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
		}else if(command.equals("/PermitStart.ad")){
			action = new adPermitStartAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/PermitGood.ad")){
			action = new adPermitGoodAction();
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

			action = new ContentInfoAction();

			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/StarWriteActions.ad")){
			action = new adStarWriteActions();

			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/resultCheck.ad")){
			
			action = new resultCheck();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ReplyWriteActions.ad")){
			
			action =  new adReplyWriteActions();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/RerepWriteActions.ad")){
			
			action =  new adRerepWriteActions();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
}
