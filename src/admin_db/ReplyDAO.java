package admin_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.media.jai.operator.BandCombineDescriptor;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.print.attribute.standard.PDLOverrideSupported;
import javax.sql.DataSource;







public class ReplyDAO {
	private Connection getConnection() throws Exception{
		Connection con=null;
		Context inti=new InitialContext();
		DataSource ds=(DataSource)inti.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	
	
	
	
	public void insertReply(ReplyBean bb){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int re_no =0;
		
		try {
		
			con=getConnection();
			sql="select max(re_no) from reply where pd_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getPd_no());
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				
				re_no=rs.getInt(1)+1; //1번열   가장큰번호+1
			}
			
			
			sql="insert into reply values(?,?,?,now(),?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getPd_no()); 
			pstmt.setString(2, bb.getUser_id());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, re_no);
			pstmt.setInt(5, re_no);//group;
			pstmt.setInt(6, 0);//seq;
			pstmt.setInt(7, 0);//lev
			
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
	
	
	public void insertreReply(ReplyBean bb){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int re_no=0;
		try {
			
			con=getConnection();
			
			sql="select max(re_no) from reply where pd_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getPd_no());
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				re_no=rs.getInt(1)+1;
				
			}
			
			sql="update reply set seq=seq+1 where group_num=? and seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getGroup_num());
			pstmt.setInt(2, bb.getSeq());
			pstmt.executeUpdate();
			
			sql="insert into reply values(?,?,?,now(),?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getPd_no()); 
			pstmt.setString(2, bb.getUser_id());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, re_no); //num
			pstmt.setInt(5, bb.getGroup_num()); // 답글 re_ref 그대로
			pstmt.setInt(6, bb.getSeq()+1);
			pstmt.setInt(7, bb.getLev()+1);  // 답글 re_lev +1
			  // 답글 re_seq +1 
			
			
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	

	
	
	
	public ArrayList<ReplyBean> getList(int pd_no){
		ArrayList<ReplyBean> list = new ArrayList<>();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
	
		ResultSet rs=null;
					
				try {
					
					con=getConnection();
					
					sql="select * from reply where pd_no like '%"+pd_no+"%' order by group_num asc";
					pstmt=con.prepareStatement(sql);
					
					rs=pstmt.executeQuery();
				
					while(rs.next()){
						ReplyBean bdto = new ReplyBean();
						
						bdto.setPd_no(rs.getInt("pd_no"));
						bdto.setUser_id(rs.getString("user_id"));
						bdto.setContent(rs.getString("content"));
						bdto.setDate(rs.getTimestamp("date"));
						bdto.setRe_no(rs.getInt("re_no"));
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
	
	
	
	
	
	
		public int reply(int pd_no){
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			ResultSet rs=null;
			ReplyBean dd = new ReplyBean();
			int result =0;
			
			try {
				
				con=getConnection();
				
				sql="select * from reply where pd_no like '%"+pd_no+"%'";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
			
				if(rs.next()){
					
					result = rs.getInt("group_num");
					
					
					
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
			return result;
	}//get group_num

	
	

		
	}//ReplyDto
	
	
	
	
	

