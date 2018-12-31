package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
		
	private Connection  getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	}
	
	//게시글 개수 가져오기 getBoardCount() 메소드
	public int getBoardCount(){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();			
			
				sql = "select count(*) from board where pd_permit=0";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
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
		
		return count;
	}//getBoardCount() 메소드 끝
	
	//글리스트 전체 받아오기 getBoardList() 메소드
	public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
		
		ArrayList<BoardBean> list = new ArrayList<>();		
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			con = getConnection();			
			
				sql = "select * from board where pd_permit = 0 order by pd_no desc limit ?,?";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BoardBean bbean = new BoardBean();
				
				bbean.setPd_category(rs.getString("pd_category"));
				bbean.setPd_content(rs.getString("pd_content"));
				bbean.setPd_count(rs.getInt("pd_count"));
				bbean.setPd_curmoney(rs.getString("pd_curmoney"));
				bbean.setPd_end(rs.getTimestamp("pd_end"));
				bbean.setPd_file(rs.getString("pd_file"));
				bbean.setPd_goalmoney(rs.getString("pd_goalmoney"));
				bbean.setPd_good(rs.getInt("pd_good"));
				bbean.setPd_no(rs.getInt("pd_no"));
				bbean.setPd_opcontent1(rs.getString("pd_opcontent1"));
				bbean.setPd_opcontent2(rs.getString("pd_opcontent2"));
				bbean.setPd_opcontent3(rs.getString("pd_opcontent3"));
				bbean.setPd_opprice1(rs.getInt("pd_opprice1"));
				bbean.setPd_opprice2(rs.getInt("pd_opprice2"));
				bbean.setPd_opprice3(rs.getInt("pd_opprice3"));
				bbean.setPd_participant(rs.getInt("pd_participant"));
				bbean.setPd_permit(rs.getInt("pd_permit"));
				bbean.setPd_realfile(rs.getString("pd_realfile"));
				bbean.setPd_result(rs.getInt("pd_result"));
				bbean.setPd_start(rs.getTimestamp("pd_start"));
				bbean.setPd_subject(rs.getString("pd_subject"));
				bbean.setUser_id(rs.getString("user_id"));
				bbean.setPd_rate(rs.getDouble("pd_rate"));
				bbean.setPd_ratecount(rs.getInt("pd_ratecount"));
				
				list.add(bbean);
				
				
			}
			
		}catch(Exception e){
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
		
		return list;
		
	}//getBoardList() 메소드 끝
	
	
		
	//글 하나의 상세정보 보기 getBoard() 메소드
	public BoardBean getBoard(int pd_no){
		
		BoardBean bbean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from board where pd_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				bbean = new BoardBean();
				
				bbean.setPd_category(rs.getString("pd_category"));
				bbean.setPd_content(rs.getString("pd_content"));
				bbean.setPd_count(rs.getInt("pd_count"));
				bbean.setPd_curmoney(rs.getString("pd_curmoney"));
				bbean.setPd_end(rs.getTimestamp("pd_end"));
				bbean.setPd_file(rs.getString("pd_file"));
				bbean.setPd_goalmoney(rs.getString("pd_goalmoney"));
				bbean.setPd_good(rs.getInt("pd_good"));
				bbean.setPd_no(rs.getInt("pd_no"));
				bbean.setPd_opcontent1(rs.getString("pd_opcontent1"));
				bbean.setPd_opcontent2(rs.getString("pd_opcontent2"));
				bbean.setPd_opcontent3(rs.getString("pd_opcontent3"));
				bbean.setPd_opprice1(rs.getInt("pd_opprice1"));
				bbean.setPd_opprice2(rs.getInt("pd_opprice2"));
				bbean.setPd_opprice3(rs.getInt("pd_opprice3"));
				bbean.setPd_participant(rs.getInt("pd_participant"));
				bbean.setPd_permit(rs.getInt("pd_permit"));
				bbean.setPd_realfile(rs.getString("pd_realfile"));
				bbean.setPd_result(rs.getInt("pd_result"));
				bbean.setPd_start(rs.getTimestamp("pd_start"));
				bbean.setPd_subject(rs.getString("pd_subject"));
				bbean.setUser_id(rs.getString("user_id"));		
				bbean.setPd_rate(rs.getDouble("pd_rate"));
				bbean.setPd_ratecount(rs.getInt("pd_ratecount"));
				
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
		
		return bbean;
	}//getBoard() 메소드 끝
	
	//admin 판매글 승인 boardPermit() 메소드
	public void boardPermit(int pd_no){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			
			con = getConnection();
			sql = "update board set pd_permit = 1 where pd_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
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
	}

	//게시글 거절 메소드
	public void boardDeny(int pd_no) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			
			con = getConnection();
			sql = "update board set pd_permit = -1 where pd_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			pstmt.executeUpdate();
			
		}catch(Exception e){
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
		
	}//boardDeny() 메소드 끝
}
