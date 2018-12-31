package reward.action;

public class ActionForward {
	 
	
	private boolean isRedirect = false;
	
	//이동 페이지 경로 주소값 저장할 변수
	private String path = null;
	
	//페이지 이동 방식 여부값 저장 메소드 setter
	public void setRedirect(boolean isRedirect){
		this.isRedirect = isRedirect;
	}
	//페이지 이동 방식 여부 값 리턴 메소드 getter
	public boolean isRedirect(){
		return isRedirect;
	}
	
	//이동 페이지 경로 주소값 저장할 메소드
	public void setPath(String path){
		this.path = path;
	}
	
	//이동 페이지 경로 주소값 리턴할 메소드
	public String getPath(){
		return path;
	}
}
