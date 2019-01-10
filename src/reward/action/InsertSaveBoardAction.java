package reward.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reward.db.RewardBean;
import reward.db.RewardDAO;


public class InsertSaveBoardAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("InsertSaveBoardAction excute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		RewardBean all = new RewardBean();
		
		//보드 정보
		all.setUser_id(request.getParameter("user_id")); //세션에 있는 아이디 가져오기
		all.setPd_subject(request.getParameter("pd_subject")); //상품이름
		all.setPd_content(request.getParameter("pd_content")); //상품설명
		all.setPd_goalMoney(request.getParameter("pd_goalMoney")); //목표금액
		all.setPd_category(request.getParameter("pd_category")); //상품분류
		all.setPd_file(request.getParameter("pd_file")); //첨부파일
		all.setPd_realFile(request.getParameter("pd_realFile"));
		all.setPd_start(new Timestamp(System.currentTimeMillis())); /*상품등록일은 관리자가 승인해주면 그 시간으로 업데이트*/
		all.setPd_end(request.getParameter("pd_end")); //마감일
		

		//저장 성공여부를 담을 변수 선언
		boolean result = false;
		RewardDAO rdao = new RewardDAO();
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		//성공하면 true리턴, 실패하면 false리턴 받음.
		result = rdao.insertSaveBoard(all, user_id);

		if (result==false) { //실패한 경우
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('저장에 실패했습니다. 양식을 다시 작성해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			
			return null;
		}
		
		//방금 저장한 값 넘기기
		int save = rdao.getMax_no(user_id);
		session.setAttribute("save", save);
		session.setAttribute("board", all);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		out.println("<script>");
		out.println("alert('저장되었습니다.');");
		out.println("location.href='board2.fu'");
		out.println("</script>");
		
		//저장에 성공했을 경우
		//페이지 이동방식 여부값, 이동할 페이지 주소값을 저장하여 리턴하는 역할을 하는 객체 생성
		ActionForward forward = new ActionForward();
		
		//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
		forward.setRedirect(false);
		
		return forward;
	}

}
