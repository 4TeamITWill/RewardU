package message.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import message.db.MessageDAO;

public class DeleteMessageCheckboxAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//삭제할 id를 넘겨받음
		String id = request.getParameter("id");	
		//삭제를 위해 체크된 메시지 번호들을 넘겨받음
		String[] no_checkbox = request.getParameterValues("deleteCheck");
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(String val : no_checkbox){
			//리스트에 체크된 메시지들의 번호를 담음
			list.add(Integer.parseInt(val));
		}
		MessageDAO mdao = new MessageDAO();
		//삭제될 메시지번호들을 담은 리스트를 전달하여 삭제작업 진행
		mdao.deleteMessageCheckbox(list,id);
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./MemberMessage.message");
		return forward;
	}
}
