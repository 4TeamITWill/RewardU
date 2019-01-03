package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;


public class MemberDAO {
	
	private Connection getConnection() throws Exception{
		
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = dataSource.getConnection();
		
		return con;
	}
	
	public String combinedDOB(MemberBean memberBean) {
		
		String year = memberBean.getBirthyyyy();
		String month = memberBean.getBirthmm();
		String date = memberBean.getBirthdd();
		
		String user_Birth = year+"-"+month+"-"+date;
		
		return user_Birth;
	}
	
	
	public boolean insertMember(MemberBean mb){
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		try {
			con  = getConnection();
			
			sql = "insert into user "
					+ "values(?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getUser_id());
			pstmt.setString(2, mb.getUser_pw());
			pstmt.setString(3, mb.getUser_name());
			pstmt.setString(4, combinedDOB(mb));
			pstmt.setString(5, mb.getUser_phone());
			pstmt.setTimestamp(6, mb.getUser_regDate());
			pstmt.setInt(7, 1);
			pstmt.setString(8, mb.getUser_photo());
			pstmt.setString(9, mb.getUser_content());
			
			result = pstmt.executeUpdate();
			
			if(result!=0){return true;}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}//finally
		
		return false;
	}//insertMember
	
	/*Login 회원체크*/
	public int userCheck(String user_id, String user_pw){
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		int check = -1;
		
		ResultSet rs = null;
		
		try {
			
			con = getConnection();
			sql = "select user_pw from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				if(user_pw.equals(rs.getString("user_pw"))){
					check = 1;
				}else {
					check = 0; //incorrect password
				}
			}else {
				check = -1;	//incorrect id
				System.out.println("noooo incorrect id " + check);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return check;
	}//userCheck
	
	
	public MemberBean getMember(String user_id){
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		int check = 1;
		
		ResultSet rs = null;
		MemberBean mbean = null;
		
		try {
			con = getConnection();
			
			sql = "select * from user where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mbean = new MemberBean();
				
				String user_birth = rs.getString("user_birth");	
				String year = user_birth.substring(0, 4);
				String month = user_birth.substring(5,7);
				String day = user_birth.substring(8, 10);
				
				mbean.setUser_id(rs.getString("user_id"));
				mbean.setUser_pw(rs.getString("user_pw"));
				mbean.setUser_name(rs.getString("user_name"));
				mbean.setUser_phone(rs.getString("user_phone"));
				mbean.setUser_photo(rs.getString("user_photo"));
				mbean.setUser_regDate(rs.getTimestamp("user_regDate"));
				mbean.setUser_content(rs.getString("user_content"));
				mbean.setBirthyyyy(year);
				mbean.setBirthmm(month);
				mbean.setBirthdd(day);
				return mbean;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return mbean;
	}//getMember
	
	
	public int deleteMember(String user_id, String user_pw){
		
		int check = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select user_pw from user where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				if(user_pw.equals(rs.getString("user_pw"))){
					check = 1;
					
					sql = "delete from user where user_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					pstmt.executeUpdate();
				}else {
					check = 0;
				}
				
			}//if
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return check;
		
	}//deleteMember
	
	public String findId(MemberBean mbean){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String user_id=null;
		String sql = "";
		
		try {
			 
			con = getConnection();
			
			sql = "select user_id from user where user_phone=? and user_birth=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getUser_phone());
			pstmt.setString(2, combinedDOB(mbean));
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				user_id = rs.getString("user_id");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return user_id;
	}//findId
	
	
	public MemberBean findPw(MemberBean mbean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_pw=null;
		
		MemberBean mbean1 =null;
		
		int result = -1;
		String sql = "";
		
		try {
			String user_id = mbean.getUser_id();
			String user_phone = mbean.getUser_phone();
			String user_birth = combinedDOB(mbean);
			
			con = getConnection();
			
			sql = "select user_pw from user where user_id=? and user_phone=? and user_birth=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_phone);
			pstmt.setString(3, combinedDOB(mbean));
			
			rs = pstmt.executeQuery();
			
			/*while(rs.next()){
				user_pw = rs.getString("user_pw");
			}*/
			
			if(rs.next()){
				result=1;
				mbean1 = new MemberBean();
				user_pw = rs.getString("user_pw");
				mbean1.setUser_pw(user_pw);
				//System.out.println(user_id+" "+user_phone+" "+user_birth);
				
				//System.out.println(user_pw);
				return mbean1;
			}else{
				mbean1 = new MemberBean();
				result=0;
				return mbean1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return null;
	}//findPw
	
	
	public void updateUser(MemberBean mbean){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "update user set user_name=?, user_phone=?, user_content=? where user_id=?";
			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getUser_name());
			pstmt.setString(2, mbean.getUser_phone());
			pstmt.setString(3, mbean.getUser_content());
			pstmt.setString(4, mbean.getUser_id());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();

	
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}//finally
		
	}//updateUser
	
	
	
	public int updatePw(String user_id, String user_pw, String user_pw3){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		int check = 0;
		
		MemberBean mbean = null;
		
		try {
			
			con = getConnection();
			
			sql = "select user_pw from user where user_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				if(user_pw.equals(rs.getString("user_pw"))){
					check=1;
					
				sql = "update user set user_pw=? where user_id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, user_pw3);
				pstmt.setString(2, user_id);
				
				pstmt.executeUpdate();
					System.out.println("okay");
				}else {
					check=0;
					System.out.println("pw wrong");
				}
			}//if
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
	
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}//finally
		return check;
	}//updatePw
	
	
	public String randomNum() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int n = (int)(Math.random() * 10);
			sb.append(n);
		}
		return sb.toString();
	}//randomNum()
}
