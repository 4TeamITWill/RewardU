package message.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MessageDAO {
	
	private Connection getConnection() throws Exception{

		Connection con=null;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con=ds.getConnection();
		return con;
	}

	//메시지보내는 작업을 하는 메소드 (DB TABLE에 저장하는 작업)
	public int sendMessage(MessageDTO mdto) {
		
		Connection con=null;
		String sql="";
		int result=0;
		int maxNum=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			//대상 id가 존재하는지 체크
			sql = "select * from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getFromID());
			rs = pstmt.executeQuery();
			//id가 존재한다면
			if(rs.next()){
				/*다음 작업은 접속한 사용자가 받은 메시지들의 번호 중 가장 큰 번호를 찾는 작업*/
				sql = "select max(no) from message where fromID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mdto.getFromID());
				rs = pstmt.executeQuery();
				//메시지 받은게 없으면 첫 번째 번호는 1로 설정 아니면 기존것의 +1
				if(rs.next()){
					maxNum=rs.getInt(1)+1;
				}else{
					maxNum=1;}  
				
				/*다음은 메시지 테이블에 DB작업*/
				sql = "insert into message(no,toID,fromID,subject,content,reg_date,read_status) values(?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, maxNum); //위에서 해당 유저의 메시지함에서 가장 마지막번호+1 로 설정해둠
				pstmt.setString(2, mdto.getToID());
				pstmt.setString(3, mdto.getFromID());
				pstmt.setString(4, mdto.getSubject());
				pstmt.setString(5, mdto.getContent());
				pstmt.setTimestamp(6, mdto.getReg_date());
				pstmt.setInt(7, 0);
				
				result = pstmt.executeUpdate(); //작업이 정상적으로 완료되면 1을 반환하여 result에 1을 대입
			} else {
				result = 0; //문제가 있을시 0 대입
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
		return result; //result 반환
	}//sendMessage()끝
	
	//사용자에게 온 메시지 목록list를 반환하는 메소드
	public ArrayList<MessageDTO> getMessageList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<MessageDTO> messageList = new ArrayList<MessageDTO>();
		
		try {
			con = getConnection(); //DB연결
			//해당 ID가 받은 메시지를 모두 검색
			sql = "select * from message where fromID=?";	
				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO mdto = new MessageDTO();
				mdto.setNo(rs.getInt("no"));
				mdto.setToID(rs.getString("toID"));
				mdto.setFromID(rs.getString("fromID"));
				mdto.setSubject(rs.getString("subject"));
				mdto.setContent(rs.getString("content"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				mdto.setRead_status(rs.getInt("read_status"));
				//ArrayList에 messageDTO객체 추가 
				messageList.add(mdto);				
			}//while	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return messageList; //해당ID가 받은 메시지목록을 담은 List리턴	
	} //getMessageList() 끝	
	
	//사용자에게 온 메시지 개수반환받는 메소드
	public int getCountMessage(String id){
		Connection con=null;
		String sql="";
		int count=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			//해당 ID가 받은 메시지가 총 몇개 있는가?
			sql = "select count(*) from message where fromID=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1); //count에 총 메시지 수 저장
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count; //총 메시지 수 반환
	}//getCountMessage()끝
	
	public void deleteMessageCheckbox(ArrayList<Integer> list, String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			con = getConnection();
			for(int i=0; i<list.size(); i++){
				sql = "delete from message where no=? and fromID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(i));
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}//deleteMessageCheckbox()끝
	
	public void deleteMessageButton(int no, String id){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = getConnection();
				sql = "delete from message where no=? and fromID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}//deleteMessageButton()끝
	
	//넘겨받은 번호에 해당하는 메시지 정보를 담은 DTO객체를 반환하는 메소드
	public MessageDTO getMessage(int no){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			sql = "select * from message where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				MessageDTO mdto = new MessageDTO();
				mdto.setNo(rs.getInt("no"));
				mdto.setToID(rs.getString("toID"));
				mdto.setFromID(rs.getString("fromID"));
				mdto.setSubject(rs.getString("subject"));
				mdto.setContent(rs.getString("content"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				mdto.setRead_status(rs.getInt("read_status"));
				return mdto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}//getMessage()끝
	
	//read_status값을 1로 바꿔주어 읽은메시지로 처리
	public void updateReadStatus(int no){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con = getConnection();
			//해당 번호의 메시지의 read_status상태가 0인것이
			sql = "select * from message where no=? and read_status=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			//존재한다면
			if(rs.next()){
				//그것의 read_status값을 1로 바꿔준다.
				sql = "update message set read_status=1 where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//updateReadStatus()끝
	
	//받은 메시지 중 안읽은 메시지가 몇 개인지 반환
	public int getCountDontRead(String id){
		Connection con=null;
		String sql="";
		int count=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			//해당 ID가 받은 메시지 중 read_status==0 즉, 안 읽은 메시지가 몇개인가??
			sql = "select count(*) from message where fromID=? and read_status=0";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1); //count에 안 읽은 메시지 수 저장
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)con.close();
				if (pstmt != null)pstmt.close();
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count; //안읽은 메시지 수 반환
	}//getCountDontRead()끝
	
}//MessageDAO()끝
