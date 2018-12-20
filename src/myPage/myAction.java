package myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface myAction {

	public myActionForward execute(HttpServletRequest request, HttpServletResponse response);
}
