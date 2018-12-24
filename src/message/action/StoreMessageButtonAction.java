package message.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.db.MessageDAO;

public class StoreMessageButtonAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//id를 넘겨받음
		String id = request.getParameter("id");	
		//삭제할 메시지 번호를 넘겨받음
		int no = Integer.parseInt(request.getParameter("no"));
		//구분 값 받아옴( receive, send, store)
		String divide = request.getParameter("divide");
		
		MessageDAO mdao = new MessageDAO();
		//보관할 번호와 구분값을 넘겨 해당 메시지 보관함으로 이동
		mdao.storeMessageButton(no, id, divide);
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(false);
		//이동할 페이지 주소 저장, 구분값에 따라 이동하는 페이지 달리함
		if(divide.equals("receive")){forward.setPath("./MemberMessage_ReceiveList.message");}
		else if(divide.equals("send")){forward.setPath("./MemberMessage_SendList.message");}
		else if(divide.equals("store")){forward.setPath("./MemberMessage_StoreList.message");}
		
		return forward;
	}

}
