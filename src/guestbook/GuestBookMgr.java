package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class GuestBookMgr {

	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME = new SimpleDateFormat("H:mm:ss");

	public GuestBookMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//Join Login
	public boolean loginJoin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id, pwd from tblJoin where id=? and pwd =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			if(pstmt.executeQuery().next())
				flag = true;
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	//Join Information
	public JoinBean getJoin(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JoinBean bean = new JoinBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblJoin where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setHp(rs.getString(5));
				bean.setGrade(rs.getString(6));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}	
	//GuestBook Insert
	public void insertGuest(guestbookBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tblguestbook(id, contents, ip, regdate, regtime, secret) values(?,?,?,now(),now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getContents());
			pstmt.setString(3, bean.getIp());
			pstmt.setString(4, bean.getSecret());

			pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//GuestBook List : 비밀글
	public Vector<guestbookBean> listGuestBook(String id, String grade){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<guestbookBean> vlist = new Vector<guestbookBean>();
		String sql = null;
		try {
			con = pool.getConnection();
			// 어드민 로그인
			if(grade.equals("1")) {
				sql = "select * from tblguestbook order by num desc";
				pstmt = con.prepareStatement(sql);
			}
			else {
				sql = "select * from tblguestbook where id = ? or secret = ? order by num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "0");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				guestbookBean bean = new guestbookBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setContents(rs.getString(3));
				bean.setIp(rs.getString(4));
				bean.setRegdate(SDF_DATE.format(rs.getDate(5))); // 날짜
				bean.setRegtime(SDF_TIME.format(rs.getTime(6))); // 시간
				bean.setSecret(rs.getString(7));
				
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	// GuestBook Delete
	public void deleteGuestBook(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblguestbook where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
			deleteAllComment(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public guestbookBean getGuestBook(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		guestbookBean bean = new guestbookBean();
		Vector<guestbookBean> vlist = new Vector<guestbookBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblguestbook where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setContents(rs.getString(3));
				bean.setIp(rs.getString(4));
				bean.setRegdate(SDF_DATE.format(rs.getDate(5))); // 날짜
				bean.setRegtime(SDF_TIME.format(rs.getTime(6))); // 시간
				bean.setSecret(rs.getString(7));
				
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//GuestBook Update (contents, ip, secret 3개 수정)
	public void updateGuestBook(guestbookBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblguestbook set contents = ?, ip = ?, secret = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContents());
			pstmt.setString(2, bean.getIp());
			pstmt.setString(3, bean.getSecret());
			pstmt.setInt(4, bean.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//Comment List
	public Vector<commentBean> listComment(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		commentBean bean = new commentBean();
		Vector<commentBean> vlist = new Vector<commentBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean.setCnum(rs.getInt(1));
				bean.setNum(rs.getInt(2));
				bean.setCid(rs.getString(3));
				bean.setComment(rs.getString(4));
				bean.setCip(rs.getString(5));
				bean.setCregDate(SDF_DATE.format(rs.getDate(6)));
				
				vlist.addElement(bean);
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Comment Insert
	public void insertComment(commentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into tblcomment(num, cid, comment, cip, cregDate) values(?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getCid());
			pstmt.setString(3, bean.getComment());
			pstmt.setString(4, bean.getCip());
						
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//Comment Delete
	public void deleteComment(int cnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblcomment where cnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnum);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//Comment All Delete
	public void deleteAllComment(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete tblcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
