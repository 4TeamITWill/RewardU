package my_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import admin_db.BoardBean;
import admin_db.BoardDAO;
import admin_db.MemberBean;

public class myDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private Connection getConnection() throws Exception{
		
		DataSource ds = null;		
		
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;		
	}
	
	private void freeResource(){
		try{
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//마이페이지 눌렀을때 띄워줄 정보 보여주기 getUser() 메소드
	public MemberBean getUser(String user_id){
		
		MemberBean mbean = null;
		String sql = "";
		
		try {
			con= getConnection();
			sql = "select * from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mbean = new MemberBean();
				
				mbean.setUser_birth(rs.getString("user_birth"));
				mbean.setUser_id(rs.getString("user_id"));
				mbean.setUser_name(rs.getString("user_name"));
				mbean.setUser_phone(rs.getString("user_phone"));
				mbean.setUser_regDate(rs.getTimestamp("user_regDate"));
				mbean.setUser_content(rs.getString("user_content"));
				mbean.setUser_photo(rs.getString("user_photo"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeResource();
		}
		return mbean;
	}//getUser() 메소드 끝
	
	//user_id를 넣고 board테이블과 JOIN해서 해당 id가 좋아요 누른 board를 가져오는 getGoodBoard() 메소드
	public ArrayList<BoardBean> getGoodBoard(String user_id) {
		
		ArrayList<BoardBean> goodlist = new ArrayList<BoardBean>();
		BoardBean bbean = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select b.pd_no, b.user_id, b.pd_category, b.pd_start, b.pd_end, b.pd_goalmoney, b.pd_curmoney, b.pd_subject from good g inner join board b on g.pd_no = b.pd_no where g.user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bbean = new BoardBean();
				
				bbean.setPd_no(rs.getInt("pd_no"));
				bbean.setUser_id(rs.getString("user_id"));
				bbean.setPd_category(rs.getString("pd_category"));
				bbean.setPd_start(rs.getTimestamp("pd_start"));		
				bbean.setPd_end(rs.getTimestamp("pd_end"));
				bbean.setPd_goalmoney(rs.getString("pd_goalmoney"));
				bbean.setPd_curmoney(rs.getString("pd_curmoney"));
				bbean.setPd_subject(rs.getString("pd_subject"));
				
				goodlist.add(bbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeResource();
		}
		return goodlist;
	}//getGoodBoard() 메소드 끝
	
	//투자리스트 가져오기 getRewardBoard() 메소드
	public ArrayList<InvestBean> getRewardBoard(String user_id) {
		
		ArrayList<InvestBean> invelist = new ArrayList<InvestBean>();
		InvestBean ibean = null;
		String sql = "";
		double percent = 0.0;
		
		try{
			
			con = getConnection();
			
			sql = "select * from investmentList where user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ibean = new InvestBean();
				
				ibean.setInv_account(rs.getString("inv_account"));
				ibean.setInv_addr(rs.getString("inv_addr"));
				ibean.setInv_confirm(rs.getInt("inv_confirm"));
				ibean.setInv_date(rs.getTimestamp("inv_date"));
				ibean.setInv_name(rs.getString("inv_name"));
				ibean.setInv_orderno(rs.getInt("inv_orderno"));
				ibean.setInv_phone(rs.getString("inv_phone"));
				ibean.setInv_price(rs.getInt("inv_price"));
				ibean.setInv_qty(rs.getInt("inv_qty"));
				ibean.setInv_username(rs.getString("inv_username"));
				ibean.setPd_no(rs.getInt("pd_no"));
				ibean.setUser_id(rs.getString("user_id"));
				
				BoardDAO bdao = new BoardDAO();
				BoardBean bbean = bdao.getBoard(ibean.getPd_no());
								
				ibean.setPd_result(bbean.getPd_result());
				
				percent = (Double.parseDouble(bbean.getPd_curmoney())/Double.parseDouble(bbean.getPd_goalmoney()))*100;
				
				ibean.setInv_percent((int)percent);				
				
				invelist.add(ibean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			freeResource();
		}
		
		return invelist;
	}//getRewardBoard()메소드 끝
	
	
}
