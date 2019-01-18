package reward.db;

import java.sql.Timestamp;

public class RewardBean {	//Board와 Seller의 컬럼을 전부 담고있는 DTO
							//join할때 쓴다..
	private int pd_no;
	private String user_id;
	private String pd_subject;
	private String pd_category;
	private Timestamp pd_start;
	private String pd_end; 
	private int pd_good;
	private int pd_count;
	private String pd_file;
	private String pd_realFile;
	private String pd_goalMoney;
	private String pd_curMoney;
	private int pd_participant;
	private int pd_result;
	private int pd_permit;
	private String pd_content;
	private String pd_opprice1;
	private String pd_opcontent1;
	private String pd_opsubject1;
	private String pd_opprice2;
	private String pd_opcontent2;
	private String pd_opsubject2;
	private String pd_opprice3;
	private String pd_opcontent3;
	private String pd_opsubject3;
	private double pd_rate; 
	private int pd_rateCount;
	private String company_no;
	private String company;
	private String company_addr;
	private String company_tell;
	private String company_fax;
	private Timestamp seller_date; /*판매자가 처음 등록된 날짜*/
	private String sellerAccount;
	
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
	public String getPd_subject() {
		return pd_subject;
	}
	public void setPd_subject(String pd_subject) {
		this.pd_subject = pd_subject;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public Timestamp getPd_start() {
		return pd_start;
	}
	public void setPd_start(Timestamp pd_start) {
		this.pd_start = pd_start;
	}
	public String getPd_end() {
		return pd_end;
	}
	public void setPd_end(String pd_end) {
		this.pd_end = pd_end;
	}
	public int getPd_good() {
		return pd_good;
	}
	public void setPd_good(int pd_good) {
		this.pd_good = pd_good;
	}
	public int getPd_count() {
		return pd_count;
	}
	public void setPd_count(int pd_count) {
		this.pd_count = pd_count;
	}
	public String getPd_file() {
		return pd_file;
	}
	public void setPd_file(String pd_file) {
		this.pd_file = pd_file;
	}
	public String getPd_realFile() {
		return pd_realFile;
	}
	public void setPd_realFile(String pd_realFile) {
		this.pd_realFile = pd_realFile;
	}
	public String getPd_goalMoney() {
		return pd_goalMoney;
	}
	public void setPd_goalMoney(String pd_goalMoney) {
		this.pd_goalMoney = pd_goalMoney;
	}
	public String getPd_curMoney() {
		return pd_curMoney;
	}
	public void setPd_curMoney(String pd_curMoney) {
		this.pd_curMoney = pd_curMoney;
	}
	public int getPd_participant() {
		return pd_participant;
	}
	public void setPd_participant(int pd_participant) {
		this.pd_participant = pd_participant;
	}
	public int getPd_result() {
		return pd_result;
	}
	public void setPd_result(int pd_result) {
		this.pd_result = pd_result;
	}
	public int getPd_permit() {
		return pd_permit;
	}
	public void setPd_permit(int pd_permit) {
		this.pd_permit = pd_permit;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	public String getPd_opprice1() {
		return pd_opprice1;
	}
	public void setPd_opprice1(String pd_opprice1) {
		this.pd_opprice1 = pd_opprice1;
	}
	public String getPd_opcontent1() {
		return pd_opcontent1;
	}
	public void setPd_opcontent1(String pd_opcontent1) {
		this.pd_opcontent1 = pd_opcontent1;
	}
	public String getPd_opprice2() {
		return pd_opprice2;
	}
	public void setPd_opprice2(String pd_opprice2) {
		this.pd_opprice2 = pd_opprice2;
	}
	public String getPd_opcontent2() {
		return pd_opcontent2;
	}
	public void setPd_opcontent2(String pd_opcontent2) {
		this.pd_opcontent2 = pd_opcontent2;
	}
	public String getPd_opprice3() {
		return pd_opprice3;
	}
	public void setPd_opprice3(String pd_opprice3) {
		this.pd_opprice3 = pd_opprice3;
	}
	public String getPd_opcontent3() {
		return pd_opcontent3;
	}
	public void setPd_opcontent3(String pd_opcontent3) {
		this.pd_opcontent3 = pd_opcontent3;
	}
	public double getPd_rate() {
		return pd_rate;
	}
	public void setPd_rate(double pd_rate) {
		this.pd_rate = pd_rate;
	}
	public int getPd_rateCount() {
		return pd_rateCount;
	}
	public void setPd_rateCount(int pd_rateCount) {
		this.pd_rateCount = pd_rateCount;
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
	public String getSellerAccount() {
		return sellerAccount;
	}
	public void setSellerAccount(String sellerAccount) {
		this.sellerAccount = sellerAccount;
	}
	public String getPd_opsubject1() {
		return pd_opsubject1;
	}
	public void setPd_opsubject1(String pd_opsubject1) {
		this.pd_opsubject1 = pd_opsubject1;
	}
	public String getPd_opsubject2() {
		return pd_opsubject2;
	}
	public void setPd_opsubject2(String pd_opsubject2) {
		this.pd_opsubject2 = pd_opsubject2;
	}
	public String getPd_opsubject3() {
		return pd_opsubject3;
	}
	public void setPd_opsubject3(String pd_opsubject3) {
		this.pd_opsubject3 = pd_opsubject3;
	}
	
	
}
