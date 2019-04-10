package ch07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection2 {

	private DBConnectionMgr pool;

	public MySQLConnection2() {
		// 싱글톤 패턴 ->객체를 only 한개만 생성
		pool = DBConnectionMgr.getInstance();
	}

	public void selectTeam() {

		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			// 풀에서 빌려옴.
			con = pool.getConnection();
			sql = "select * from tblTeam";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			System.err.println("번호 \t 성 명 \t 사는곳\t 나이 \t 팀\t");
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String city = rs.getString("city");
				int age = rs.getInt("age");
				String team = rs.getString("team");
				System.out.println(num +"\t" + name +"\t" + city + "\t" + age +"\t" + team + "\t" );
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		// 닫아야 될것만 실행 시키기
		finally {
			// 빌려온 con, psmt, rs
			pool.freeConnection(con, psmt, rs);
		}
	}

	public static void main(String[] args) {
		MySQLConnection2 mcon = new MySQLConnection2();
		mcon.selectTeam();
	}
}
