package my_db;

import java.sql.Timestamp;

public class InvestBean {

	private String user_id, inv_name, inv_username, inv_addr, inv_phone, inv_account, pd_subject, pd_content, inv_datef;
	private int pd_no, inv_orderno, inv_qty, inv_price, inv_confirm, pd_result, inv_percent;
	private Timestamp inv_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getInv_name() {
		return inv_name;
	}
	public void setInv_name(String inv_name) {
		this.inv_name = inv_name;
	}
	public String getInv_username() {
		return inv_username;
	}
	public void setInv_username(String inv_username) {
		this.inv_username = inv_username;
	}
	public String getInv_addr() {
		return inv_addr;
	}
	public void setInv_addr(String inv_addr) {
		this.inv_addr = inv_addr;
	}
	public String getInv_phone() {
		return inv_phone;
	}
	public void setInv_phone(String inv_phone) {
		this.inv_phone = inv_phone;
	}
	public String getInv_account() {
		return inv_account;
	}
	public void setInv_account(String inv_account) {
		this.inv_account = inv_account;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getInv_orderno() {
		return inv_orderno;
	}
	public void setInv_orderno(int inv_orderno) {
		this.inv_orderno = inv_orderno;
	}
	public int getInv_qty() {
		return inv_qty;
	}
	public void setInv_qty(int inv_qty) {
		this.inv_qty = inv_qty;
	}
	public int getInv_price() {
		return inv_price;
	}
	public void setInv_price(int inv_price) {
		this.inv_price = inv_price;
	}
	public int getInv_confirm() {
		return inv_confirm;
	}
	public void setInv_confirm(int inv_confirm) {
		this.inv_confirm = inv_confirm;
	}
	public Timestamp getInv_date() {
		return inv_date;
	}
	public void setInv_date(Timestamp inv_date) {
		this.inv_date = inv_date;
	}
	public int getPd_result() {
		return pd_result;
	}
	public void setPd_result(int pd_result) {
		this.pd_result = pd_result;
	}
	public int getInv_percent() {
		return inv_percent;
	}
	public void setInv_percent(int inv_percent) {
		this.inv_percent = inv_percent;
	}
	public String getPd_subject() {
		return pd_subject;
	}
	public void setPd_subject(String pd_subject) {
		this.pd_subject = pd_subject;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public String getInv_datef() {
		return inv_datef;
	}
	public void setInv_datef(String inv_datef) {
		this.inv_datef = inv_datef;
	}

}
