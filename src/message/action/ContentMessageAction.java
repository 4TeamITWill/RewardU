package message.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import message.db.MessageDAO;
import message.db.MessageDTO;

public class ContentMessageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//클릭한 메시지 번호를 받아옴
		int no = Integer.parseInt(request.getParameter("no"));
		//구분 값 받아옴( receive, send, store)
		String divide = request.getParameter("divide");
		String id = request.getParameter("id");
		
		MessageDTO mdto = new MessageDTO();
		MessageDAO mdao = new MessageDAO();
		
		mdto = mdao.getMessage(no,divide,id); //해당번호의 메시지 정보를 얻어옴
		if(divide.equals("receive")){mdao.updateReadStatus(no); }//read_status 값을 1로 변경하여 읽은 메시지로 처리
		/*
		//세션객체 생성
		HttpSession session=request.getSession();
		//세션저장
		session.setAttribute("mdto", mdto); 
		session.setAttribute("divide", divide);*/
		request.setAttribute("mdto", mdto);
		request.setAttribute("divide", divide);
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(false);
		//메시지함으로 이동할 페이지 주소 저장
		forward.setPath("./ContentMessage.message");
		return forward;
	}

}
