package message.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javafx.scene.control.Alert;
import message.db.MessageDAO;
import message.db.MessageDTO;

public class SendMessageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		int result = 0;
		
		String toID = request.getParameter("toID");
		String fromID = request.getParameter("fromID");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		
		MessageDTO mdto = new MessageDTO();
		
		//메시지 테이블에 저장할 DAO함수 호출
		MessageDAO mdao = new MessageDAO();
		
		mdto.setToID(toID);
		mdto.setFromID(fromID);
		mdto.setSubject(subject);
		mdto.setContent(content);
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		//메시지보내기 성공 시 1을 리턴, 실패시 0을 리턴
		result = mdao.sendMessage(mdto);
		
		if(result == 1){ //성공시
			//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
			forward.setRedirect(false);
			//메시지함으로 이동할 페이지 주소 저장
			forward.setPath("./MemberMessage_ReceiveList.message");
			
		} else {//실패시
			forward.setRedirect(false);
			//메시지 전송 실패를 알리는 sendMessageFail.jsp로 이동
			forward.setPath("./SendMessageFail.message"); 
		}//if ~ else끝

		return forward;
	}//ActionForward()끝
}//SendMessageAction()끝
