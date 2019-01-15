package message.action;

import java.io.PrintWriter;

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
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('메시지가 보관함으로 이동되었습니다.')");
		if(divide.equals("receive")){out.println("location.href='./MemberMessage_ReceiveList.message'");}
		else if(divide.equals("send")){out.println("location.href='./MemberMessage_SendList.message'");}
		else if(divide.equals("store")){out.println("location.href='./MemberMessage_StoreList.message'");}
		out.println("</script>");
		
		return null;
	}

}
