package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import admin_db.MemberBean;

public class MemberDAO {

	private Connection getConnection() throws Exception{
		
		Connection con = null;
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	}
	//멤버 검색후 정보 가져오기
	public ArrayList<MemberBean> getMember(String user_id){
		
		ArrayList<MemberBean> list = new ArrayList<>();
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		MemberBean mbean = null;
		
		try {
			con= getConnection();
			sql = "select * from user where user_id like '%"+user_id+"%'";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
								
			while(rs.next()){
				
				mbean = new MemberBean();
				
				mbean.setUser_id(rs.getString("user_id"));
				mbean.setUser_name(rs.getString("user_name"));
				mbean.setUser_phone(rs.getString("user_phone"));
				mbean.setUser_regDate(rs.getTimestamp("user_regDate"));
				mbean.setUser_status(rs.getInt("user_status"));
				mbean.setUser_birth(rs.getString("user_birth"));
				
				list.add(mbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}//getMember() 메소드 끝

	//멤버 정지시키기 memberBan() 메소드
	public void memberBan(String user_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try{
			
			con = getConnection();
			sql = "update user set user_status = 0 where user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
