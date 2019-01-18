package myPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my_db.MyDAO;

public class myRewardDelAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		//삭제 클릭시 받아온 상품번호와 총금액
		int inv_price = Integer.parseInt(request.getParameter("inv_price"));
		int pd_no = Integer.parseInt(request.getParameter("pd_no"));	
		String user_id = (String)session.getAttribute("id");
		int inv_orderno = Integer.parseInt(request.getParameter("inv_orderno"));
				
		MyDAO mdao = new MyDAO();
		int result = mdao.delReward(pd_no, user_id, inv_price, inv_orderno);
		
		if(result > 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {	out = response.getWriter();} catch (IOException e) {e.printStackTrace();}
			out.println("<script>");
				out.println("alert('취소 되었습니다.')");
				out.println("location.href='myPageReward.my'");
			out.println("</script>");
			
			out.close();
		}
		
		return null;
	}

}
