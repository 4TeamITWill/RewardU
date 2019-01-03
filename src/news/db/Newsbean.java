package news.db;

import java.sql.Timestamp;

public class Newsbean {

	private int reNews_no;
	private String user_id;
	private String user_name;
	private String reNews_title;
	private String reNews_summary;
	private String reNews_content;
	private String reNews_file;
	private String reNews_views;
	private Timestamp reNews_date;
	private String reNews_category;
	
	public int getReNews_no() {
		return reNews_no;
	}
	public void setReNews_no(int reNews_no) {
		this.reNews_no = reNews_no;
	}
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
	public String getReNews_title() {
		return reNews_title;
	}
	public void setReNews_title(String reNews_title) {
		this.reNews_title = reNews_title;
	}
	public String getReNews_summary() {
		return reNews_summary;
	}
	public void setReNews_summary(String reNews_summary) {
		this.reNews_summary = reNews_summary;
	}
	public String getReNews_content() {
		return reNews_content;
	}
	public void setReNews_content(String reNews_content) {
		this.reNews_content = reNews_content;
	}
	public String getReNews_file() {
		return reNews_file;
	}
	public void setReNews_file(String reNews_file) {
		this.reNews_file = reNews_file;
	}
	public String getReNews_views() {
		return reNews_views;
	}
	public void setReNews_views(String reNews_views) {
		this.reNews_views = reNews_views;
	}
	public Timestamp getReNews_date() {
		return reNews_date;
	}
	public void setReNews_date(Timestamp reNews_date) {
		this.reNews_date = reNews_date;
	}
	public String getReNews_category() {
		return reNews_category;
	}
	public void setReNews_category(String reNews_category) {
		this.reNews_category = reNews_category;
	}
	
	
	
}
