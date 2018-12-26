package notice.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.action.ActionForward;
import notice.db.NoticeDAO;
import notice.db.NoticeDTO;

public class WriteNoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		NoticeDTO ndto = new NoticeDTO();
		NoticeDAO ndao = new NoticeDAO();
		
		ndto.setSubject(subject);
		ndto.setContent(content);
		ndto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		ndao.writeNotice(ndto); //공지등록 DB작업
		
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성
		ActionForward forward=new ActionForward();
		//sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
		forward.setRedirect(true);
		//이동할 페이지 주소 저장
		forward.setPath("./Notice.no");
		
		return forward;
	}

}
