package message.action;

import java.io.PrintWriter;
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
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(no_checkbox != null){//체크된것이 하나라도 존재한다면
			ArrayList<Integer> list = new ArrayList<Integer>();
			for(String val : no_checkbox){
				//리스트에 체크된 메시지들의 번호를 담음
				list.add(Integer.parseInt(val));
			}
			MessageDAO mdao = new MessageDAO();
			//보관될 메시지번호들을 담은 리스트를 전달하여 보관작업 진행
			mdao.storeMessageCheckbox(list,id,divide);
			
			out.println("<script>");
			out.println("alert('메시지가 보관함으로 이동되었습니다.')");
			if(divide.equals("receive")){out.println("location.href='./MemberMessage_ReceiveList.message'");}
			else if(divide.equals("send")){out.println("location.href='./MemberMessage_SendList.message'");}
			else if(divide.equals("store")){out.println("location.href='./MemberMessage_StoreList.message'");}
			out.println("</script>");
			
		}else{//아무것도 체크되지 않았다면
			
			out.println("<script>");
			out.println("alert('보관할 메시지를 선택해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
}
