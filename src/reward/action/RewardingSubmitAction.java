package reward.action;

import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class RewardingSubmitAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("RewardingSubmiteAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		//아이디 중에 @ 앞부분만 잘라 랜덤번호와 함께 도메인 주소 만들어줌..
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		System.out.println(user_id);
		String[] split_id = new String[2];
        split_id = user_id.split("@");
        String splitId = split_id[0];
		int no = new Random().nextInt(100000)+1000;
		
		String domain = splitId+"_"+no;
		
		//전송완료 페이지에.. 전달할것들
		request.setAttribute("domain", domain);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("index.jsp?center=submit.jsp");

		return forward;
	}
}
