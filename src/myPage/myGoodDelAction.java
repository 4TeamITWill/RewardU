package myPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my_db.MyDAO;

public class myGoodDelAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String [] delCheck = request.getParameterValues("delcheck");
		
		MyDAO mdao = new MyDAO();
		
		if(delCheck != null){						
			
			PrintWriter out = null;
			response.setContentType("text/html; charset=utf-8"); 
			
			for(int i =0; i<delCheck.length; i++){				
				
				int result = mdao.delGood(Integer.parseInt(delCheck[i]));
				
				//실패시 뿌려줄거 												
				if(result == 0){
					
					try {
						out = response.getWriter();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
					
					out.println("<script>");
						out.println("alert('삭제 실패');");
						out.println("history.back();");
					out.println("</script>");					
				}
			}
			//삭제 성공시 뿌려줄거
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			response.setContentType("text/html; charset=utf-8"); 
			
			out.println("<script>");
				out.println("alert('삭제 하였습니다');");
				out.println("location.href='./index.jsp?center=./myPage/myIndex.jsp'");
			out.println("</script>");				
		
		}else{	//delCheck 가 null일때, 선택 안했을때
			
			PrintWriter out = null;
			response.setContentType("text/html; charset=utf-8"); 
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			out.println("<script>");
				out.println("alert('삭제할 프로젝트를 선택해주세요');");
				out.println("history.back();");
			out.println("</script>");	
		}
						
		return null;
	}
	
}
