package message.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.db.MessageDAO;
import message.db.MessageDTO;

@WebServlet("/sendToAdmin") //관리자에게 문의메시지를 보내기 요청을 했을 시
public class sendToAdmin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//메시지 작성에 필요한 값 받아오기
		String toID = request.getParameter("toID");
		String fromID = request.getParameter("fromID");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		MessageDTO mdto = new MessageDTO();
		MessageDAO mdao = new MessageDAO();
		
		//DTO객체 설정
		mdto.setToID(toID);
		mdto.setFromID(fromID);
		mdto.setSubject(subject);
		mdto.setContent(content);
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		//INSERT
		int result = mdao.sendMessage(mdto);
		
		//quick_menu.jsp로 result값을 전달해서 성공여부를 확인 할 수 있게 함
		PrintWriter out = response.getWriter();
		out.write(result + "");
	
	}
	
}
