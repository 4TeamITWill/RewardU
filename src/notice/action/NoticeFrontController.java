package notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeFrontController extends HttpServlet{
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
		
		//상단메뉴에서 공지사항 을 클릭했을 때
		if(command.equals("/Notice.no")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로 주소값 저장
			forward.setPath("./index.jsp?center=notice/notice.jsp");
		} 
		//관리자일 경우 공지사항 페이지에서 등록버튼을 눌렀을 경우
		else if(command.equals("/WriteNotice.no")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로 주소값 저장
			forward.setPath("./index.jsp?center=notice/writeNotice.jsp");
		}
		//공지사항 작성 페이지에서 등록버튼을 눌렀을 경우
		else if(command.equals("/WriteNoticeAction.no")){
			action=new WriteNoticeAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//공시 게시글 눌렀을 시 -> 공지 글 상세
		else if(command.equals("/ContentNotice.no")){
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false);
			//이동할 페이지 경로 주소값 저장
			forward.setPath("./index.jsp?center=notice/contentNotice.jsp");
		}
		//삭제버튼 눌렀을 시 -> 공지글 삭제
		else if(command.equals("/DeleteNoticeAction.no")){
			action=new DeleteNoticeAction();
			try {
				forward=action.execute(request, response);			
			} catch (Exception e) {
				e.printStackTrace();
			}
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
}
