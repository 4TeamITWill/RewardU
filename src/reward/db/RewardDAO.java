package reward.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;



public class RewardDAO {

	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init = new InitialContext(); //다형성으로 부모로 부터 자식클래스 컨트롤
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	}
	
	
	
/*	public boolean insert(BoardBean bb, SellerBean sb){
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		//db작업 성공여부 저장
		int result = 0;
		
		try {
			
			con = getConnection();
			
			sql = "insert into Board(user_id, pd_subject, pd_content, pd_goalMoney, pd_category, pd_start,"
					+ "pd_end, pd_file, pd_realfile, pd_opprice1, pd_opcontent1, pd_opprice2, pd_opcontent2, pd_opprice3, pd_opcontent3, "
					+ "pd_opsubject1, pd_opsubject2, pd_opsubject3)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			//pstmt.setInt(1, bb.getPd_no());
			pstmt.setString(1, bb.getUser_id());
			pstmt.setString(2, bb.getPd_subject());
			pstmt.setString(3, bb.getPd_content());
			pstmt.setString(4, bb.getPd_goalMoney());
			pstmt.setString(5, bb.getPd_category());
			pstmt.setTimestamp(6, bb.getPd_start()); //관리자 페이지에 글 올라가는 시간. 승인될때 업데이트.
			pstmt.setString(7, bb.getPd_end());
			pstmt.setString(8, bb.getPd_file());
			pstmt.setString(9, bb.getPd_realFile());
			pstmt.setString(10, bb.getPd_opprice1());//옵션가격
			pstmt.setString(11, bb.getPd_opcontent1());//옵션내용
			pstmt.setString(12, bb.getPd_opprice2());
			pstmt.setString(13, bb.getPd_opcontent2());
			pstmt.setString(14, bb.getPd_opprice3());
			pstmt.setString(15, bb.getPd_opcontent3());
			pstmt.setString(16, bb.getPd_opsubject1());//옵션제목추가
			pstmt.setString(17, bb.getPd_opsubject2());
			pstmt.setString(18, bb.getPd_opsubject3());
			
			pstmt.executeUpdate();
			
			
			sql = "insert into seller(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAccount, seller_date)"
					+ " values(?, ?, ?, ?, ?, ?, ?, now())";
			//seller_date는 판매자의 첫 게시물이 등록(관리자가 승인)되는 날짜로 들어가기때문에 
			// 여기 insert()에서는 now로 하였음..
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bb.getUser_id());
			//pstmt.setInt(2, bb.getPd_no());
			pstmt.setString(2, sb.getCompany_no());
			pstmt.setString(3, sb.getCompany());
			pstmt.setString(4, sb.getCompany_addr());
			pstmt.setString(5, sb.getCompany_tell());
			pstmt.setString(6, sb.getCompany_fax());
			pstmt.setString(7, sb.getSellerAccount());
			
			result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
			
			if(result != 0) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//예외처리와 상관없이 자원해제
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} //finally 끝
		
		return false;
	}*/

	//필요없음
	/*public boolean SaveInsert(SaveBoard saveB, SaveSeller saveS) {
		

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		//db작업 성공여부 저장
		int result = 0;
		
		try {
			
			con = getConnection();
			//
			sql = "insert into SaveBoard(user_id, pd_subject, pd_content, pd_goalMoney, pd_category, "
					+ "pd_end, pd_file, pd_realFile, pd_opprice1, pd_opcontent1, pd_opprice2, pd_opcontent2, pd_opprice3, pd_opcontent3)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			//pstmt.setInt(1, bb.getPd_no());
			pstmt.setString(1, saveB.getUser_id());
			pstmt.setString(2, saveB.getPd_subject());
			pstmt.setString(3, saveB.getPd_content());
			pstmt.setString(4, saveB.getPd_goalMoney());
			pstmt.setString(5, saveB.getPd_category());
			pstmt.setString(6, saveB.getPd_end());
			pstmt.setString(7, saveB.getPd_file());
			pstmt.setString(8, saveB.getPd_realFile());
			pstmt.setString(9, saveB.getPd_opprice1());
			pstmt.setString(10, saveB.getPd_opcontent1());
			pstmt.setString(11, saveB.getPd_opprice2());
			pstmt.setString(12, saveB.getPd_opcontent2());
			pstmt.setString(13, saveB.getPd_opprice3());
			pstmt.setString(14, saveB.getPd_opcontent3());
			
			pstmt.executeUpdate();
			
			
			sql = "insert into SaveSeller(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAccount, seller_date)"
					+ " values(?, ?, ?, ?, ?, ?, ?, now())";
			//seller_date는 판매자의 첫 게시물이 등록(관리자가 승인)되는 날짜로 들어가기때문에 
			// 여기 insert()에서는 now로 하였음..
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, saveB.getUser_id());
			//pstmt.setInt(2, saveB.getPd_no());
			pstmt.setString(2, saveS.getCompany_no());
			pstmt.setString(3, saveS.getCompany());
			pstmt.setString(4, saveS.getCompany_addr());
			pstmt.setString(5, saveS.getCompany_tell());
			pstmt.setString(6, saveS.getCompany_fax());
			pstmt.setString(7, saveS.getSellerAccount());
			
			result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
			
			if(result != 0) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//예외처리와 상관없이 자원해제
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} //finally 끝
		
		return false;
	}*/
	
	//저장한 리워드 리스트 select
	public Vector<RewardBean> getSaveList(String user_id, int startRow, int pageSize){
	

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Vector<RewardBean> v = new Vector<RewardBean>();
		
		RewardBean bean = null;
		
		
	
	try {
		//db연결
		con= getConnection();
		
		sql = "select pd_no, user_id, pd_subject, pd_realFile from saveall where user_id=? order by pd_no desc limit ?,?";
				
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, user_id); //user_id 가져오기..
		pstmt.setInt(2, startRow-1); //페이징
		pstmt.setInt(3, pageSize);	//페이징
	
		rs = pstmt.executeQuery();
		
		//리스트는 전부 널 허용인 RewardBean에서  이미지, 제목, 상세설명만 꺼내오기때문에
		while (rs.next()){ //
			bean = new RewardBean();
			bean.setPd_no(rs.getInt("pd_no"));
			bean.setUser_id(rs.getString("user_id"));
			bean.setPd_subject(rs.getString("pd_subject"));
			bean.setPd_realFile(rs.getString("pd_realFile"));
			
			
			v.add(bean); //백터에 담기

		} //while문 끝
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
			if(rs != null) rs.close();				
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return v; //saveBoard객체들을 저장하고 있는 백터 자체를 리턴
}

	
	/*//수정할 보드정보를 DB로 부터 select.....
		public RewardBean getSaveBoard(int pd_no) {
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				
				RewardBean saveB = new RewardBean();
				
			try {
				 con = getConnection();//DB연결
				 
				 String sql = "select * from saveall where pd_no=?";
				 
				
				 pstmt = con.prepareStatement(sql);
				 
				 pstmt.setInt(1, pd_no);
				 
				 
				 rs = pstmt.executeQuery();
				
				 if (rs.next()) {
					
					 //saveBoard객체에 넣기
					 saveB.setPd_no(rs.getInt("pd_no"));
					 saveB.setPd_subject(rs.getString("pd_subject"));
					 saveB.setPd_content(rs.getString("pd_content"));
					 saveB.setPd_goalMoney(rs.getString("pd_goalMoney"));
					 saveB.setPd_category(rs.getString("pd_category"));
					 saveB.setPd_file(rs.getString("pd_file"));
					 saveB.setPd_realFile(rs.getString("pd_realFile"));
					 saveB.setPd_end(rs.getString("pd_end"));
					 
					 //리워드
					 saveB.setPd_opprice1(rs.getString("pd_opprice1"));
					 saveB.setPd_opcontent1(rs.getString("pd_opcontent1"));
					 saveB.setPd_opprice2(rs.getString("pd_opprice2"));
					 saveB.setPd_opcontent2(rs.getString("pd_opcontent2"));
					 saveB.setPd_opprice3(rs.getString("pd_opprice3"));
					 saveB.setPd_opcontent3(rs.getString("pd_opcontent3"));
					 saveB.setPd_opsubject1(rs.getString("pd_opsubject1"));
					 saveB.setPd_opsubject2(rs.getString("pd_opsubject2"));
					 saveB.setPd_opsubject3(rs.getString("pd_opsubject3"));
					
				}
				
			} catch (Exception e) {
				System.out.println("getSaveBoard()메소드에서 오류");
			}	finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();				
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return saveB;
			
			}
			
			//수정할 판매자정보를 DB로 부터 select..
			public RewardBean getSaveSeller(int pd_no) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				
				RewardBean saveS = new RewardBean();
				
			try {
				 con = getConnection();//DB연결
				 
				 String sql = "select * from saveall where pd_no=?";
				 
				
				 pstmt = con.prepareStatement(sql);
				 
				 pstmt.setInt(1, pd_no);
				 
				 rs = pstmt.executeQuery();
				
				 if (rs.next()) {
					
					 saveS.setPd_no(rs.getInt("pd_no"));
					 saveS.setCompany(rs.getString("company"));
					 saveS.setCompany_no(rs.getString("company_no"));
					 saveS.setCompany_tell(rs.getString("company_tell"));
					 saveS.setCompany_fax(rs.getString("company_fax"));
					 saveS.setCompany_addr(rs.getString("company_addr"));
					 saveS.setSellerAccount(rs.getString("sellerAccount"));
					
				}
				
			} catch (Exception e) {
				System.out.println("getSaveSeller()메소드에서 오류");
			}	finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();				
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
				return saveS;
			}

			
*/
			/*//글 수정하는 메소드 -> 관리자에게 가는게 아니라 save테이블의 글update
			public boolean RewardingSaveUpdate(SaveBoard saveB, SaveSeller saveS) {
				
				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				//db작업 성공여부 저장
				int result = 0;
				
				try {
					
					con = getConnection();
					
					sql = "update SaveBoard set pd_subject=?, pd_content=?, pd_goalMoney=?, pd_category=?,"
							+ "pd_end=?, pd_file=?, pd_realfile=?, pd_opprice1=?, pd_opcontent1=?, pd_opprice2=?, pd_opcontent2=?, pd_opprice3=?, pd_opcontent3=?"
							+ "where user_id=? and pd_no=?"
							;
					
					pstmt = con.prepareStatement(sql);
					
				
					pstmt.setString(1, saveB.getPd_subject());
					pstmt.setString(2, saveB.getPd_content());
					pstmt.setString(3, saveB.getPd_goalMoney());
					pstmt.setString(4, saveB.getPd_category());
					pstmt.setString(5, saveB.getPd_end());
					pstmt.setString(6, saveB.getPd_file());
					pstmt.setString(7, saveB.getPd_realFile());
					pstmt.setString(8, saveB.getPd_opprice1());
					pstmt.setString(9, saveB.getPd_opcontent1());
					pstmt.setString(10, saveB.getPd_opprice2());
					pstmt.setString(11, saveB.getPd_opcontent2());
					pstmt.setString(12, saveB.getPd_opprice3());
					pstmt.setString(13, saveB.getPd_opcontent3());
					pstmt.setString(14, saveB.getUser_id());
					pstmt.setInt(15, saveB.getPd_no());
					
					pstmt.executeUpdate();
					
					
					sql = "update SaveSeller set company_no=?, company=?, company_addr=?, company_tell=?, company_fax=?, sellerAccount=? where user_id=? and pd_no=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, saveS.getCompany_no());
					pstmt.setString(2, saveS.getCompany());
					pstmt.setString(3, saveS.getCompany_addr());
					pstmt.setString(4, saveS.getCompany_tell());
					pstmt.setString(5, saveS.getCompany_fax());
					pstmt.setString(6, saveS.getSellerAccount());
					pstmt.setString(7, saveB.getUser_id());
					pstmt.setInt(8, saveB.getPd_no());
					
					result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
					
					if(result != 0) {
						return true;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					//예외처리와 상관없이 자원해제
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				} //finally 끝
				
				return false;
			}
*/
			/*//글쓰기 저장만 리스트 삭제하기.. 
			public int RewardingSaveDel(int pd_no) {
				
				int result = 0;
				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				try {
					
					con = getConnection();
					
					sql = "delete from saveall where pd_no=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, pd_no);
					
					result = pstmt.executeUpdate(); //delete

					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					//예외처리와 상관없이 자원해제
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}//finally
				
				return result;
			}
			*/
		//검색어를 전달받아 검색어에 해당하는 글개수를 DB로부터 가져와서 글개수 리턴 하는 메소드
		public int getSearchCount(String keyWord) {

			int count = 0;

			Connection con = null;

			String sql = "";

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			try{
	
				 //DB연결
	
				con = getConnection();
	
				//select구문 작성
	
				//검색어에 해당하는 게시판 글개수 가져오기 count(*)
	
				 sql = "select count(*) from board join seller on board.pd_no=seller.pd_no "
						+ "where pd_permit=1 and pd_subject like ?";
	
				 pstmt = con.prepareStatement(sql);
	
				pstmt.setString(1, "%" + keyWord + "%");
	
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					count = rs.getInt(1);
				}
			}catch(Exception err){
				err.printStackTrace();
			}finally {
			//자원해제 
				try {
	
				 if(rs != null) rs.close();
	
				if(pstmt != null) pstmt.close();
	
				if(con != null) con.close();
				} catch (SQLException e) 
					{e.printStackTrace();}
				}return count;
			
		}//getSearchCount끝	
			
			
			//관리자가 승인한(permit--> 1)인 게시물중 검색
			public Vector<RewardBean> getSearchList(String keyWord, int startRow, int pageSize) {

			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Vector<RewardBean> v = new Vector <RewardBean>();
			RewardBean dto = null;

			try {
				//db연결
				con= getConnection();
	
					sql = "select * from board join seller on board.pd_no=seller.pd_no "
					+ "where pd_permit=1 and pd_subject like '%" + keyWord + "%' order by pd_end-pd_start asc limit ?,?";

					//??를제외한  select구문을 담은 PreparedStatement객체 얻기 pstmt = con.prepareStatement(sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				//PreparedStatement객체를 이용해 Select실행후 그결과를 ResultSet객체에 담아서 얻기rs = pstmt.executeQuery();
				rs = pstmt.executeQuery();
				// ResultSet객체에 테이블 형식으로 저장된 검색한 글정보들을 반복하여 뽑아내서
				// BoardDto객체의 각각의 변수에 저장, 그리고 각각의 BoardDto객체들을 하나씪 백터에 추가 

			while(rs.next()){
				dto = new RewardBean();
	
				dto.setPd_no(Integer.parseInt(rs.getString("pd_no")));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPd_subject(rs.getString("pd_subject"));
				dto.setPd_category(rs.getString("pd_category"));
				dto.setPd_start(rs.getTimestamp("pd_start"));
				dto.setPd_end(rs.getString("pd_end"));
				dto.setPd_good(rs.getInt("pd_good"));
				dto.setPd_count(rs.getInt("pd_count"));
				dto.setPd_file(rs.getString("pd_file"));
				dto.setPd_realFile(rs.getString("pd_realFile"));
				dto.setPd_goalMoney(rs.getString("Pd_goalMoney"));
				dto.setPd_curMoney(rs.getString("pd_curMoney"));
				dto.setPd_participant(rs.getInt("pd_participant"));
				dto.setPd_result(rs.getInt("pd_result"));
				dto.setPd_permit(rs.getInt("pd_permit"));
				dto.setPd_content(rs.getString("pd_content"));
				dto.setPd_opcontent1(rs.getString("pd_opcontent1")); 
				dto.setPd_opcontent2(rs.getString("pd_opcontent2")); 
				dto.setPd_opcontent3(rs.getString("pd_opcontent3")); 
				dto.setPd_opprice1(rs.getString("pd_opprice1")); 
				dto.setPd_opprice2(rs.getString("pd_opprice2"));
				dto.setPd_opprice3(rs.getString("pd_opprice3"));
				dto.setPd_opsubject1(rs.getString("pd_opsubject1"));
				dto.setPd_opsubject2(rs.getString("pd_opsubject2"));
				dto.setPd_opsubject3(rs.getString("pd_opsubject3"));
				dto.setPd_rate(rs.getDouble("pd_rate"));
				dto.setPd_rateCount(rs.getInt("pd_rateCount"));
				dto.setCompany(rs.getString("company"));
				 //백터에 BoardDto객체 추가 
				 v.add(dto);
			 }//while반복문 끝
			 } catch (Exception e) {
				 System.out.println("getSearchList()메소드에서 오류 : " + e);
			  } finally {
				 try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
					 if(rs != null) rs.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			 }//finally 끝

			 return v; //DB로부터 검색하여 가져온 전체글 들(Board객체들)을 백터에 담아 백터 자체를 리턴
	
			}//getSearchList끝	
			
			
			
			
			
	//----------------------------------양식 3파트로 쪼갠거 메소드!!		
			
			
	//신청 양식의 세 파트 중..어느 파트에서든지 처음 '저장하기' 버튼을 눌렀을 때(session에 pd_no값이 없을때) -----> insert
			
	//이후 작성한 파트를 수정하여 '저장하기'버튼을 눌렀을때(session에 pd_no값이 있을때) ------>update											   			
	
			
	//리워드정보 작성하는 페이지에서
			
	//'저장하기'를 누를 경우 ---> pd_no값을 찾아 정보가 update되고		
			
	//'신청하기'를 누를 경우 (session에 pd_no값이 없으면  신청하기 버튼은 보이지 않음)
	//		1. 저장하기 버튼을 누르지 않고 바로 신청하기를 해도 pd_no의 리워드정보가 update
	//		2. 그 pd_no의 모든 Save정보를 다 가져와서
	//		3. 진짜 seller, board 테이블에 저장되고
	//		4. 저장되었던 정보들은 삭제된다.		
			
		//판매자 정보만 ...임시저장	
		public boolean insertSaveSeller(RewardBean all, String user_id) {

				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				int result = 0;
				
				try {
					
					con = getConnection();
					
					sql = "insert into SaveAll(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAccount, seller_date)"
							+ " values(?, ?, ?, ?, ?, ?, ?, now())";

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, user_id);//insert는 처음 저장되는 정보이므로 user_id도 함께 인자로 받아와서 DB에 넣어주었다.	
					//pstmt.setInt(2, saveB.getPd_no());//자동생성
					pstmt.setString(2, all.getCompany_no());
					pstmt.setString(3, all.getCompany());
					pstmt.setString(4, all.getCompany_addr());
					pstmt.setString(5, all.getCompany_tell());
					pstmt.setString(6, all.getCompany_fax());
					pstmt.setString(7, all.getSellerAccount());
					
					result = pstmt.executeUpdate();
					
					if(result != 0) {
						return true;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					//예외처리와 상관없이 자원해제
					try {
						 if(pstmt != null) pstmt.close();
						 if(con != null) con.close();
					 } catch (SQLException e) {
						 e.printStackTrace();
					 } //finally 끝
				}
				return false;
			}
		
		//리워드를 제외한 프로젝트 정보만 ...임시저장
		public boolean insertSaveBoard(RewardBean all, String user_id) {
			

			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			
			//db작업 성공여부 저장
			int result = 0;
			
			try {
				
				con = getConnection();
				//
				sql = "insert into Saveall(user_id, pd_subject, pd_content, pd_goalMoney, pd_category, "
						+ "pd_end, pd_file, pd_realFile)"
						+ " values(?, ?, ?, ?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				
				//pstmt.setInt(1, bb.getPd_no());//자동생성
				pstmt.setString(1, all.getUser_id());//insert는 처음 저장되는 정보이므로 user_id도 함께 인자로 받아와서 DB에 넣어주었다.	
				pstmt.setString(2, all.getPd_subject());
				pstmt.setString(3, all.getPd_content());
				pstmt.setString(4, all.getPd_goalMoney());
				pstmt.setString(5, all.getPd_category());
				pstmt.setString(6, all.getPd_end());
				pstmt.setString(7, all.getPd_file());
				pstmt.setString(8, all.getPd_realFile());
				
				result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
				
				if(result != 0) {
					return true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외처리와 상관없이 자원해제
				try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			} //finally 끝
			
			return false;
		}
			
		//리워드 정보만... 임시저장
		public boolean insertSaveReward(RewardBean all, String user_id) {
			

			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				con = getConnection();
				//
				sql = "insert into SaveAll(user_id, pd_opprice1, pd_opcontent1, pd_opprice2, pd_opcontent2, pd_opprice3, pd_opcontent3, "
						+ "pd_opsubject1, pd_opsubject2, pd_opsubject3)"
						+ " values(?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				//pstmt.setInt(1, bb.getPd_no());
				pstmt.setString(1, user_id);//insert는 처음 저장되는 정보이므로 user_id도 함께 인자로 받아와서 DB에 넣어주었다.	
				pstmt.setString(2, all.getPd_opprice1());
				pstmt.setString(3, all.getPd_opcontent1());
				pstmt.setString(4, all.getPd_opprice2());
				pstmt.setString(5, all.getPd_opcontent2());
				pstmt.setString(6, all.getPd_opprice3());
				pstmt.setString(7, all.getPd_opcontent3());
				pstmt.setString(8, all.getPd_opsubject1());
				pstmt.setString(9, all.getPd_opsubject2());
				pstmt.setString(10, all.getPd_opsubject3());
				
				result = pstmt.executeUpdate();
				
				if(result != 0) {
					return true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외처리와 상관없이 자원해제
				try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			} //finally 끝
			
			return false;
		}
		
		/*
		//수정할 정보를 DB로 부터 select..
		public RewardBean getSaveSellerTab(int pd_no) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				RewardBean all = new RewardBean();
				
			try {
				 con = getConnection();
				 
				 String sql = "select * from saveAll where pd_no=?";
				
				 pstmt = con.prepareStatement(sql);
				 
				 pstmt.setInt(1, pd_no);
				 
				 rs = pstmt.executeQuery();
				
				 if (rs.next()) {
					
					 //all.setPd_no(pd_no);
					 all.setCompany(rs.getString("company"));
					 all.setCompany_no(rs.getString("company_no"));
					 all.setCompany_tell(rs.getString("company_tell"));
					 all.setCompany_fax(rs.getString("company_fax"));
					 all.setCompany_addr(rs.getString("company_addr"));
					 all.setSellerAccount(rs.getString("sellerAccount"));
					
					 all.setPd_subject(rs.getString("pd_subject"));
					 all.setPd_content(rs.getString("pd_content"));
					 all.setPd_goalMoney(rs.getString("pd_goalMoney"));
					 all.setPd_category(rs.getString("pd_category"));
					 all.setPd_file(rs.getString("pd_file"));
					 all.setPd_realFile(rs.getString("pd_realFile"));
					 all.setPd_end(rs.getString("pd_end"));
					 
					 all.setPd_opprice1(rs.getString("pd_opprice1"));
					 all.setPd_opcontent1(rs.getString("pd_opcontent1"));
					 all.setPd_opcontent1(rs.getString("pd_opsubject1"));
					 all.setPd_opprice2(rs.getString("pd_opprice2"));
					 all.setPd_opcontent2(rs.getString("pd_opcontent2"));
					 all.setPd_opcontent1(rs.getString("pd_opsubject2"));
					 all.setPd_opprice3(rs.getString("pd_opprice3"));
					 all.setPd_opcontent3(rs.getString("pd_opcontent3"));
					 all.setPd_opcontent1(rs.getString("pd_opsubject3"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}	finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();				
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				return all;
			}
		*/
		//임시저장했던 프로젝트정보 불러오기
		/*public RewardBean getSaveBoardTab(int pd_no) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			RewardBean all = new RewardBean();
			
		try {
			 con = getConnection();//DB연결
			 
			 String sql = "select * from saveAll where pd_no=?";
			 
			
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setInt(1, pd_no);
			 
			 rs = pstmt.executeQuery();
			
			 if (rs.next()) {
				
				 //saveBoard객체에 넣기
				 //all.setPd_no(pd_no);
				 all.setPd_subject(rs.getString("pd_subject"));
				 all.setPd_content(rs.getString("pd_content"));
				 all.setPd_goalMoney(rs.getString("pd_goalMoney"));
				 all.setPd_category(rs.getString("pd_category"));
				 all.setPd_file(rs.getString("pd_file"));
				 all.setPd_realFile(rs.getString("pd_realFile"));
				 all.setPd_end(rs.getString("pd_end"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				if(rs != null) rs.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return all;
		
		}
		*/
		//수정할 reward정보 가져오기
			
		/*public SaveBoard getSaveRewardTab(int pd_no) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			SaveBoard saveB = new SaveBoard();
			
		try {
			 con = getConnection();//DB연결
			 
			 String sql = "select * from saveBoard where pd_no=?";
			 
			
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setInt(1, pd_no);
			 
			 
			 rs = pstmt.executeQuery();
			
			 if (rs.next()) {
				
				 saveB.setPd_opprice1(rs.getString("pd_opprice1"));
				 saveB.setPd_opcontent1(rs.getString("pd_opcontent1"));
				 saveB.setPd_opprice2(rs.getString("pd_opprice2"));
				 saveB.setPd_opcontent2(rs.getString("pd_opcontent2"));
				 saveB.setPd_opprice3(rs.getString("pd_opprice3"));
				 saveB.setPd_opcontent3(rs.getString("pd_opcontent3"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				if(rs != null) rs.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return saveB;
		
		}
*/
		
		
		
		//임시저장했던 판매자정보 update
		public boolean updateSaveSeller(RewardBean all, int pd_no) {
			
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			
			//db작업 성공여부 저장
			int result = 0;
			
			try {
				
				con = getConnection();
				
				sql = "update saveall set company_no=?, company=?, company_addr=?, company_tell=?, company_fax=?, sellerAccount=? where pd_no=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, all.getCompany_no());
				pstmt.setString(2, all.getCompany());
				pstmt.setString(3, all.getCompany_addr());
				pstmt.setString(4, all.getCompany_tell());
				pstmt.setString(5, all.getCompany_fax());
				pstmt.setString(6, all.getSellerAccount());
				pstmt.setInt(7, pd_no);
				
				result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
				
				if(result != 0) {
					return true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외처리와 상관없이 자원해제
				try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			} //finally 끝
			
			return false;
		}	
		
		//임시저장했던 프로젝트 정보 ...update
		public boolean updateSaveBoard(RewardBean all, int pd_no) {
			
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			
			//db작업 성공여부 저장
			int result = 0;
			
			try {
				
				con = getConnection();
				
				sql = "update SaveAll set pd_subject=?, pd_content=?, pd_goalMoney=?, pd_category=?,"
						+ "pd_end=?, pd_file=?, pd_realFile=? where pd_no=?";
				
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, all.getPd_subject());
				pstmt.setString(2, all.getPd_content());
				pstmt.setString(3, all.getPd_goalMoney());
				pstmt.setString(4, all.getPd_category());
				//pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
				pstmt.setString(5, all.getPd_end());
				pstmt.setString(6, all.getPd_file());
				pstmt.setString(7, all.getPd_realFile());
				pstmt.setInt(8, pd_no);
				
				result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
				
				if(result != 0) {
					return true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외처리와 상관없이 자원해제
				try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			} //finally 끝
			
			return false;
		}
		
		//임시저장했던 리워드정보 ... update
		public boolean updateSaveReward(RewardBean all, int pd_no) {
			
			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			
			//db작업 성공여부 저장
			int result = 0;
			
			try {
				
				con = getConnection();
				
				sql = "update SaveAll set pd_opprice1=?, pd_opcontent1=?, pd_opprice2=?, pd_opcontent2=?, pd_opprice3=?, pd_opcontent3=?,"
						+ "pd_opsubject1=?, pd_opsubject2=?, pd_opsubject3=? "
						+ "where pd_no=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, all.getPd_opprice1());
				pstmt.setString(2, all.getPd_opcontent1());
				pstmt.setString(3, all.getPd_opprice2());
				pstmt.setString(4, all.getPd_opcontent2());
				pstmt.setString(5, all.getPd_opprice3());
				pstmt.setString(6, all.getPd_opcontent3());
				pstmt.setString(7, all.getPd_opsubject1());
				pstmt.setString(8, all.getPd_opsubject2());
				pstmt.setString(9, all.getPd_opsubject3());
				pstmt.setInt(10, pd_no);
				
				result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
				
				if(result != 0) {
					return true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//예외처리와 상관없이 자원해제
				try {
					 if(pstmt != null) pstmt.close();
					 if(con != null) con.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
				 }
			} //finally 끝
			
			return false;
		}

		//---------임시저장된거 불러오기
		//아이디 중 가장 큰 넘버 가져오기
		public int getMax_no(String user_id) {
			
			int no = 0;

			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{
				 //DB연결
				con = getConnection();
				//select구문 작성
				//방금 저장한 글의 넘버 가져오기.. 방금 저장했으므로 가장 큰 no 가져오기!
				 sql = "select pd_no from saveAll where user_id=? and pd_no in (select max(pd_no) from saveAll group by user_id); ";
	
				 pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, user_id);
				 rs = pstmt.executeQuery();
	
					if(rs.next()){
						no = rs.getInt(1);
					}
				}catch(Exception err){
					err.printStackTrace();
				}finally {
			//자원해제 
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					} catch (SQLException e) {
						e.printStackTrace();
						}
					}
			System.out.println("getMax메소드user_id"+user_id);
			System.out.println(no);
			return no;
		}
		
		
			/*public int getPd_no(String user_id) {
			
			int no = 0;

			Connection con = null;
			String sql = "";
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{
				 //DB연결
				con = getConnection();
				//select구문 작성
				//방금 저장한 글의 넘버 가져오기.. 방금 저장했으므로 가장 큰 no 가져오기!
				 sql = "select pd_no from saveAll where user_id=? and pd_no in (select max(pd_no) from saveAll group by user_id); ";
	
				 pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, user_id);
				 rs = pstmt.executeQuery();
	
					if(rs.next()){
						no = rs.getInt(1);
					}
				}catch(Exception err){
					err.printStackTrace();
				}finally {
			//자원해제 
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					} catch (SQLException e) {
						e.printStackTrace();
						}
					}
			
			return no;
		}*/

			//해당 아이디의 모든정보 가져오기
			public RewardBean getSaveAll(int pd_no) {
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				RewardBean all = new RewardBean();
				
			try {
				 con = getConnection();//DB연결
				 
				 String sql = "select * from saveAll where pd_no=?";
				 
				 pstmt = con.prepareStatement(sql);
				 
				 pstmt.setInt(1, pd_no);
				 
				 rs = pstmt.executeQuery();
				
				 if (rs.next()) {
					 
					 //판매자정보
					 all.setPd_no(rs.getInt("pd_no"));
					 all.setCompany(rs.getString("company"));
					 all.setCompany_no(rs.getString("company_no"));
					 all.setCompany_tell(rs.getString("company_tell"));
					 all.setCompany_fax(rs.getString("company_fax"));
					 all.setCompany_addr(rs.getString("company_addr"));
					 all.setSellerAccount(rs.getString("sellerAccount"));
					
					 //프로젝트 정보
					 all.setUser_id(rs.getString("user_id"));
					 all.setPd_subject(rs.getString("pd_subject"));
					 all.setPd_content(rs.getString("pd_content"));
					 all.setPd_goalMoney(rs.getString("pd_goalMoney"));
					 all.setPd_category(rs.getString("pd_category"));
					 all.setPd_file(rs.getString("pd_file"));
					 all.setPd_realFile(rs.getString("pd_realFile"));
					 all.setPd_end(rs.getString("pd_end"));
					 
					 //리워드
					 all.setPd_opprice1(rs.getString("pd_opprice1"));
					 all.setPd_opcontent1(rs.getString("pd_opcontent1"));
					 all.setPd_opprice2(rs.getString("pd_opprice2"));
					 all.setPd_opcontent2(rs.getString("pd_opcontent2"));
					 all.setPd_opprice3(rs.getString("pd_opprice3"));
					 all.setPd_opcontent3(rs.getString("pd_opcontent3"));
					 
					 all.setPd_opsubject1(rs.getString("pd_opsubject1"));
					 all.setPd_opsubject2(rs.getString("pd_opsubject2"));
					 all.setPd_opsubject3(rs.getString("pd_opsubject3"));
					
				}
				
			} catch (Exception e) {
				System.out.println("getSaveAll()메소드에서 오류"+e);
			}	finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();				
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return all;
		
			}
			
			
			public boolean insert2(RewardBean all){
				
				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				//db작업 성공여부 저장
				int result = 0;
				
				try {
					
					con = getConnection();
					
					sql = "insert into Board(user_id, pd_subject, pd_content, pd_goalMoney, pd_category, pd_start,"
							+ "pd_end, pd_file, pd_realfile, pd_opprice1, pd_opcontent1, pd_opprice2, pd_opcontent2, pd_opprice3, pd_opcontent3,"
							+ "pd_opsubject1, pd_opsubject2, pd_opsubject3)"
							+ " values(?, ?, ?, ?, ?, now(), ?, ?,?,?,?,?,?,?,?,?,?,?)";
					
					pstmt = con.prepareStatement(sql);
					
					//pstmt.setInt(1, bb.getPd_no());
					pstmt.setString(1, all.getUser_id());
					pstmt.setString(2, all.getPd_subject());
					pstmt.setString(3, all.getPd_content());
					pstmt.setString(4, all.getPd_goalMoney());
					pstmt.setString(5, all.getPd_category());
					//pstmt.setTimestamp(6, all.getPd_start()); //관리자 페이지에 글 올라가는 시간. 승인될때 업데이트.
					pstmt.setString(6, all.getPd_end());
					pstmt.setString(7, all.getPd_file());
					pstmt.setString(8, all.getPd_realFile());
					pstmt.setString(9, all.getPd_opprice1());
					pstmt.setString(10, all.getPd_opcontent1());
					pstmt.setString(11, all.getPd_opprice2());
					pstmt.setString(12, all.getPd_opcontent2());
					pstmt.setString(13, all.getPd_opprice3());
					pstmt.setString(14, all.getPd_opcontent3());
					
					pstmt.setString(15, all.getPd_opsubject1());
					pstmt.setString(16, all.getPd_opsubject2());
					pstmt.setString(17, all.getPd_opsubject3());
					
					pstmt.executeUpdate();
					
					
					sql = "insert into seller(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAccount, seller_date)"
							+ " values(?, ?, ?, ?, ?, ?, ?, now())";
					//seller_date는 판매자의 첫 게시물이 등록(관리자가 승인)되는 날짜로 들어가기때문에 
					// 여기 insert()에서는 now로 하였음..
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, all.getUser_id());
					//pstmt.setInt(2, all.getPd_no());
					pstmt.setString(2, all.getCompany_no());
					pstmt.setString(3, all.getCompany());
					pstmt.setString(4, all.getCompany_addr());
					pstmt.setString(5, all.getCompany_tell());
					pstmt.setString(6, all.getCompany_fax());
					pstmt.setString(7, all.getSellerAccount());
					
					result = pstmt.executeUpdate(); //DB작업 성공하면 1, 실패시 0리턴
					
					if(result != 0) {
						return true;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} //finally 끝
				
				return false;
			}
			
			//saveAll에서 저장한 번호 삭제하기.. 
			public int allDel(int pd_no) {
				
				int result = 0;
				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				try {
					
					con = getConnection();
					
					sql = "delete from saveAll where pd_no=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, pd_no);

					result = pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					//예외처리와 상관없이 자원해제
					try {
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}//finally
				
				return result;
			}

			//판매중인 프로젝트 user_id로 검색해서 글 count 가져오기
			public int getBoardCount(String user_id){
				
				int count = 0;
				String sql = "";
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					
					con = getConnection();
					sql = "select count(*) from saveAll where user_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						count = rs.getInt(1);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
						if(rs != null) rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				return count;
			}//get1BoardCount() 메소드 끝
			

			
}

