package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/*
 -- DB와 관련된 기능의 메소드를 선언한 클래스
 */
public class TeamMgr {

	private DBConnectionMgr pool;

	public TeamMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//insert
	public boolean insertTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement psmt = null;
		boolean flag = false;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "insert into tblTeam(name, city, age, team) values(?,?,?,?)";
			psmt = con.prepareStatement(sql);
			// ? 셋팅
			psmt.setString(1, bean.getName());
			psmt.setString(2, bean.getCity());
			psmt.setInt(3, bean.getAge());
			psmt.setString(4, bean.getTeam());

			int cnt = psmt.executeUpdate();
			if(cnt == 1) {
				flag = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}		
		finally {
			pool.freeConnection(con, psmt);
		}
		return flag;
	}
	//list 백터로받고<가져올클래스> 
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist= new Vector<TeamBean>();

		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				TeamBean bean = new TeamBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
				
				vlist.add(bean);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con, psmt, rs);
		}

		return vlist;
	}
	//get
	public TeamBean getTeam(int num) {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean = new TeamBean();
		
		try {
			con = pool.getConnection();
			sql = "select num, name, city, age, Team from tblTeam where num = ?";			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con, psmt, rs);
		}
		
		return bean;
	}
	//update
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql;
		
		try {
			con = pool.getConnection();
			sql = "update tblTeam set name = ?, city = ?, age = ?, team = ? where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bean.getName());
			psmt.setString(2, bean.getCity());
			psmt.setInt(3, bean.getAge());
			psmt.setString(4, bean.getTeam());
			psmt.setInt(5, bean.getNum());
						
			if(psmt.executeUpdate() == 1) {
				flag = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con, psmt, rs);
		}
		
		return flag;
	}
	//delete
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement psmt = null;
		String sql;
		
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(con, psmt);
		}
	}
}
