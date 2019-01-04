package invest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface inAction {
	
	public inActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
