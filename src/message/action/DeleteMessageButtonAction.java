package message.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.db.MessageDAO;

public class DeleteMessageButtonAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//삭제할 id를 넘겨받음
		String id = request.getParameter("id");	
		//삭제할 메시지 번호를 넘겨받음
		int no = Integer.parseInt(request.getParameter("no"));
		
		MessageDAO mdao = new MessageDAO();
		//삭제할 번호를 넘겨 해당 메시지 삭제
		mdao.deleteMessageButton(no, id);
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./MemberMessage.message");
		return forward;
	}

}
