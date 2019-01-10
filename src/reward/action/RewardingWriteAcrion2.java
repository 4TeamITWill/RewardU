package reward.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;
import reward.db.SaveBoard;
import reward.db.SaveSeller;

public class RewardingWriteAcrion2 implements Action{
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("신청하기 execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int pd_no = (Integer)session.getAttribute("save");

		RewardDAO rdao = new RewardDAO();
		
		//하나의 저장게시물 정보를 검색해오는 메소드를 호출
		RewardBean all = rdao.getSaveAll(pd_no);

		//두개의 테이블에 저장
		boolean result = false;
		result = rdao.insert2(all);
		
		if (result==false) { //실패한 경우
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('양식을 다시 작성해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			
			return null;
			
		}
		//저장성공시 저장테이블에서 삭체되고 세션 삭제
		rdao.allDel(pd_no);
		session.removeAttribute("save");
		session.removeAttribute("seller");
		session.removeAttribute("board");
		session.removeAttribute("reward");
		
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('신청되었습니다.');");
		out.println("location.href='./submit.fu'");
		out.println("</script>");
		
		
		
		ActionForward forward = new ActionForward();
		
		//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
		forward.setRedirect(false);
		
		// 전송완료페이지로 이동!!!!할 실제 페이지 주소 저장
		//forward.setPath("index.jsp?center=RewardingUpdate.jsp"); //가상 요청 주소값 저장

		return forward;
		
	}

}
