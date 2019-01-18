package admin_db;
import java.sql.Timestamp;
public class ReplyBean {
		
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getGroup_num() {
		return group_num;
	}
	
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public String datef() {
		return datef;
	}
	public void setdatef(String datef) {
		this.datef = datef;
	}
		private int pd_no;
		private String user_id;
		private String content;
		private Timestamp date;
		private int re_no;
		public int getRe_no() {
			return re_no;
		}
		public void setRe_no(int re_no) {
			this.re_no = re_no;
		}
		private int group_num;
		private int seq;
		private int lev;
		private String datef;
		
}
