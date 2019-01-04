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
	
	//寃뚯떆湲� 媛쒖닔 媛��졇�삤湲� getBoardCount() 硫붿냼�뱶
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
	}//getBoardCount() 硫붿냼�뱶 �걹
	
	//湲�由ъ뒪�듃 �쟾泥� 諛쏆븘�삤湲� getBoardList() 硫붿냼�뱶
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
		
	}//getBoardList() 硫붿냼�뱶 �걹
		
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
	}//getBoard() 硫붿냼�뱶 �걹
	
	//admin �뙋留ㅺ� �듅�씤 boardPermit() 硫붿냼�뱶
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
	}
	public ArrayList<BoardBean> getPermitList(String select ,String order, int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		try{
			con = getConnection();
			sql = "";
//			if(order.equals("pd_good")){
//				 sql = "select * from board where pd_permit = 1 order by pd_good limit ?,?";
//			}else if(order.equals("pd_count")){
//				 sql = "select * from board where pd_permit = 1 order by pd_count limit ?,?";
//			}else if(order.equals("pd_goalmoney")){
//				 sql = "select * from board where pd_permit = 1 order by pd_goalmoney limit ?,?";
//			}else if(order.equals("pd_start")){
//				 sql = "select * from board where pd_permit = 1 order by pd_start limit ?,?";
//			}else if(order.equals("pd_participant")){
//				 sql = "select * from board where pd_permit = 1 order by pd_participant limit ?,?";
//			}
			if(select == null){
				sql = "select * from board where pd_permit = 1 order by ? limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, order);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
			}else if(select != null){
				sql = "select * from board where pd_permit = 1 AND pd_result = ? order by ? limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, select);
				pstmt.setString(2, order);
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				rs = pstmt.executeQuery();
			}
			
			
			while(rs.next()) {
				BoardBean bBean = new BoardBean();
				
				bBean.setPd_no(rs.getInt("pd_no"));
				bBean.setUser_id(rs.getString("user_id"));
				bBean.setPd_category(rs.getString("pd_category"));
				bBean.setPd_start(rs.getTimestamp("pd_start"));
				bBean.setPd_end(rs.getTimestamp("pd_end"));
				bBean.setPd_good(rs.getInt("pd_good"));
				bBean.setPd_count(rs.getInt("pd_count"));
				bBean.setPd_file(rs.getString("pd_file"));
				bBean.setPd_realfile(rs.getString("pd_realFile"));
				bBean.setPd_goalmoney(rs.getString("pd_goalMoney"));
				bBean.setPd_curmoney(rs.getString("pd_curMoney"));
				bBean.setPd_participant(rs.getInt("pd_participant"));
				bBean.setPd_result(rs.getInt("pd_result"));
				bBean.setPd_permit(rs.getInt("pd_permit"));
				bBean.setPd_content(rs.getString("pd_content"));
				bBean.setPd_subject(rs.getString("pd_subject"));
				bBean.setPd_opcontent1(rs.getString("pd_opcontent1"));
				bBean.setPd_opprice1(rs.getInt("pd_opprice1"));
				bBean.setPd_opcontent2(rs.getString("pd_opcontent2"));
				bBean.setPd_opprice2(rs.getInt("pd_opprice2"));
				bBean.setPd_opcontent3(rs.getString("pd_opcontent3"));
				bBean.setPd_opprice3(rs.getInt("pd_opprice3"));
				
				list.add(bBean);
			}
			con.close();
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
	}

	public int getPermitListCount() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();			
			
				sql = "select count(*) from board where pd_permit=1";
			
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
	}

	public ArrayList<BoardBean> getPermitCategoryList(String category, String select, String order, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		try{
			con = getConnection();
			sql = "";

			if(select == null){
				sql = "select * from board where pd_permit = 1 AND pd_category = ? order by ? limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, order);
				pstmt.setInt(3, startRow-1);
				pstmt.setInt(4, pageSize);
				rs = pstmt.executeQuery();
			}else if(select != null){
				sql = "select * from board where pd_permit = 1 AND pd_category = ? AND pd_result = ? order by ? limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, select);
				pstmt.setString(3, order);
				pstmt.setInt(4, startRow-1);
				pstmt.setInt(5, pageSize);
				rs = pstmt.executeQuery();
			}
			
			
			while(rs.next()) {
				BoardBean bBean = new BoardBean();
				
				bBean.setPd_no(rs.getInt("pd_no"));
				bBean.setUser_id(rs.getString("user_id"));
				bBean.setPd_category(rs.getString("pd_category"));
				bBean.setPd_start(rs.getTimestamp("pd_start"));
				bBean.setPd_end(rs.getTimestamp("pd_end"));
				bBean.setPd_good(rs.getInt("pd_good"));
				bBean.setPd_count(rs.getInt("pd_count"));
				bBean.setPd_file(rs.getString("pd_file"));
				bBean.setPd_realfile(rs.getString("pd_realFile"));
				bBean.setPd_goalmoney(rs.getString("pd_goalMoney"));
				bBean.setPd_curmoney(rs.getString("pd_curMoney"));
				bBean.setPd_participant(rs.getInt("pd_participant"));
				bBean.setPd_result(rs.getInt("pd_result"));
				bBean.setPd_permit(rs.getInt("pd_permit"));
				bBean.setPd_content(rs.getString("pd_content"));
				bBean.setPd_subject(rs.getString("pd_subject"));
				bBean.setPd_opcontent1(rs.getString("pd_opcontent1"));
				bBean.setPd_opprice1(rs.getInt("pd_opprice1"));
				bBean.setPd_opcontent2(rs.getString("pd_opcontent2"));
				bBean.setPd_opprice2(rs.getInt("pd_opprice2"));
				bBean.setPd_opcontent3(rs.getString("pd_opcontent3"));
				bBean.setPd_opprice3(rs.getInt("pd_opprice3"));
				
				list.add(bBean);
			}
			con.close();
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
		
	}

	public int getPermitMoreListCount(String category, String select) {
		// TODO Auto-generated method stub
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				int count = 0;
				String sql = "";
				
				try {
					con = getConnection();			
					if(select != "all"){
						sql = "select count(*) from board where pd_category=? AND pd_result=? AND pd_permit=1";
					
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setString(2, select);
						rs = pstmt.executeQuery();
					}else if(select == "all"){
						sql = "select count(*) from board where pd_category=? AND pd_permit=1";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setString(2, select);
						rs = pstmt.executeQuery();
					}
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
			}
	
	
		public void upGood(int pd_no){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try {
				con = getConnection();
				sql = "update board set pd_good = pd_good+1 where pd_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pd_no);
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
		}//upGood()끝
		
		//전달받는 pd_no번호에 해당하는 board테이블의 pd_good값(좋아요 수)을 1 내려주는 메소드
			public void downGood(int pd_no){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "";
				
				try {
					con = getConnection();
					sql = "update board set pd_good = pd_good-1 where pd_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, pd_no);
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
			}//downGood()끝
			
			public int Good(String user_id, int pd_no){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "";
				int result = -1; //좋아요x -> 좋아요o  는 result 1   // 좋아요o -> 좋아요x  는 result 0
				try {
					//커넥션 객체 얻어옴
					con = getConnection();
					//사용자 아이디와 해당 게시글 번호가 good테이블에 저장되어 있는가?
					sql = "select * from good where user_id=? and pd_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					pstmt.setInt(2, pd_no);
					rs = pstmt.executeQuery();
					
					if(rs.next()){//good테이블에 이미 저장되어 있다면?
						//좋아요를 취소하는 상황이므로 good테이블에서 삭제한다.
						sql = "delete from good where user_id=? and pd_no=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, user_id);
						pstmt.setInt(2, pd_no);
						pstmt.executeUpdate();
						result = 0; //좋아요를 취소했으므로 result=0
					} 
					else{//good테이블에 없다면?
						//좋아요가 안된상황에서 좋아요를 누른것이므로 good테이블에 추가해준다.
						sql = "insert into good(user_id,pd_no) values(?,?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, user_id);
						pstmt.setInt(2, pd_no);
						pstmt.executeUpdate();
						result = 1; //좋아요를 했으므로 result=1
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try { //자원해제
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				return result;
			}//Good() 끝
			
			//사용자가 게시글 클릭해서 상세내용 들어왔을 때 좋아요를 한 상태인지 아닌 상태인지 구분하기 위한 메소드
			public int GoodStatus(String user_id, int pd_no){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "";
				int result = -1; //좋아요를 해놓은 상태라면 1을 리턴, 아니면 0을 리턴하기 위한 변수
				
				try {
					con = getConnection();
					//해당 사용자가 이 게시글을 좋아요 해놓은 상태인지 아닌지 알기 위해 검색
					sql = "select * from good where user_id=? and pd_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					pstmt.setInt(2, pd_no);
					rs = pstmt.executeQuery();
					
					if(rs.next()){ //좋아요를 해놓은 상황
						result = 1;
					} else{ //좋아요를 안해놓은 상황
						result = 0;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try { //자원해제
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				return result;
			}
		
	
}//BoardDAO 끝

