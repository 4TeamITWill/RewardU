package message.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.db.MemberBean;

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
				/*받는 사람입장에서는 message_receive에 DB작업되고 동시에 보낸 사람입장에서는 message_send에 DB작업함*/
				
				/*--------------------------message_receive에 INSERT작업--------------------------*/
				/*다음 작업은 접속한 사용자가 받은 메시지들의 번호 중 가장 큰 번호를 찾는 작업*/
				sql = "select max(no) from message_receive where fromID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mdto.getFromID());
				rs = pstmt.executeQuery();
				
				if(rs.next()){//메시지 존재하면 기존것의 +1
					maxNum=rs.getInt(1)+1;
				}else{//메시지 받은게 없으면 첫 번째 번호는 1로 설정
					maxNum=1;}  
				
				/*다음은 메시지 테이블에 DB작업*/
				sql = "insert into message_receive(no,toID,fromID,subject,content,reg_date,read_status) values(?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, maxNum); //위에서 해당 유저의 메시지함에서 가장 마지막번호+1 로 설정해둠
				pstmt.setString(2, mdto.getToID());
				pstmt.setString(3, mdto.getFromID());
				pstmt.setString(4, mdto.getSubject());
				pstmt.setString(5, mdto.getContent());
				pstmt.setTimestamp(6, mdto.getReg_date());
				pstmt.setInt(7, 0);
				
				result = pstmt.executeUpdate(); //작업이 정상적으로 완료되면 1을 반환하여 result에 1을 대입
				
				/*--------------------------message_send에 INSERT작업--------------------------*/	
				/*다음 작업은 접속한 사용자가 보낸 메시지들의 번호 중 가장 큰 번호를 찾는 작업*/
				sql = "select max(no) from message_send where toID=?";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mdto.getToID());
				rs = pstmt.executeQuery();
				 
				if(rs.next()){//메시지 존재하면 기존것의 +1
					maxNum=rs.getInt(1)+1;
				}else{//메시지 받은게 없으면 첫 번째 번호는 1로 설정
					maxNum=1;}  
				
				/*다음은 메시지 테이블에 DB작업*/
				sql = "insert into message_send(no,toID,fromID,subject,content,reg_date,read_status) values(?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, maxNum); //위에서 해당 유저의 메시지함에서 가장 마지막번호+1 로 설정해둠
				pstmt.setString(2, mdto.getToID());
				pstmt.setString(3, mdto.getFromID());
				pstmt.setString(4, mdto.getSubject());
				pstmt.setString(5, mdto.getContent());
				pstmt.setTimestamp(6, mdto.getReg_date());
				pstmt.setInt(7, 0);
				
				result = pstmt.executeUpdate(); //작업이 정상적으로 완료되면 1을 반환하여 result에 1을 대입
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
	
	//(받은, 보낸, 보관)메시지 목록list를 반환하는 메소드
	public ArrayList<MessageDTO> getMessageList(String id, int startRow, int pageSize, String divide){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<MessageDTO> messageList = new ArrayList<MessageDTO>();
		
		try {
			con = getConnection(); //DB연결
			if(divide.equals("receive")){
				//해당 ID가 받은 메시지를 모두 검색
				sql = "select * from message_receive where fromID=? order by no limit ?,?";	
			} else if(divide.equals("send")){
				//해당 ID가 보낸 메시지를 모두 검색
				sql = "select * from message_send where toID=? order by no limit ?,?";
			} else if(divide.equals("store")){
				//해당 ID가 보관한 메시지를 모두 검색
				sql = "select * from message_store where storeID=? order by no limit ?,?";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
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
	
	// (받은,보낸,보관)메시지 개수반환받는 메소드
	public int getCountMessage(String id, String divide){
		Connection con=null;
		String sql="";
		int count=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			if(divide.equals("receive")){
				//해당 ID가 받은 메시지가 총 몇개 있는가?
				sql = "select count(*) from message_receive where fromID=?";
			}else if(divide.equals("send")){
				//해당 ID가 보낸 메시지가 총 몇개 있는가?
				sql = "select count(*) from message_send where toID=?";
			}else if(divide.equals("store")){
				//해당 ID가 보관한 메시지가 총 몇개 있는가?
				sql = "select count(*) from message_store where storeID=?";
			}
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
	
	//체크된 메시지들을 한번에 보관할 때 사용하는 메소드
	public void storeMessageCheckbox(ArrayList<Integer> list, String id, String divide){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = null;
		int maxNum = 1;
		ArrayList<MessageDTO> dtoList = new ArrayList<MessageDTO>(); //체크한 메시지들을 담을 list
		
		try {
			con = getConnection();
			
			//체크한 메시지들을 다시 dtoList에 담는 과정
			for(int i=0; i<list.size(); i++){
				if(divide.equals("receive")){
					sql = "select * from message_receive where no=? and fromID=?";
				}else if(divide.equals("send")){
					sql = "select * from message_send where no=? and toID=?";
				}
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(i));
				pstmt.setString(2, id);
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
					mdto.setStoreID(id);
					dtoList.add(mdto);
				}
			}
			
			//message_store에 INSERT작업
			for(int i=0; i<list.size(); i++){
				//message_store에 최고 번호를 찾는 작업
				sql = "select max(no) from message_store where storeID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				//메시지 받은게 없으면 첫 번째 번호는 1로 설정 아니면 기존것의 +1
				if(rs.next()){
					maxNum=rs.getInt(1)+1;
				}else{
					maxNum=1;}  
				
				sql = "insert into message_store(no,toID,fromID,subject,content,reg_date,read_status,storeID)"
					+" values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, maxNum);
				pstmt.setString(2, dtoList.get(i).getToID());
				pstmt.setString(3, dtoList.get(i).getFromID());
				pstmt.setString(4, dtoList.get(i).getSubject());
				pstmt.setString(5, dtoList.get(i).getContent());
				pstmt.setTimestamp(6, dtoList.get(i).getReg_date());
				pstmt.setInt(7, dtoList.get(i).getRead_status());
				pstmt.setString(8, dtoList.get(i).getStoreID());
				pstmt.executeUpdate();
			}
			
			//체크한 메시지들 삭제하는 작업 (받은 or 보낸 메시지함에서 보관함으로 이동하면 받은 or 보낸 메시지함에서는 삭제되어야 하므로)
			for(int i=0; i<list.size(); i++){
				if(divide.equals("receive")){
					sql = "delete from message_receive where no=? and fromID=?";
				}else if(divide.equals("send")){
					sql = "delete from message_send where no=? and toID=?";
				}
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
				if (rs != null)rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}//storeMessageCheckbox()끝
	
	//메시지 내용에서 보관버튼 눌렀을시 기존 메시지는 삭제되면서 동시에 보관함에 등록하는 메소드
		public void storeMessageButton(int no, String id, String divide){
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			MessageDTO mdto = new MessageDTO();
			int maxNum = 1;
			
			try {
				con = getConnection();
				//구분값에 따라 메시지 검색
				if(divide.equals("receive")){
					sql = "select * from message_receive where no=? and fromID=?";
				} else if(divide.equals("send")){
					sql = "select * from message_send where no=? and toID=?";
				}
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, id);
				
				rs = pstmt.executeQuery(); //SELECT
				
				if(rs.next()){ //MessageDTO 객체에 검색한 값 저장
					mdto.setNo(rs.getInt("no"));
					mdto.setToID(rs.getString("toID"));
					mdto.setFromID(rs.getString("fromID"));
					mdto.setSubject(rs.getString("subject"));
					mdto.setContent(rs.getString("content"));
					mdto.setReg_date(rs.getTimestamp("reg_date"));
					mdto.setRead_status(rs.getInt("read_status"));
					mdto.setStoreID(id);
				}
				
				//message_store에 최고 번호를 찾는 작업
				sql = "select max(no) from message_store where storeID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				//메시지 받은게 없으면 첫 번째 번호는 1로 설정 아니면 기존것의 +1
				if(rs.next()){
					maxNum=rs.getInt(1)+1;
				}else{
					maxNum=1;} 
				
				//이후 INSERT 진행				
				sql = "insert into message_store(no,toID,fromID,subject,content,reg_date,read_status,storeID)"
					+" values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, maxNum);
				pstmt.setString(2, mdto.getToID());
				pstmt.setString(3, mdto.getFromID());
				pstmt.setString(4, mdto.getSubject());
				pstmt.setString(5, mdto.getContent());
				pstmt.setTimestamp(6, mdto.getReg_date());
				pstmt.setInt(7, mdto.getRead_status());
				pstmt.setString(8, mdto.getStoreID());
				
				pstmt.executeUpdate(); //INSERT
				
				//보관함에 메시지 INSERT하고 난 뒤에 해당 메시지 삭제
				deleteMessageButton(no, id, divide);
				
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
		}//storeMessageButton()끝
	
	//체크된 메시지들을 한번에 삭제할 때 사용하는 메소드
	public void deleteMessageCheckbox(ArrayList<Integer> list, String id, String divide){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = getConnection();
			for(int i=0; i<list.size(); i++){
				//구분값에 따라 삭제 쿼리문을 설정
				if(divide.equals("receive")){
					sql = "delete from message_receive where no=? and fromID=?";
				}else if(divide.equals("send")){
					sql = "delete from message_send where no=? and toID=?";
				}else if(divide.equals("store")){
					sql = "delete from message_store where no=? and storeID=?";
				}
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, list.get(i));
				pstmt.setString(2, id);
				
				pstmt.executeUpdate(); //DELETE
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
	
	//메시지 내용에서 삭제버튼 눌렀을시 삭제를 진행하는 메소드
	public void deleteMessageButton(int no, String id, String divide){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = getConnection();
				//구분값에 따라 삭제 쿼리문을 설정
				if(divide.equals("receive")){
					sql = "delete from message_receive where no=? and fromID=?";
				} else if(divide.equals("send")){
					sql = "delete from message_send where no=? and toID=?";
				}else if(divide.equals("store")){
					sql = "delete from message_store where no=? and storeID=?";
				}
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();//DELETE
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
	public MessageDTO getMessage(int no, String divide, String id){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			//구분값에 따라 검색 쿼리문을 설정
			if(divide.equals("receive")){
				sql = "select * from message_receive where no=? and fromID=?";
			}else if(divide.equals("send")){
				sql = "select * from message_send where no=? and toID=?";
			}else if(divide.equals("store")){
				sql = "select * from message_store where no=? and storeID=?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			//검색 값이 존재한다면
			if(rs.next()){
				MessageDTO mdto = new MessageDTO();
				mdto.setNo(rs.getInt("no"));
				mdto.setToID(rs.getString("toID"));
				mdto.setFromID(rs.getString("fromID"));
				mdto.setSubject(rs.getString("subject"));
				mdto.setContent(rs.getString("content"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				mdto.setRead_status(rs.getInt("read_status"));
				if(divide.equals("store")){mdto.setStoreID(rs.getString("storeID"));}
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
		return null; //검색 값 없으면 null반환
	}//getMessage()끝
	
	//read_status값을 1로 바꿔주어 읽은메시지로 처리하는 메소드
	public void updateReadStatus(int no){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con = getConnection();
			//해당 번호의 메시지의 read_status상태가 0인것이
			sql = "select * from message_receive where no=? and read_status=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			//존재한다면
			if(rs.next()){
				//그것의 read_status값을 1로 바꿔준다.
				sql = "update message_receive set read_status=1 where no=?";
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
	
	//받은 메시지 중 안 읽은 메시지가 몇 개인지 반환
	public int getCountDontRead(String id){
		Connection con=null;
		String sql="";
		int count=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
			//해당 ID가 받은 메시지 중 read_status==0 즉, 안 읽은 메시지가 몇개인가??
			sql = "select count(*) from message_receive where fromID=? and read_status=0";
			
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
	
	//사용자가 결제했을 때 결제되었다는 메시지를 보내는 메소드
	public void sendPayMessage(String user_id, String payContent){
		Connection con=null;
		String sql="";
		int maxNum=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = getConnection();
	
			/*받는 사람입장에서는 message_receive에 DB작업되고 동시에 보낸 사람입장에서는 message_send에 DB작업함*/
			
			/*--------------------------message_receive에 INSERT작업--------------------------*/
			/*다음 작업은 접속한 사용자가 받은 메시지들의 번호 중 가장 큰 번호를 찾는 작업*/
			sql = "select max(no) from message_receive where fromID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){//메시지 존재하면 기존것의 +1
				maxNum=rs.getInt(1)+1;
			}else{//메시지 받은게 없으면 첫 번째 번호는 1로 설정
				maxNum=1;}  
			
			/*다음은 메시지 테이블에 DB작업*/
			sql = "insert into message_receive(no,toID,fromID,subject,content,reg_date,read_status) values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, maxNum); //위에서 해당 유저의 메시지함에서 가장 마지막번호+1 로 설정해둠
			pstmt.setString(2, "rewardu4@gmail.com");
			pstmt.setString(3, user_id);
			pstmt.setString(4, "리워드 결제되었습니다.");
			pstmt.setString(5, payContent);
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, 0);
			
			pstmt.executeUpdate(); //작업이 정상적으로 완료되면 1을 반환하여 result에 1을 대입
			
			/*--------------------------message_send에 INSERT작업--------------------------*/	
			/*다음 작업은 접속한 사용자가 보낸 메시지들의 번호 중 가장 큰 번호를 찾는 작업*/
			sql = "select max(no) from message_send where toID=?";
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "rewardu4@gmail.com");
			rs = pstmt.executeQuery();
			 
			if(rs.next()){//메시지 존재하면 기존것의 +1
				maxNum=rs.getInt(1)+1;
			}else{//메시지 받은게 없으면 첫 번째 번호는 1로 설정
				maxNum=1;}  
			
			/*다음은 메시지 테이블에 DB작업*/
			sql = "insert into message_send(no,toID,fromID,subject,content,reg_date,read_status) values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, maxNum); //위에서 해당 유저의 메시지함에서 가장 마지막번호+1 로 설정해둠
			pstmt.setString(2, "rewardu4@gmail.com");
			pstmt.setString(3, user_id);
			pstmt.setString(4, "리워드 결제되었습니다.");
			pstmt.setString(5, payContent);
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, 0);
			
			pstmt.executeUpdate(); //작업이 정상적으로 완료되면 1을 반환하여 result에 1을 대입
			
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
		
	}//sendPayMessage 끝
	
	public ArrayList<MemberBean> getSearchMemberList(String search){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MemberBean> list = new ArrayList<MemberBean>();
		MemberBean mbean = null;
		try {
			con = getConnection();
			sql = "select * from user where user_id like ? order by user_id desc limit 0,7";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			
			if(!search.equals("")){
				while(rs.next()){
					mbean = new MemberBean();
					mbean.setUser_id(rs.getString("user_id"));
					mbean.setUser_name(rs.getString("user_name"));
					list.add(mbean);
				}
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
	}//searchMember 끝
	
}//MessageDAO()끝
