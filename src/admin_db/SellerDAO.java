package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SellerDAO {

	private Connection  getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
		
		}
	
	public SellerBean getSeller(int pd_no){
		
		SellerBean sb = null;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from seller where pd_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sb= new SellerBean();
				
				sb.setCompany(rs.getString("company"));
				sb.setCompany_addr(rs.getString("company_addr"));
				sb.setCompany_fax(rs.getString("company_fax"));
				sb.setCompany_no(rs.getString("company_no"));
				sb.setCompany_tell(rs.getString("company_tell"));
				sb.setPd_no(rs.getInt("pd_no"));
				sb.setSeller_date(rs.getTimestamp("seller_date"));
				sb.setSellerAccount(rs.getString("selleraccount"));
				sb.setUser_id(rs.getString("user_id"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(con != null)con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
		return sb;
	}
}

	

	
