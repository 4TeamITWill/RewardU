package invest_db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InvestDAO {
	
private Connection  getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	}

	public void insertInvest(InvestBean ibean) {
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		try {
			con  = getConnection();
			
			sql = "insert into investmentList(user_id,pd_no,inv_orderno,inv_name,inv_investor,inv_addr,inv_phone,"
					+ "inv_price,inv_date,inv_confirm,inv_account,op1_price,op1_qty,op2_price,op2_qty,op3_price,op3_qty,pd_realfile) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ibean.getUser_id());
			pstmt.setInt(2, ibean.getPd_no());
			pstmt.setInt(3, ibean.getInv_orderno());
			pstmt.setString(4, ibean.getInv_name());
			pstmt.setString(5, ibean.getInv_investor());
			pstmt.setString(6, ibean.getInv_addr());
			pstmt.setString(7, ibean.getInv_phone());
			pstmt.setString(8, ibean.getInv_price());
			pstmt.setTimestamp(9, ibean.getInv_date());
			pstmt.setInt(10, 0);
			pstmt.setString(11, null);
			pstmt.setString(12, ibean.getOp1_price());
			pstmt.setInt(13, ibean.getOp1_qty());
			pstmt.setString(14, ibean.getOp2_price());
			pstmt.setInt(15, ibean.getOp2_qty());
			pstmt.setString(16, ibean.getOp3_price());
			pstmt.setInt(17, ibean.getOp3_qty());
			pstmt.setString(18, ibean.getPd_realfile());
			
			result = pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertInvest end

	public void incParticipant(int pd_no, String inv_price) {
			
			Connection con=null;
			PreparedStatement pstmt=null;
			String sql="";
			ResultSet rs=null;
			try {
				con = getConnection();
				sql = "update board set pd_participant = pd_participant+1, pd_curmoney = pd_curmoney+? where pd_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, inv_price);
				pstmt.setInt(2, pd_no);
				
				pstmt.executeUpdate();
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
			
	}//incParticipant() 끝
		
	//participate 테이블에 정보 저장하는 메소드
	public void insertParticipate(String id, int pd_no, String par_money,int inv_orderno){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		
		try {
			con = getConnection();
			sql = "insert into participate(user_id, pd_no, par_money, inv_orderno) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pd_no);
			pstmt.setString(3, par_money);
			pstmt.setInt(4, inv_orderno);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//렌덤으로 생성된 주문번호를 받아서 중복검사
	public int createOrderNo(int inv_orderno){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int result = 0;
		
		try {
			con = getConnection();
			//렌덤으로 생성된 주문번호 orderNo가 이미 테이블에 있는가?
			sql = "select * from investmentList where inv_orderno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inv_orderno);
			rs = pstmt.executeQuery();
			if(rs.next()){//있다면 사용할 수 없는 주문번호이므로 2리턴
				result = 2;
			}
			else{ //없다면 사용할 수 있는 주문번호이므로 1리턴
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
	}

}
