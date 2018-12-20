package message.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.db.MessageDAO;

public class StoreMessageCheckboxAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		//id를 넘겨받음
		String id = request.getParameter("id");	
		//구분 값 받아옴( receive, send, store)
		String divide = request.getParameter("divide");
		
		//보관을 위해 체크된 메시지 번호들을 넘겨받음
		String[] no_checkbox = request.getParameterValues("messageCheck");
		
		if(no_checkbox != null){//체크된것이 하나라도 존재한다면
			ArrayList<Integer> list = new ArrayList<Integer>();
			for(String val : no_checkbox){
				//리스트에 체크된 메시지들의 번호를 담음
				list.add(Integer.parseInt(val));
			}
			MessageDAO mdao = new MessageDAO();
			//보관될 메시지번호들을 담은 리스트를 전달하여 보관작업 진행
			mdao.storeMessageCheckbox(list,id,divide);
			
			//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
			ActionForward forward=new ActionForward();
			//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
			forward.setRedirect(false);
			//이동할 페이지 주소 저장, 구분값에 따라 이동하는 페이지 달리함
			if(divide.equals("receive")){forward.setPath("./MemberMessage_ReceiveList.message");}
			else if(divide.equals("send")){forward.setPath("./MemberMessage_SendList.message");}
			else if(divide.equals("store")){forward.setPath("./MemberMessage_StoreList.message");}
			
			return forward;
		}else{//아무것도 체크되지 않았다면
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
}
