package invest_db;

import java.sql.Timestamp;

public class InvestBean {
	private String user_id;
	private int pd_no;
	private int inv_orderno;
	private String inv_name;
	private String inv_investor;
	private String inv_addr;
	private String inv_phone;
	private String inv_price;
	private Timestamp inv_date;
	private String inv_confirm;
	private String inv_account;
	private String op1_price;
	private int op1_qty;
	private String op2_price;
	private int op2_qty;
	private String op3_price;
	private int op3_qty;
	
	//getter, setter
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getInv_name() {
		return inv_name;
	}
	public void setInv_name(String inv_name) {
		this.inv_name = inv_name;
	}
	public String getInv_investor() {
		return inv_investor;
	}
	public void setInv_investor(String inv_investor) {
		this.inv_investor = inv_investor;
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
	public String getInv_price() {
		return inv_price;
	}
	public void setInv_price(String inv_price) {
		this.inv_price = inv_price;
	}
	public Timestamp getInv_date() {
		return inv_date;
	}
	public void setInv_date(Timestamp inv_date) {
		this.inv_date = inv_date;
	}
	public String getInv_confirm() {
		return inv_confirm;
	}
	public void setInv_confirm(String inv_confirm) {
		this.inv_confirm = inv_confirm;
	}
	public String getInv_account() {
		return inv_account;
	}
	public void setInv_account(String inv_account) {
		this.inv_account = inv_account;
	}
	public String getOp1_price() {
		return op1_price;
	}
	public void setOp1_price(String op1_price) {
		this.op1_price = op1_price;
	}
	public int getOp1_qty() {
		return op1_qty;
	}
	public void setOp1_qty(int op1_qty) {
		this.op1_qty = op1_qty;
	}
	public String getOp2_price() {
		return op2_price;
	}
	public void setOp2_price(String op2_price) {
		this.op2_price = op2_price;
	}
	public int getOp2_qty() {
		return op2_qty;
	}
	public void setOp2_qty(int op2_qty) {
		this.op2_qty = op2_qty;
	}
	public String getOp3_price() {
		return op3_price;
	}
	public void setOp3_price(String op3_price) {
		this.op3_price = op3_price;
	}
	public int getOp3_qty() {
		return op3_qty;
	}
	public void setOp3_qty(int op3_qty) {
		this.op3_qty = op3_qty;
	}
	
}
