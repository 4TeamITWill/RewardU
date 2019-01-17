package news.db;

import java.sql.Timestamp;

public class SellerNewsBean {

	private int no;
	private int pd_no;
	private String user_id;
	private String sell_subject;
	private String sell_content;
	private Timestamp date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSell_subject() {
		return sell_subject;
	}
	public void setSell_subject(String sell_subject) {
		this.sell_subject = sell_subject;
	}
	public String getSell_content() {
		return sell_content;
	}
	public void setSell_content(String sell_content) {
		this.sell_content = sell_content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
}
