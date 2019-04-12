package ch08;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterMgr {
	DBConnectionMgr pool = null;
	Connection conn = null;
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	public RegisterMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean getlogin(String id , String pwd) {
		boolean flag = false;
		
		try {			
			conn = pool.getConnection();
			sql = "select * from tblRegister where id = ? and pwd = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			
			rs = psmt.executeQuery();
			
			flag = rs.next();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		
		return flag;
	}
}