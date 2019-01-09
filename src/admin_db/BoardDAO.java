package admin_db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
		SimpleDateFormat df = new SimpleDateFormat("YYYY.MM.dd");
		
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
				bbean.setPd_endf(df.format(rs.getTimestamp("pd_end")));
				bbean.setPd_startf(df.format(rs.getTimestamp("pd_start")));
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
	public ArrayList<BoardBean> getPermitList(String category, String result ,int order, int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		System.out.println("category: "+category);
		System.out.println("result: "+result);
		System.out.println("order: "+order);
		System.out.println("startRow: "+startRow);
		System.out.println("pageSize: "+pageSize);
		try{
			con = getConnection();
			sql = "";
			if(category.equals("N")){
				if(result.equals("A")){
					sql = "select * from board where pd_permit = 1 order by ? DESC limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, order);
					pstmt.setInt(2, startRow-1);
					pstmt.setInt(3, pageSize);
					rs = pstmt.executeQuery();
				}else if(!result.equals("A")){
					sql = "select * from board where pd_permit = 1 AND pd_result = ? order by ? DESC limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, result);
					pstmt.setInt(2, order);
					pstmt.setInt(3, startRow-1);
					pstmt.setInt(4, pageSize);
					rs = pstmt.executeQuery();
				}
			}else if(!category.equals("N")){
				if(result.equals("A")){
					sql = "select * from board where pd_permit = 1 AND pd_category=? order by ? DESC limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, category);
					pstmt.setInt(2, order);
					pstmt.setInt(3, startRow-1);
					pstmt.setInt(4, pageSize);
					rs = pstmt.executeQuery();
				}else if(!result.equals("A")){
					sql = "select * from board where pd_permit = 1 AND pd_result = ? AND pd_category=? order by ? DESC limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, result);
					pstmt.setString(2, category);
					pstmt.setInt(3, order);
					pstmt.setInt(4, startRow-1);
					pstmt.setInt(5, pageSize);
					rs = pstmt.executeQuery();
				}
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

	public int getPermitListCount(String result, String category) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			if(category.equals("N")){
				if(result.equals("A")){
					sql = "select count(*) from board where pd_permit=1";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
				}else if(!result.equals("A")){
					sql = "select count(*) from board where pd_permit=1 AND pd_result=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, result);
					rs = pstmt.executeQuery();
				}
			}else if(!category.equals("N")){
				if(result.equals("A")){
					sql = "select count(*) from board where pd_permit=1 AND pd_category=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, category);
					rs = pstmt.executeQuery();
				}else if(!result.equals("A")){
					sql = "select count(*) from board where pd_permit=1 AND pd_result=? AND pd_category=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, result);
					pstmt.setString(2, category);
					rs = pstmt.executeQuery();
				}
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
	
	public void upCount(int pd_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update board set pd_count=pd_count+1 where pd_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { //자원해제
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//upCount 끝

	public ArrayList<BoardBean> getPermitstartList() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		try{
			con = getConnection();
			sql = "select * from board where pd_permit = 1 order by pd_start DESC limit 0,3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
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
		} finally {
			try { //자원해제
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}


	public ArrayList<BoardBean> getPermitGoodList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		try{
			con = getConnection();
			sql = "select * from board where pd_permit = 1 order by pd_good DESC limit 0,3";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
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
		} finally {
			try { //자원해제
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
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
	
	
	
	
	public void rate(double pd_rate,int pd_no){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update board set pd_rate = pd_rate+? where pd_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, pd_rate);
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
	}//rate()끝
	
	
	
	public void ratecount(int pd_no){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update board set pd_rateCount = pd_rateCount+1 where pd_no=?";
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
	}//ratecount()끝
	
	
	public double avgReview(int pd_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		double avg = 0;
		try {
			// 1,2단계 디비연결하는 메서드 호출
			con = getConnection();
			// 3단계 sql 구문
			sql = "select truncate(pd_rate/pd_rateCount,1) as avg from board where pd_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pd_no);
			
		  	
		  	rs= pstmt.executeQuery();
		  	
			if(rs.next()){
		  		avg = rs.getDouble(1);
		  	
		 	}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try안에서 예외 발생여부 상관없이 마무리 작업함.
			// 객체 생성해서 사용한 기억공간 없애줌 .close()
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}

		}
		return  avg;
	}
	

}//BoardDAO 끝


