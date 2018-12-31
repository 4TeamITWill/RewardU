package reward.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	
	
	public boolean insert(BoardBean bb, SellerBean sb){
		
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		//db작업 성공여부 저장
		int result = 0;
		
		try {
			
			con = getConnection();
			
			sql = "insert into Board(user_id, pd_subject, pd_content, pd_goalMoney, pd_category, pd_start,"
					+ "pd_end, pd_file, pd_realfile, pd_opprice1, pd_opcontent1, pd_opprice2, pd_opcontent2, pd_opprice3, pd_opcontent3)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?)";
			
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
			pstmt.setString(10, bb.getPd_opprice1());
			pstmt.setString(11, bb.getPd_opcontent1());
			pstmt.setString(12, bb.getPd_opprice2());
			pstmt.setString(13, bb.getPd_opcontent2());
			pstmt.setString(14, bb.getPd_opprice3());
			pstmt.setString(15, bb.getPd_opcontent3());
			
			pstmt.executeUpdate();
			
			
			sql = "insert into seller(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAcount, seller_date)"
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
			pstmt.setString(7, sb.getSellerAcount());
			
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

	public boolean SaveInsert(SaveBoard saveB, SaveSeller saveS) {
		

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
			
			
			sql = "insert into SaveSeller(user_id, company_no, company, company_addr, company_tell, company_fax, sellerAcount, seller_date)"
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
			pstmt.setString(7, saveS.getSellerAcount());
			
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
	
	//저장한 리워드 리스트 select
	public Vector<SaveBoard> getSaveList(String user_id){
	

		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs;
		
		Vector<SaveBoard> v = new Vector<SaveBoard>();
		
		SaveBoard bean = null;
		
		
	
	try {
		//db연결
		con= getConnection();
		
		sql = "select pd_no, user_id, pd_subject, pd_realFile from saveboard where user_id=?";
				
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, user_id); //user_id 가져오기..
	
		rs = pstmt.executeQuery();
		
		//리스트는 전부 널 허용인 saveboard에서  이미지, 제목, 상세설명만 꺼내오기때문에
		while (rs.next()){ //
			bean = new SaveBoard();
			bean.setPd_no(rs.getInt(1));
			bean.setUser_id(rs.getString("user_id"));
			bean.setPd_subject(rs.getString(3));
			bean.setPd_realFile(rs.getString("pd_realFile"));
			
			
			v.add(bean); //백터에 담기

		} //while문 끝
		//자원해제
		con.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return v; //saveBoard객체들을 저장하고 있는 백터 자체를 리턴
}


	
	//수정할 보드정보를 DB로 부터 select.....
			public SaveBoard getSaveBoard(int pd_no) {
				
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
			public SaveSeller getSaveSeller(int pd_no) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				
				SaveSeller saveS = new SaveSeller();
				
			try {
				 con = getConnection();//DB연결
				 
				 String sql = "select * from saveSeller where pd_no=?";
				 
				
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
					 saveS.setSellerAcount(rs.getString("sellerAcount"));
					
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

			

			//글 수정하는 메소드 -> 관리자에게 가는게 아니라 save테이블의 글update
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
					
					
					sql = "update SaveSeller set company_no=?, company=?, company_addr=?, company_tell=?, company_fax=?, sellerAcount=? where user_id=? and pd_no=?";
					//seller_date는 판매자의 첫 게시물이 등록(관리자가 승인)되는 날짜로 들어가기때문에 
					// 여기 insert()에서는 now로 하였음..
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, saveS.getCompany_no());
					pstmt.setString(2, saveS.getCompany());
					pstmt.setString(3, saveS.getCompany_addr());
					pstmt.setString(4, saveS.getCompany_tell());
					pstmt.setString(5, saveS.getCompany_fax());
					pstmt.setString(6, saveS.getSellerAcount());
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

			//글쓰기 저장만 리스트 삭제하기.. 
			public int RewardingSaveDel(int pd_no) {
				
				int result = 0;
				Connection con = null;
				String sql = "";
				PreparedStatement pstmt = null;
				
				try {
					
					con = getConnection();
					
					sql = "delete from saveBoard where pd_no=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, pd_no);
					
					pstmt.executeUpdate(); //delete

					
					sql = "delete from saveSeller where pd_no=?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, pd_no);
					
					result = pstmt.executeUpdate();
					
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
			
	
}
