package reward.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import admin_db.MemberBean;
import fileUpAction.FileUpAction;
import my_db.MyDAO;
import reward.action.Action;
import reward.action.ActionForward;
import reward.action.RewardingWriteAction;
import reward.db.RewardDAO;
import reward.db.SaveBoard;
import reward.db.SaveSeller;

public class RewardController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String RequestURI = req.getRequestURI();
		System.out.println(RequestURI);
		
		
		String contextPath = req.getContextPath();
		System.out.println(contextPath);
		
		
		System.out.println(contextPath.length());
		
		
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		
		ActionForward forward = null;
		
		
		Action action = null;
		
		
		//index.jsp 에서 신청하기 링크를 누르면 양식 작성 페이지로 이동하는 요청이 들어왔을때
		if (command.equals("/RewardingWrite.fu")) {

			forward = new ActionForward();
		
			forward.setRedirect(false);			
			
			forward.setPath("./index.jsp?center=RewardingWrite_index.jsp");
			
			
			//RewardingWrite.jsp(양식작성페이지)와  RewardingUpdate.jsp(수정페이지)에서 '승인요청'이 들어왔을때
			//수정글은 insert 성공하면 저장리스트에서 삭제 
			}else if (command.equals("/RewardingWriteAction.fu")) {
				
				action = new RewardingWriteAction();
				
				try {
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
			//승인요청완료 페이지로..
			}else if (command.equals("/submit.fu")) {
				
				action = new RewardingSubmitAction(); 
				
				try {
					
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
				
			//글 양식을 처음 저장했을때.. save테이블에 따로 insert 해둔다.
			}else if (command.equals("/SaveAction.fu")) {
				
				action = new SaveAction(); 
				
				try {
					
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
				
			//저장만 한 리스트 뿌려주기
			}else if (command.equals("/RewardingSaveList.fu")) {
				
				action = new RewardingSaveListAction(); 
				
				try {
					
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
				
			//저장만 한 리스트에서 수정하기 요청이 들어왔을때..하나의 게시물 정보를 검색하여 페이지 이동
			}else if (command.equals("/RewardingSaveGet.fu")) {
				
				action = new SaveGetAction(); 
				
				try {
					
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
				
				//RewardingUpdate.jsp(수정페이지)에서  
				//저장하기와 승인요청하기 중에 !!! 또 저장하기를 눌렀을때...각각 save테이블 update
				}else if (command.equals("/RewardingSaveUpdateAction.fu")) {
					
					action = new RewardingSaveUpdateAction(); 
					
					try {
						
						forward = action.excute(req, resp);
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
					
					
				//저장리스트 페이지에서  삭제버튼 눌렀을떄
				}else if(command.equals("/RewardingSaveDelete.fu")) {
					
					action = new SaveDeleteAction(); 
					
					try {
						
						forward = action.excute(req, resp);
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
					
				}else if(command.equals("/index.fu")) {
				
				forward = new ActionForward();
				
				forward.setRedirect(false); 
				
				forward.setPath("./index.jsp"); 
				
			}else if(command.equals("/fileUpAction.fu")) {
				
				action = new FileUpAction(); 
				
				try {
					
					forward = action.excute(req, resp);
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
			}
		
			//검색버튼 눌렀을때..
			else if(command.equals("/getSearchListAction.fu")) {

				action = new getSearchListAction(); 
	
				try {
	
				 forward = action.excute(req, resp);
	
				} catch (Exception e) {
	
				e.printStackTrace();
	
				}
			}
		
		
		//주소로 이동 하는 부분
				if (forward != null) {
					
					if (forward.isRedirect()) {
												
						resp.sendRedirect(forward.getPath());
						
					}else { 
						RequestDispatcher dis = req.getRequestDispatcher(forward.getPath());
						dis.forward(req, resp);
					} //if~else끝
					
				}//if끝
						
		
		
		
	}
	
}
