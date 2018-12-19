package message.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*Action 관련 클래스들이.. 
 *Action인터페이스의 추상메소드를 오버라이딩 함으로써 클라이언트의 요청 처리 형태를 규격화 시킴*/
public interface Action {// 클레스를 만들기위한 틀
	
	//특정  클라이언트의 요청을 수행하고 그결과 값을 ActionForward객체 타입으로 반환
	//조건: 추상메서드 => 상속받은 클래스는 무조건 메서드 오버라이딩 해야 함.
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception;
}
