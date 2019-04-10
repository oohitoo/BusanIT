package ch07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection {
	
	//Mysql 기본 Setting
	private String driver = "org.gjt.mm.mysql.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR";
	private String user = "root";
	private String pwd = "1234";
	
	Connection con;
	PreparedStatement psmt;
	
	public MySQLConnection() {
		try {
			// DB 접속 공식
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,pwd);
			System.out.println("DB연결 성공");			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void listTeam() {
		try {
			// 쿼리문 대기중
			String sql = "select * from tblTeam";
			psmt = con.prepareStatement(sql);
			// 쿼리 실행
			ResultSet rs = psmt.executeQuery(sql);
			System.err.println("번호 \t 성 명 \t 사는곳\t 나이 \t 팀\t");
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String city = rs.getString("city");
				int age = rs.getInt("age");
				String team = rs.getString("team");
				System.out.println(num +"\t" + name +"\t" + city + "\t" + age +"\t" + team + "\t" );
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertTeam(String name, String city, int age, String team) {
		try {
			String sql = "insert tblTeam(name, city, age, team) values(?,?,?,?)";
			psmt = con.prepareStatement(sql);
			//입력
			psmt.setString(1, name);
			psmt.setString(2, city);
			psmt.setInt(3, age);
			psmt.setString(4, team);
			// insert,update,delect 같이 포함된것
			int cnt = psmt.executeUpdate();
			
			if(cnt == 1) {
				System.out.println("입력 성공");
			}else {
				System.out.println("입력 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateTeam(int num, String name) {
		try {
			String sql = "update tblTeam set name =? where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setInt(2, num);
			
			int cnt = psmt.executeUpdate();
			if(cnt == 1) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteTeam(int num) {
		try {
			String sql = "delete from tblTeam where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			//execute 해야함
			int cnt = psmt.executeUpdate();
			
			if(cnt == 1) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		MySQLConnection mcon = new MySQLConnection();
//		mcon.insertTeam("김구라", "인천", 33, "MC");
		mcon.listTeam();
		//update
		mcon.updateTeam(4, "신동엽");
		//update 후 result
		mcon.listTeam();
		//delect
		mcon.deleteTeam(4);
		//delect 후 result
		mcon.listTeam();
	}
}
