package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface adAction {
	
	public adActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
