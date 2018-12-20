package admin_db;

import java.sql.Timestamp;

public class SellerBean {

	String user_id, company_no, company, company_addr, company_tell, company_fax, sellerAccount;
	int pd_no;
	Timestamp seller_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCompany_no() {
		return company_no;
	}
	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCompany_addr() {
		return company_addr;
	}
	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}
	public String getCompany_tell() {
		return company_tell;
	}
	public void setCompany_tell(String company_tell) {
		this.company_tell = company_tell;
	}
	public String getCompany_fax() {
		return company_fax;
	}
	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}
	public String getSellerAccount() {
		return sellerAccount;
	}
	public void setSellerAccount(String sellerAccount) {
		this.sellerAccount = sellerAccount;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public Timestamp getSeller_date() {
		return seller_date;
	}
	public void setSeller_date(Timestamp seller_date) {
		this.seller_date = seller_date;
	}
	
	
}
