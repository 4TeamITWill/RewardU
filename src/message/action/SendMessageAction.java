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
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('메시지를 전송하였습니다.')");
			out.println("location.href='./MemberMessage_ReceiveList.message'");
			out.println("</script>");
			
		} else {//실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('메시지 전송 실패')");
			out.println("history.back();");
			out.println("</script>");
			
		}//if ~ else끝

		return null;
	}//ActionForward()끝
}//SendMessageAction()끝
