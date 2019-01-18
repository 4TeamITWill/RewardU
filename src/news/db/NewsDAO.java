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
			
			sql = "insert into reNews values(?,?,?,?,?,?,?,?,?,?,?)";
			
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
			pstmt.setString(11, nbean.getReNews_img());
		
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
	
/*	
	public List<Newsbean> getNewsList(int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt =null;
		
		return null;
	}
*/	
	
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
				nbean.setReNews_img(rs.getString("reNews_img"));
				
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
	
	//리듀누스 검색
	public Vector<Newsbean> totalNewsSearch (String newsKeyword){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<Newsbean> v = new Vector<Newsbean>();
		
		Newsbean nbean = null;
		String sql = null;
		
		try {
			
			con = getConnection();
			
			sql = "select * from reNews where reNews_title like '%"+ newsKeyword + "%' order by reNews_no desc";
			
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
				nbean.setReNews_img(rs.getString("reNews_img"));
				
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
		
	}//totalNewsSearch
	
	
	//리듀뉴스 검색 count
	public int NewSearchCount(String newsKeyword) {
		
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select count(*) from reNews where "
					+ "reNews_title like '%"+ newsKeyword + "%' order by reNews_no desc";
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
				nbean.setReNews_img(rs.getString("reNews_img"));
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
	
	//뉴스 전체 카운트
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
	}//getNewsCount
	
	
	public Newsbean bestNewsViews (){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Newsbean bestNews = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select reNews_no, reNews_title from reNews where reNews_views = (select Max(reNews_views) from reNews);";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bestNews = new Newsbean();
				
				bestNews.setReNews_no(rs.getInt(1));
				bestNews.setReNews_title(rs.getString(2));
				
				System.out.println(bestNews);
				
				return bestNews;
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
		
		
		return bestNews;
	}
	//메인에 뿌려줄 뉴스리스트 받아오기 파라미터없이 오버로딩
	public Vector<Newsbean> getNewsList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<Newsbean> v = new Vector<Newsbean>();
		
		Newsbean nbean = null;
		String sql = null;
		
		try {
			con = getConnection();
			
			sql = "select * from reNews order by reNews_no desc limit 0,5";
			
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
				nbean.setReNews_img(rs.getString("reNews_img"));
				
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
	}
	
	//sellerNews 메소드------------------------------------
	
	//판매자 소식 총 몇개?
	public int getSellerNewsCount(){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select count(*) from sellerNews";
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
	}//getNewsCount
	
	//판매자리스트 몽땅 가죠오기
	public Vector<SellerNewsBean> getSellerNewsList(int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<SellerNewsBean> v = new Vector<>();
		
		SellerNewsBean nbean = null;
		String sql = null;
		
		try {
			con = getConnection();
			
			sql = "select * from sellerNews order by no desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nbean = new SellerNewsBean();
				nbean.setDate(rs.getTimestamp("date"));
				nbean.setNo(rs.getInt("no"));
				nbean.setPd_no(rs.getInt("pd_no"));
				nbean.setSell_content(rs.getString("sell_content"));
				nbean.setSell_subject(rs.getString("sell_subject"));
				nbean.setUser_id(rs.getString("user_id"));
				nbean.setPd_subject(rs.getString("pd_subject"));
				
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
	
	//판매자소식 검색
	public Vector<SellerNewsBean> totalSellerNewsSearch (int startRow, int pageSize, String newsKeyword){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<SellerNewsBean> v = new Vector<SellerNewsBean>();
		
		SellerNewsBean nbean = null;
		String sql = null;
		
		try {
			
			con = getConnection();
			
			sql = "select * from sellerNews where "
					+ "user_id like '%"+ newsKeyword + "%' || "
					+ "sell_subject like '%"+ newsKeyword + "%' ||"
					+ "pd_subject like '%"+ newsKeyword + "%'"
					+ " order by no desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nbean = new SellerNewsBean();
				nbean.setDate(rs.getTimestamp("date"));
				nbean.setNo(rs.getInt("no"));
				nbean.setPd_no(rs.getInt("pd_no"));
				nbean.setSell_content(rs.getString("sell_content"));
				nbean.setSell_subject(rs.getString("sell_subject"));
				nbean.setUser_id(rs.getString("user_id"));
				nbean.setPd_subject(rs.getString("pd_subject"));
				
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
		
	}//totalSellerNewsSearch
	
	

	//판매자 소식 중 검색결과는 총 몇개?
	public int SellerNewSearchCount(String newsKeyword){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select count(*) from sellerNews where "
					+ "user_id like '%"+ newsKeyword + "%' || "
					+ "sell_subject like '%"+ newsKeyword + "%' ||"
					+ "pd_subject like '%"+ newsKeyword + "%'";
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
	}//getsellerNewsSerchCount
	
	
	
	public SellerNewsBean sellerReadContent(int no){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		SellerNewsBean nbean = null;
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select * from sellerNews where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				nbean = new SellerNewsBean();
				
				nbean.setDate(rs.getTimestamp("date"));
				nbean.setNo(rs.getInt("no"));
				nbean.setPd_no(rs.getInt("pd_no"));
				nbean.setSell_content(rs.getString("sell_content"));
				nbean.setSell_subject(rs.getString("sell_subject"));
				nbean.setUser_id(rs.getString("user_id"));
				nbean.setPd_subject(rs.getString("pd_subject"));
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


	
	
}
