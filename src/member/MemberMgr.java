package member;

import java.sql.*;
import java.util.*;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//id �ߺ�Ȯ��
	public boolean checkId(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "SELECT id FROM tblmember WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //sql�� ����
			flag = rs.next(); //true�� �ߺ�, false�� �ߺ� x
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//�����ȣ �˻�
	public Vector<ZipcodeBean> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tblzipcode WHERE area3 LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean(); //bean�� �ִ�
				bean.setZipcode(rs.getString(1)); //zipcode��
				bean.setArea1(rs.getString(2)); //area1
				bean.setArea2(rs.getString(3)); //area2
				bean.setArea3(rs.getString(4)); //area3��
				vlist.addElement(bean); //vector�� �ִ´�.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//ȸ������
	public boolean insertMember(MemberBean bean) {
		Connection conn = null;		
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		boolean flag = false;
		
		try {
			conn = pool.getConnection();
			sql = "insert into tblmember(id,pwd,name,gender,birthday,email,zipcode,address,hobby,job)"
					+ "values(?,?,?,?,?,?,?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bean.getId());
			psmt.setString(2, bean.getPwd());
			psmt.setString(3, bean.getName());
			psmt.setString(4, bean.getGender());
			psmt.setString(5, bean.getBirthday());
			psmt.setString(6, bean.getEmail());
			psmt.setString(7, bean.getZipcode());
			psmt.setString(8, bean.getAddress());			
			String hobby[] = bean.getHobby();
			char hbean[] = {'0','0','0','0','0'};
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hbean[j] ='1';
						break;
					}
				}
			}
			// public String(char value[])
			psmt.setString(9, new String(hbean));			
			psmt.setString(10, bean.getJob());
			
			if(psmt.executeUpdate() == 1) {
				flag = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}		
		
		return flag;
	}
	// �α���
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select id, pwd from tblMember where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// ȸ������ ��������
	public MemberBean getMember(String id) {
		MemberBean bean = new MemberBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
			
				String hobby = rs.getString("hobby");
				String hobbys[] = new String[5];
				
				for (int i = 0; i < hobbys.length; i++) {
					// subString���� ���ڸ� �����Ŵ
					hobbys[i] = hobby.substring(i, i+1);
					bean.setHobby(hobbys);
				}
				
				bean.setJob(rs.getString("job"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//ȸ������ ����
	public boolean UpdateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblmember set pwd = ?, name = ?, gender = ? , birthday = ?, email = ?, zipcode= ?, address = ?, hobby = ?, job = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPwd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getGender());
			pstmt.setString(4, bean.getBirthday());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			
			String hobby[] = bean.getHobby();
			char hbean[] = {'0','0','0','0','0'};
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hbean[j] ='1';
						break;
					}
				}
			}
			// public String(char value[])
			pstmt.setString(8, new String(hbean));
			pstmt.setString(9, bean.getJob());
			pstmt.setString(10, bean.getId());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
				
		return flag;
	}
}
