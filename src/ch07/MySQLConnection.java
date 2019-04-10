package ch07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection {
	
	//Mysql �⺻ Setting
	private String driver = "org.gjt.mm.mysql.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR";
	private String user = "root";
	private String pwd = "1234";
	
	Connection con;
	PreparedStatement psmt;
	
	public MySQLConnection() {
		try {
			// DB ���� ����
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,pwd);
			System.out.println("DB���� ����");			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void listTeam() {
		try {
			// ������ �����
			String sql = "select * from tblTeam";
			psmt = con.prepareStatement(sql);
			// ���� ����
			ResultSet rs = psmt.executeQuery(sql);
			System.err.println("��ȣ \t �� �� \t ��°�\t ���� \t ��\t");
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
			//�Է�
			psmt.setString(1, name);
			psmt.setString(2, city);
			psmt.setInt(3, age);
			psmt.setString(4, team);
			// insert,update,delect ���� ���ԵȰ�
			int cnt = psmt.executeUpdate();
			
			if(cnt == 1) {
				System.out.println("�Է� ����");
			}else {
				System.out.println("�Է� ����");
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
				System.out.println("���� ����");
			}else {
				System.out.println("���� ����");
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
			//execute �ؾ���
			int cnt = psmt.executeUpdate();
			
			if(cnt == 1) {
				System.out.println("���� ����");
			}else {
				System.out.println("���� ����");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		MySQLConnection mcon = new MySQLConnection();
//		mcon.insertTeam("�豸��", "��õ", 33, "MC");
		mcon.listTeam();
		//update
		mcon.updateTeam(4, "�ŵ���");
		//update �� result
		mcon.listTeam();
		//delect
		mcon.deleteTeam(4);
		//delect �� result
		mcon.listTeam();
	}
}
