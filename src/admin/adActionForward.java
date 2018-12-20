package admin;

public class adActionForward {
	//이동 방식
	private boolean isRedirect = false;
	//이동 경로
	private String path = null;
	
	public boolean isRedirect(){
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect){
		this.isRedirect = isRedirect;
	}
	public String getPath(){
		return path;
	}
	public void setPath(String path){
		this.path=path;
	}
}
