package invest_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InvestDAO {
	
private Connection  getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	}

	public void insertInvest(InvestBean ibean) {
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		try {
			con  = getConnection();
			
			sql = "insert into investmentList(user_id,pd_no,inv_orderno,inv_name,inv_investor,inv_addr,inv_phone,"
					+ "inv_price,inv_date,inv_confirm,inv_account,op1_price,op1_qty,op2_price,op2_qty,op3_price,op3_qty) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ibean.getUser_id());
			pstmt.setInt(2, ibean.getPd_no());
			pstmt.setInt(3, ibean.getInv_orderno());
			pstmt.setString(4, ibean.getInv_name());
			pstmt.setString(5, ibean.getInv_investor());
			pstmt.setString(6, ibean.getInv_addr());
			pstmt.setString(7, ibean.getInv_phone());
			pstmt.setString(8, ibean.getInv_price());
			pstmt.setTimestamp(9, ibean.getInv_date());
			pstmt.setInt(10, 0);
			pstmt.setString(11, null);
			pstmt.setString(12, ibean.getOp1_price());
			pstmt.setInt(13, ibean.getOp1_qty());
			pstmt.setString(14, ibean.getOp2_price());
			pstmt.setInt(15, ibean.getOp2_qty());
			pstmt.setString(16, ibean.getOp3_price());
			pstmt.setInt(17, ibean.getOp3_qty());
			
			result = pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertInvest end
	

}
