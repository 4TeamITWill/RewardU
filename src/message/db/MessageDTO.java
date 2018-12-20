package message.db;

import java.sql.Timestamp;

public class MessageDTO {
	/*기본적으로 message_xxx 테이블에 사용될 DTO  (xxx == receive, send, store)*/
	private int no; //메시지 번호
	private String toID; //보낸 사람 ID
	private String fromID; //받는 사람 ID
	private String subject; //메시지 제목
	private String content; //메시지 내용
	private Timestamp reg_date; //보낸 날짜
	private int read_status; //읽은 상태 (안읽은 메시지 0 , 읽은 메시지 1)
	private String storeID; //message_store 테이블에만 존재함. 보관함에 메시지를 저장한 당사자ID
	
	//getter, setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getRead_status() {
		return read_status;
	}
	public void setRead_status(int read_status) {
		this.read_status = read_status;
	}
	public String getStoreID() {
		return storeID;
	}
	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}
	
}
