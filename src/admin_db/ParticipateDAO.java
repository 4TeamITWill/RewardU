package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ParticipateDAO {
	private Connection getConnection() throws Exception{

		Connection con=null;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	public ArrayList<ParticipateBean> getParticipateList(int pd_no){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ParticipateBean> list = new ArrayList<ParticipateBean>();
		ParticipateBean pbean = null;
		
		try {
			con = getConnection();
			sql = "select * from participate where pd_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				pbean = new ParticipateBean();
				pbean.setPd_no(rs.getInt("pd_no"));
				pbean.setUser_id(rs.getString("user_id"));
				pbean.setPar_money(rs.getString("par_money"));
				list.add(pbean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}//getParticipateList끝
	
	
	
}//ParticipateDAO 끝
