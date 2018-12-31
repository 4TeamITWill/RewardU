package reward.db;

import java.sql.Timestamp;

public class SaveSeller {
	
	/*private String user_id;*/
	private int pd_no;
	private String company_no;
	private String company;
	private String company_addr;
	private String company_tell;
	private String company_fax;
	private Timestamp seller_date; /*판매자가 처음 등록된 날짜*/
	private String sellerAcount;
	
	
/*	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}*/
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
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
	public Timestamp getSeller_date() {
		return seller_date;
	}
	public void setSeller_date(Timestamp seller_date) {
		this.seller_date = seller_date;
	}
	public String getSellerAcount() {
		return sellerAcount;
	}
	public void setSellerAcount(String sellerAcount) {
		this.sellerAcount = sellerAcount;
	}
	
	
	
}
