package news.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NewsDAO {

	private Connection getConnection() throws Exception{
		
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = dataSource.getConnection();
		
		return con;
	}
	
	public void insertNews(Newsbean nbean){
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String sql = "";
		int no = 0;
		
		try {
			
			con = getConnection();
			sql = "select max(reNews_no) from reNews";
			
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				no = rs.getInt(1)+1;
			}else {
				no =1;
			}
			
			sql = "insert into reNews values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, nbean.getUser_id());
			pstmt.setString(3, nbean.getUser_name());
			pstmt.setString(4, nbean.getReNews_title());
			pstmt.setString(5, nbean.getReNews_summary());
			pstmt.setString(6, nbean.getReNews_content());
			pstmt.setString(7, nbean.getReNews_file());
			pstmt.setInt(8, 0); //views
			pstmt.setTimestamp(9, nbean.getReNews_date());
			pstmt.setString(10, nbean.getReNews_category());
		
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
	}//insertNews
	
	
	public void updateViews(int no){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			
			con = getConnection();
			
			sql = "update reNews set reNews_views = reNews_views+1 "
					+ "where reNews_no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		
	}//updateViews
	
	
	public List<Newsbean> getNewsList(int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt =null;
		
		return null;
	}
	
	
	public Vector<Newsbean> getNewsList(String sortNews){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<Newsbean> v = new Vector<Newsbean>();
		
		Newsbean nbean = null;
		String sql = null;
		
		try {
			con = getConnection();
			
			if(sortNews == null || sortNews.isEmpty()){
				sql = "select * from reNews order by reNews_no desc";
			}else if(sortNews.equals("1")){
				sql = "select * from reNews order by reNews_date desc";
			}else if(sortNews.equals("2")){
				sql = "select * from reNews order by reNews_views desc";
			}
			
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nbean = new Newsbean();
				nbean.setReNews_no(rs.getInt("reNews_no"));
				nbean.setUser_id(rs.getString("user_id"));
				nbean.setUser_name(rs.getString("user_name"));
				nbean.setReNews_title(rs.getString("reNews_title"));
				nbean.setReNews_summary(rs.getString("reNews_summary"));
				nbean.setReNews_content(rs.getString("reNews_content"));
				nbean.setReNews_file(rs.getString("reNews_file"));
				nbean.setReNews_views(rs.getString("reNews_views"));
				nbean.setReNews_date(rs.getTimestamp("reNews_date"));
				nbean.setReNews_category(rs.getString("reNews_category"));
				
				v.add(nbean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//fianlly
		
		
		return v;
	}//getNewsList
	
	
	
	public Newsbean readContent(int no){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Newsbean nbean = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select * from reNews where reNews_no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nbean = new Newsbean();
				
				nbean.setReNews_no(rs.getInt("reNews_no"));
				nbean.setUser_id(rs.getString("user_id"));
				nbean.setUser_name(rs.getString("user_name"));
				nbean.setReNews_title(rs.getString("reNews_title"));
				nbean.setReNews_summary(rs.getString("reNews_summary"));
				nbean.setReNews_content(rs.getString("reNews_content"));
				nbean.setReNews_file(rs.getString("reNews_file"));
				nbean.setReNews_views(rs.getString("reNews_views"));
				nbean.setReNews_date(rs.getTimestamp("reNews_date"));
				nbean.setReNews_category(rs.getString("reNews_category"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		
		return nbean;
	}//readContent
	
	
	public void delelteNews (int no){
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "delete from reNews where reNews_no=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
	}//deleteNews
	
	
	public int getNewsCount(){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select count(*) from reNews";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}
	
	
}
