package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RateDAO {
	private Connection getConnection() throws Exception{

		Connection con=null;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	//별점 평가했을 때 이미 했던 게시물이면 -1리턴, 아니면 rate테이블에 정보 insert 후 1리턴
	public int insertRate(RateBean rbean){
		Connection con=null;
		String sql="";
		int result=0;
		int maxNum=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			sql = "select * from rate where user_id=? and pd_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rbean.getUser_id());
			pstmt.setInt(2, rbean.pd_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result=-1;
			}else{
				sql = "insert into rate(user_id,pd_no,my_rate) values(?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rbean.getUser_id());
				pstmt.setInt(2, rbean.getPd_no());
				pstmt.setDouble(3, rbean.getMy_rate());
				pstmt.executeUpdate();
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}//insertRate 끝
	
	
}
