package FileUpload;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileloadMgr {

	public static final String saveFolder = "C:/Jsp/eclipse-workspace/myapp/WebContent/FileUpload/filestorage";
	final String encType = "EUC-KR";
	final int maxSize = 10 * 1024 * 1024;

	private DBConnectionMgr pool;

	public FileloadMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	public boolean updateFile(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = null;

		try {
			// 파일 경로 설정
			MultipartRequest multi = new MultipartRequest(req, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());

			String upFile = multi.getFilesystemName("upFile");
			File f = multi.getFile("upFile"); // 넘어 오는 값의 name 설정 값
			int size= (int)f.length();
			con = pool.getConnection();
			sql = "insert into tblfileload(upFile,size) values(?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, upFile);
			pstmt.setInt(2, size);

			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//파일 리스트
	public Vector<FileLoadBean> listFile(){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileLoadBean bean;
		Vector<FileLoadBean> vlist = new Vector<>();
		String sql = null;
		try {
			
			con = pool.getConnection();
			sql = "select * from tblfileload";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new FileLoadBean();

				bean.setNum(rs.getInt(1));
				bean.setUpFile(rs.getString(2));
				bean.setSize(rs.getInt(3));
				
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
	
	// 파일 삭제
	public void deleteFile(int num[]){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			for (int i = 0; i < num.length; i++) {
				sql = "select upFile from tblfileload where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num[i]);
				
				rs = pstmt.executeQuery();
				if(!rs.next()) {
					continue;
				}
				String upFile = rs.getString(1);
				File f = new File(saveFolder + upFile);
				
				if(f.exists()/* 파일이 존재한다면*/) {
					f.delete(); //파일을 삭제하라.
				}
				sql = "delete from tblfileload where num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num[i]);
				pstmt.executeUpdate();
			}			
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt);
		}

	}
}
