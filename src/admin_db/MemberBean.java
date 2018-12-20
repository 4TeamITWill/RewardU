package admin_db;

import java.sql.Timestamp;

public class MemberBean {

	private String user_id, user_name, user_birth, user_phone,user_content, user_photo;
	Timestamp user_regDate;
	private int user_status;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Timestamp getUser_regDate() {
		return user_regDate;
	}
	public void setUser_regDate(Timestamp user_regDate) {
		this.user_regDate = user_regDate;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public String getUser_content() {
		return user_content;
	}
	public void setUser_content(String user_content) {
		this.user_content = user_content;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
}
