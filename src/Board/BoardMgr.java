package Board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {

	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/eclipse-workspace/myapp/WebContent/Board/FileUpload/";
	public static final String encodeing = "EUC-KR";
	public static int MAXSIZE = 10 *1024 *1024; //10M


	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//Board Insert : 파일업로더, ContentType, ref 상대적인 위치 값 
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			//파일 업로더
			File dir = new File(SAVEFOLDER);
			if(!dir.exists()) { //파일이 존재하지 않는다면
				dir.mkdirs(); // 폴더를 만들어라
			}
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, encodeing, new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;

			if(multi.getFilesystemName("filename")!= null) { // 파일이름이 없을경우
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			//html, txt 이냐
			String content = multi.getParameter("contentType"); // 계시물 내용

			if(multi.getParameter("contentType").equals("TEXT")) {
				content = UtilMgr.replace(content, "<", "&it");
			}

			con = pool.getConnection();
			sql = "select max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			int ref = 1;
			if(rs.next()) {
				ref = rs.getInt(1) +1; // 현재 저장된 num의 1 증가 해서 ref로 리턴
				sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)"
						+ " values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, multi.getParameter("name")); // name
				pstmt.setString(2, content); // content
				pstmt.setString(3, multi.getParameter("subject")); //subject
				pstmt.setInt(4, ref); // ref
				pstmt.setString(5, multi.getParameter("pass")); //
				pstmt.setString(6, multi.getParameter("ip"));
				pstmt.setString(7, filename);
				pstmt.setInt(8, filesize);

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

	// Board Total Count(총 게시물 갯수)
	public int getTotalTitle(String KeyField, String KeyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int TotalCount = 0;
		try {
			con = pool.getConnection();
			if(KeyWord.equals("null") || KeyWord.equals("")) {
				sql = "select count(*) from tblboard";
				pstmt = con.prepareStatement(sql);	
			}
			else {
				sql = "select count(*) from tblboard where " + KeyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+KeyWord+"%");
			}						
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				TotalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return TotalCount;
	}
	// Board List
	public Vector<BoardBean> getBoardList(String KeyField, String KeyWord, int start, int end){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist= new Vector<>();
		
		try {
			con = pool.getConnection();
			if(KeyWord.equals("null") || KeyWord.equals("")) {
				sql = "select * from tblboard order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
			}
			//검색일 경우
			else {
				sql = "select * from tblboard where "+KeyField+" like ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+KeyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				//regdate DB에서 DATE 타입이지만 모든 타입은 getString 가능
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				
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
	
	// Board Get(한개의 게시물)
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblboard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
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
	
	// Count Up(조회수 증가)
	public void upConut(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set count = count+1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt);
		}
	}
	// Board Delete
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getString(1) != null) {
				if(!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + rs.getString(1));
					if(file.exists()) {
						// 파일 삭제
						UtilMgr.delete(SAVEFOLDER + rs.getString(1));
					}
				}
			}
			sql = "delete from tblBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
	}
	// Board Update (name, subject, content 3개 수정)
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set name= ? , subject = ? , content= ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			
			pstmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, pstmt);
		}
		
	}
	//Board Update2(파일 수정)
		public void updateBoard2(MultipartRequest multi) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			int filesize = 0;
			try {
				con = pool.getConnection();
				if(multi.getFilesystemName("filename")!=null) {
					filesize = (int)multi.getFile("filename").length();
					sql = "update tblBoard set name=?, subject=?, content=?, filename=?, filesize=? where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setString(2, multi.getParameter("subject"));
					pstmt.setString(3, multi.getParameter("content"));
					pstmt.setString(4, multi.getFilesystemName("filename"));
					pstmt.setInt(5, filesize);			
					pstmt.setInt(6, Integer.parseInt(multi.getParameter("num")));
				}else {
					sql = "update tblBoard set name=?, subject=?, content=? where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setString(2, multi.getParameter("subject"));
					pstmt.setString(3, multi.getParameter("content"));
					pstmt.setInt(4, Integer.parseInt(multi.getParameter("num")));
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}	
	
	// Board Reply(답변)

	// Board Reply Up(답변 위치값 증가)

	// Board Download

	//Post 1000
	//페이징 및 블럭 테스트를 위한 게시물 저장 메소드 
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//main
	public static void main(String[] args) {
		BoardMgr mgr = new BoardMgr();
		mgr.post1000();
		System.err.println("성공");
	}
}
