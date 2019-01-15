package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class ReplyDAO2 {
	private Connection getConnection() throws Exception{
		Connection con=null;
		Context inti=new InitialContext();
		DataSource ds=(DataSource)inti.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	
	public ReplyBean getData(int pd_no){
		ReplyBean dto = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try {
			con = getConnection();
			sql = "select * from reply where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new ReplyBean();
				dto.setPd_no(rs.getInt("pd_no"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setGroup_num(rs.getInt("group_num"));
				dto.setSeq(rs.getInt("seq"));
				dto.setLev(rs.getInt("lev"));
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	
	public void insertReply(ReplyBean bb){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int pd_no =0;
		
		try {
		
			con=getConnection();
			sql="insert into reply values(?,?,?,now(),?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getPd_no()); 
			pstmt.setString(2, bb.getUser_id());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, bb.getGroup_num());//group;
			pstmt.setInt(5, bb.getSeq());//seq;
			pstmt.setInt(6, bb.getLev());//lev
			
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//객체 닫기
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}//insertreply
	

	
	
	
	public ArrayList<ReplyBean> getList(int pd_no){
		ArrayList<ReplyBean> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		
		ResultSet rs=null;
					
				try {
					
					con=getConnection();
					/**/
					sql="select * from reply where pd_no like '%"+pd_no+"%' order by group_num desc, lev asc, seq desc";
					pstmt=con.prepareStatement(sql);
				
					rs=pstmt.executeQuery();
				
					while(rs.next()){
						ReplyBean bdto = new ReplyBean();
						
						bdto.setPd_no(rs.getInt("pd_no"));
						bdto.setUser_id(rs.getString("user_id"));
						bdto.setContent(rs.getString("content"));
						bdto.setDate(rs.getTimestamp("date"));
						bdto.setGroup_num(rs.getInt("group_num"));
						bdto.setSeq(rs.getInt("seq"));
						bdto.setLev(rs.getInt("lev"));
						
						
						list.add(bdto);
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
			}//listreply
	
	//해당 메인글 그룹의 그룹 내 순서 구하기
		public int getCurrentseq(int groupNum) {
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			ResultSet rs=null;
			 sql = "select max(seq) from reply where group_num=?";
			int seq = 0;
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, groupNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					seq = rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println("getCurrent_group_in_Num err : + " + e);
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					
				}
			}
			return seq;
		}
	
	

		
	}//ReplyDto
	
	
	
	
	

