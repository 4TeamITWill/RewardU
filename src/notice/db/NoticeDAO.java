package notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	
	private Connection getConnection() throws Exception{

		Connection con=null;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}
	
	//공지 등록하는 메소드
	public void writeNotice(NoticeDTO ndto){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		int maxNum=1;
		
		try {
			con = getConnection();
	
			/*다음 작업은 등록된 공지게시글 번호 중 가장 큰 번호를 찾는 작업*/
			/*공지 번호는 실제로 나타나지 않지만 관리차원에 사용됨*/
			sql = "select max(no) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){//메시지 존재하면 기존것의 +1
				maxNum=rs.getInt(1)+1;
			}else{//메시지 받은게 없으면 첫 번째 번호는 1로 설정
				maxNum=1;}  
			
			/* INSERT작업 */
			sql = "insert into notice(no,subject,content,reg_date,read_count) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, maxNum);
			pstmt.setString(2, ndto.getSubject());
			pstmt.setString(3, ndto.getContent());
			pstmt.setTimestamp(4, ndto.getReg_date());
			pstmt.setInt(5, 0);
			
			pstmt.executeUpdate();//INSERT
	
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
	}//writeNotice()끝
	
	//게시글 리스트를 반환하는 메소드
	public ArrayList<NoticeDTO> getNoticeList(int startRow, int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		NoticeDTO ndto = null;
		try {
			con = getConnection();
			
			sql = "select * from notice order by no desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ndto = new NoticeDTO();
				ndto.setNo(rs.getInt("no"));
				ndto.setSubject(rs.getString("subject"));
				ndto.setContent(rs.getString("content"));
				ndto.setReg_date(rs.getTimestamp("reg_date"));
				ndto.setRead_count(rs.getInt("read_count"));
				list.add(ndto);
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
		return list;
	}//getNoticeList() 끝
	
	//공지 게시글 누르면 조회수 올리는 메소드
	public void upReadCount(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		
		try {
			con = getConnection();
			sql = "select * from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "update notice set read_count = read_count+1 where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();
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
	}//upReadCount() 끝
	
	public NoticeDTO getNotice(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		NoticeDTO ndto = null;
		
		try {
			con = getConnection();
			sql = "select * from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				ndto = new NoticeDTO();
				ndto.setNo(rs.getInt("no"));
				ndto.setSubject(rs.getString("subject"));
				ndto.setContent(rs.getString("content"));
				ndto.setReg_date(rs.getTimestamp("reg_date"));
				ndto.setRead_count(rs.getInt("read_count"));
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
		
		return ndto;
	}//getNotice() 끝
	
	public void deleteNotice(int no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		
		try {
			con = getConnection();
			
			sql = "select * from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "delete from notice where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate(); //DELETE
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
	}//deleteNotice() 끝
	
	//게시글 총 개수 구하기
	public int getCountNotice(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		int count = 0;
		try {
			con = getConnection();
			sql = "select count(*) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
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
		return count;
	}//getCountNotice() 끝
	
}//NoticeDAO 끝
