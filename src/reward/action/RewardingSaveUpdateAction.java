package reward.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reward.db.RewardDAO;
import reward.db.SaveBoard;
import reward.db.SaveSeller;

public class RewardingSaveUpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("RewardingSaveUpdateAction execute()메소드 호출 됨");
		request.setCharacterEncoding("UTF-8");
		
		SaveBoard saveB = new SaveBoard();
		
		saveB.setPd_no(Integer.parseInt(request.getParameter("pd_no")));
		saveB.setUser_id(request.getParameter("user_id"));
		saveB.setPd_subject(request.getParameter("pd_subject")); //상품이름
		saveB.setPd_content(request.getParameter("pd_content")); //상품설명
		saveB.setPd_goalMoney(request.getParameter("pd_goalMoney")); //목표금액
		saveB.setPd_category(request.getParameter("pd_category")); //상품분류
		saveB.setPd_file(request.getParameter("pd_file")); //첨부파일
		saveB.setPd_realFile(request.getParameter("pd_realFile")); 
		saveB.setPd_end(request.getParameter("pd_end")); //마감일
		
		//리워드 옵션
		saveB.setPd_opprice1(request.getParameter("pd_opprice1"));
		saveB.setPd_opcontent1(request.getParameter("pd_opcontent1"));
		saveB.setPd_opprice2(request.getParameter("pd_opprice2"));
		saveB.setPd_opcontent2(request.getParameter("pd_opcontent2"));
		saveB.setPd_opprice3(request.getParameter("pd_opprice3"));
		saveB.setPd_opcontent3(request.getParameter("pd_opcontent3"));

		//판매자 정보
		SaveSeller saveS = new SaveSeller();
		
		saveS.setCompany(request.getParameter("company"));
		saveS.setCompany_no(request.getParameter("company_no"));
		saveS.setCompany_tell(request.getParameter("company_tell"));
		saveS.setCompany_fax(request.getParameter("company_fax"));
		saveS.setCompany_addr(request.getParameter("company_addr"));
		saveS.setSellerAcount(request.getParameter("sellerAcount"));

		//저장 성공여부를 담을 변수 선언
		boolean result = false;
			
		//DB작업
			RewardDAO rdao = new RewardDAO();
			
			//작성한 게시글내용을 담고있는 saveB, saveS객체를 전달하여 DB작업을 하는데
			//성공하면 true리턴, 실패하면 false리턴 받음.
			result = rdao.RewardingSaveUpdate(saveB, saveS);
			
			
			
			if (result==false) { //실패한 경우
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('저장에 실패했습니다. 양식을 다시 작성해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				
				return null;
			}
	
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
		
			out.println("<script>");
			out.println("alert('저장되었습니다.');");
			out.println("location.href='./RewardingSaveList.fu'");
			out.println("</script>");
			

			ActionForward forward = new ActionForward();
			
			forward.setRedirect(false);
			
		
			return forward;
	}

	
	
}
