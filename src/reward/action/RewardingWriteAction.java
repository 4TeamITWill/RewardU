package reward.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javafx.scene.control.Alert;
import reward.db.BoardBean;
import reward.db.RewardDAO;
import reward.db.SaveBoard;
import reward.db.SellerBean;



public class RewardingWriteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("RewardingWriteAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		//board작성 폼(RewardingWrite.jsp)에서 입력한 정보들을 BoardBean객체(자바빈, DTO)에 저장
		BoardBean bb = new BoardBean();
		
		//bb.setPd_no(Integer.parseInt(request.getParameter("pd_no")));
		bb.setUser_id(request.getParameter("user_id"));
		bb.setPd_subject(request.getParameter("pd_subject")); //상품이름
		bb.setPd_content(request.getParameter("pd_content")); //상품설명
		bb.setPd_goalMoney(request.getParameter("pd_goalMoney")); //목표금액
		bb.setPd_category(request.getParameter("pd_category")); //상품분류
		bb.setPd_file(request.getParameter("pd_file")); //첨부파일
		bb.setPd_realFile(request.getParameter("pd_realFile"));
		bb.setPd_start(new Timestamp(System.currentTimeMillis())); /*상품등록일은 관리자가 승인해주면 그 시간으로 업데이트*/
		bb.setPd_end(request.getParameter("pd_end")); //마감일
		
		//리워드 옵션
		bb.setPd_opprice1(request.getParameter("pd_opprice1"));
		bb.setPd_opcontent1(request.getParameter("pd_opcontent1"));
		bb.setPd_opprice2(request.getParameter("pd_opprice2"));
		bb.setPd_opcontent2(request.getParameter("pd_opcontent2"));
		bb.setPd_opprice3(request.getParameter("pd_opprice3"));
		bb.setPd_opcontent3(request.getParameter("pd_opcontent3"));
		
		
		SellerBean sb = new SellerBean();
		
		sb.setCompany(request.getParameter("company"));
		sb.setCompany_no(request.getParameter("company_no"));
		sb.setCompany_tell(request.getParameter("company_tell"));
		sb.setCompany_fax(request.getParameter("company_fax"));
		sb.setCompany_addr(request.getParameter("company_addr"));
		sb.setSellerAcount(request.getParameter("sellerAcount"));
		
		
		
		
		
		//관리자에게 전송 성공여부를 담을 변수 선언
		boolean result = false;
		
		//DB작업
				RewardDAO rdao = new RewardDAO();
				
				//작성한 게시글내용을 담고있는 bb,sb객체를 전달하여 DB작업을 하는데
				//성공하면 true리턴, 실패하면 false리턴 받음.
				result = rdao.insert(bb, sb);
				
				
				if (result==false) { //실패한 경우
					//System.out.println("양식을 다시 작성해주세요.");
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					
					out.println("<script>");
					out.println("alert('양식을 다시 작성해주세요.');");
					out.println("history.back();");
					out.println("</script>");
					
					return null;
					
				}
				
				
				//저장리스트에 해당 글 번호가 있을 경우 삭제..
					if (request.getParameter("pd_no") != null) {
						int pd_no = Integer.parseInt(request.getParameter("pd_no"));
						rdao.RewardingSaveDel(pd_no);
					}
					
					
					//회원가입에 성공했을 경우
				
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
				
					out.println("<script>");
					out.println("alert('관리자에게 전송되었습니다. 승인은 일주일내에..');");
					out.println("location.href='./submit.fu'");
					out.println("</script>");
				
					
					//페이지 이동방식 여부값, 이동할 페이지 주소값을 저장하여 리턴하는 역할을 하는 객체 생성
					ActionForward forward = new ActionForward();
					
					//페이지 이동 방식 여부값 true로 저장 <--Response.sendRedirect() 방식 : 이동할 주소를 웹브라우저 주소창에 노출 함.
					forward.setRedirect(false);
			
					
					return forward;  //new ActionForward()객체를 MemberFrontController서블릿으로 리턴함.
					
				
				}
				
}
