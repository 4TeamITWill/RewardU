package invest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class investFrontController extends HttpServlet {

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//request 영역의 한글 처리
		request.setCharacterEncoding("UTF-8");
		//가상주소 전체	
		String URI = request.getRequestURI();
		//패키지명
		String contextPath = request.getContextPath();
		//요청페이지 값 가져오기
		String command = URI.substring(contextPath.length());
		
		inAction action = null;
		inActionForward forward = null;
		
		//옵션 및 수량 선택후 다음단계 버튼 클릭시
		if(command.equals("/InvestingOptionController.in")) {
			action = new inChoosingOptionAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
		}else if(command.equals("/InvestingInsertController.in")) {
			action = new inInsertingAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		//이동
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
}

