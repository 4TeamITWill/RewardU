package message.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.resources.windows;

public class MessageFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		
		String contextPath=request.getContextPath();
		
		String command=RequestURI.substring(contextPath.length());
	
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
		
		//마이페이지에서 메시지함 클릭시, 메시지보내기 성공 후  -> 받은 메시지함
		if(command.equals("/MemberMessage_ReceiveList.message")){
		
			String pageNum = request.getParameter("pageNum");
			//만약 현재선택한 페이지 번호가 없으면 1페이지로 처리
			if(pageNum == null){pageNum = "1";}
			
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지함 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/messageBox_receivelist.jsp&pageNum="+pageNum);
		} 
		//보낸 메시지 클릭시 -> 보낸 메시지함
		else if(command.equals("/MemberMessage_SendList.message")){
		
			String pageNum = request.getParameter("pageNum");
			//만약 현재선택한 페이지 번호가 없으면 1페이지로 처리
			if(pageNum == null){pageNum = "1";}
			
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지함 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/messageBox_sendlist.jsp&pageNum="+pageNum);
		} 
		//메시지 보관함 클릭시 -> 메시지 보관함
		else if(command.equals("/MemberMessage_StoreList.message")){
			
			String pageNum = request.getParameter("pageNum");
			//만약 현재선택한 페이지 번호가 없으면 1페이지로 처리
			if(pageNum == null){pageNum = "1";}
			
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지함 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/messageBox_storelist.jsp&pageNum="+pageNum);
		} 
		//메시지보내기 클릭시 메시지 양식 폼으로 이동
		else if(command.equals("/SendMessage.message")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지 내용 작성 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/sendMessage.jsp");
		} 
		//실제로 메시지를 보내는 작업을 진행할 시
		else if(command.equals("/SendMessageAction.message")){
			//메시지를 보내기 위한 Action객체 생성
			action=new SendMessageAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지를 보내는데 실패했을 경우
		else if(command.equals("/SendMessageFail.message")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(메시지 전송 실패 알림 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/sendMessageFail.jsp");
		}
		//메시지함에서 체크한것 삭제버튼을 눌렀을 시
		else if(command.equals("/DeleteMessageCheckbox.message")){
			//메시지를 삭제를 위한 Action객체 생성
			action = new DeleteMessageCheckboxAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지 내용에서 해당 메시지 삭제버튼을 눌렀을 시
		else if(command.equals("/DeleteMessageButton.message")){
			//메시지를 삭제를 위한 Action객체 생성
			action=new DeleteMessageButtonAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지함에서 체크한것 보관버튼을 눌렀을 시
		else if(command.equals("/StoreMessageCheckbox.message")){
			//메시지를 삭제를 위한 Action객체 생성
			action = new StoreMessageCheckboxAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지 내용에서 해당 메시지 보관버튼을 눌렀을 시
		else if(command.equals("/StoreMessageButton.message")){
			//메시지를 삭제를 위한 Action객체 생성
			action=new StoreMessageButtonAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지 답변하기버튼을 눌렀을 시
		else if(command.equals("/AnswerMessage.message")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/answerMessage.jsp");
		}
		//메시지 내용을 불러오는 작업을 진행할 시
		else if(command.equals("/ContentMessageAction.message")){
			//메시지를 내용을 담기 위한 Action객체 생성
			action=new ContentMessageAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//메시지 제목을 눌렀을 시 -> 메시지 내용보여주는 화면으로
		else if(command.equals("/ContentMessage.message")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로(회원가입 페이지) 주소값 저장
			forward.setPath("./index.jsp?center=message/contentMessage.jsp");
		}

		//------------------------------------------------------------------------------------------------------
		//주소 이동
		if(forward!=null){ //new ActionForward()객체가 존재 하고..
			if(forward.isRedirect()){//true -> sendRedirect() 방식일떄..
				//리다이렉트 방식으로 페이지 이동!  페이지 주소 경로 노출 함 
				//join.jsp화면 이동
				//login.jsp화면 이동
				//CarMain.jsp화면 이동시 session영역 전달
				response.sendRedirect(forward.getPath());
				
			}else{//false -> forward() 방식일때...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 메소드 끝
	
}//서블릿 끝



