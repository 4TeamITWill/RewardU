package save.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import save.action.Action;
import save.action.ActionForward;


public class SaveController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws IOException, ServletException {
		
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		ActionForward forward = null;
		
		Action action = null;
		
		//탭누르면 판매자정보 작성 페이지로 넘어감	
			 if(command.equals("/seller.sa")) {
				
				action = new TabSellerAction();
				
				try {
					forward = action.excute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			//저장누르면 판매자정보 작성 페이지로 넘어감	
					else if(command.equals("/seller2.sa")) {
						
						action = new TabSellerAction2();
						
						try {
							forward = action.excute(req, resp);
						} catch (Exception e) {
							e.printStackTrace();
						}
						
					}
			
			//탭누르면 프로젝트정보 작성 페이지로 넘어감	
				else if(command.equals("/board.sa")) {
					
					action = new TabBoardAction();
					
					try {
						forward = action.excute(req, resp);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			//다음으로 버튼 누르면 프로젝트정보 작성 페이지로 넘어감	
				else if(command.equals("/board2.sa")) {
					
					action = new TabBoardAction2();
					
					try {
						forward = action.excute(req, resp);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			
			
				//탭누르면  리워드정보 작성 페이지로
					else if(command.equals("/reward.sa")) {
					
						action = new TabRewardAction();
						
						try {
							forward = action.excute(req, resp);
						} catch (Exception e) {
							e.printStackTrace();
						}
				}
			
			//저장하면 리워드정보 작성 페이지로
					else if(command.equals("/reward2.sa")) {
					
						action = new TabRewardAction2();
						
						try {
							forward = action.excute(req, resp);
						} catch (Exception e) {
							e.printStackTrace();
						}
				}
		
		
		
		//----------------------------------마이페이지에서 수정눌렀을때 ..
		
		
				//저장한거 또 update -seller
					else if(command.equals("/updateSaveSeller2.sa")) {
											
						action = new updateSaveSellerAction2();
			
						try {
			
						 forward = action.excute(req, resp);
			
						} catch (Exception e) {
			
						e.printStackTrace();
			
						}
						
					
					}
				
				//저장한거 또 update -Board
				else if(command.equals("/updateSaveBoard2.sa")) {

				action = new updateSaveBoardAction2();

				try {

				 forward = action.excute(req, resp);

				} catch (Exception e) {

				e.printStackTrace();

				}
				
			
			}
		
		//저장한거 또 update -Board
				else if(command.equals("/updateSaveReward2.sa")) {

					action = new updateSaveRewardAction2();

					try {

					 forward = action.excute(req, resp);

					} catch (Exception e) {

					e.printStackTrace();

					}
					
				
				}
			 
			 
		//마이페이지 - 수정 - 신청하기
			 
				else if(command.equals("/saveWrite.sa")) {

					action = new SaveWriteAction();

					try {

					 forward = action.excute(req, resp);

					} catch (Exception e) {

					e.printStackTrace();

					}
					
				
				}
			
	}
}