package myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class myGoodDelAction implements myAction {

	@Override
	public myActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String [] check = request.getParameterValues("check");
		
		for(int i =0; i<check.length; i++){
			System.out.println(check[i]);
		}
		return null;
	}

}
