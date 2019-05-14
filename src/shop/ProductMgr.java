package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ProductMgr {
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/myapp/WebContent/shop/data/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<productBean> getproductlist(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<productBean> vlist = new Vector<>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblproduct order by no desc" ;
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productBean bean = new productBean();
				bean.setNo(rs.getInt("no"));
				bean.setName(rs.getString("name"));
				bean.setPrice(rs.getInt("price"));
				bean.setDetail(rs.getString("detail"));
				bean.setDate(rs.getString("date"));
				bean.setStock(rs.getInt("stock"));
				bean.setImage(rs.getString("image"));
				
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//Product Detail
	public productBean getproduct(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		productBean bean = new productBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblproduct where no = ? order by no desc" ;
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNo(rs.getInt("no"));//상품번호
				bean.setName(rs.getString("name"));//상품이름
				bean.setPrice(rs.getInt("price"));//상품가격
				bean.setDetail(rs.getString("detail"));//상품상세설명
				bean.setDate(rs.getString("date"));
				bean.setStock(rs.getInt("stock"));//상품제고
				bean.setImage(rs.getString("image"));//상품이미지
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
	
	//Product Stock Reduce(재고 수정)
	public void reduceProduct(OrderBean order){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock=stock-? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());
			pstmt.setInt(2, order.getProductNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	/*admin mode*/
	
	//Product Insert
	
	//Product Update
	
	//Product Delete
}
