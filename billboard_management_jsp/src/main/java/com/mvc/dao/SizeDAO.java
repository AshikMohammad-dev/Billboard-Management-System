package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.SizeBean;

public class SizeDAO {
	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;

	// -------------------Start---------Add Size--------------------

	public static boolean addSize(SizeBean sizebean) throws SQLException {
		boolean addSizeFlag = false;
		if (conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt = conn.prepareStatement("INSERT INTO bill_size(billboard_size)VALUES(?)");
			pstmt.setString(1, sizebean.getBillboardSize());

			pstmt.executeUpdate();
			addSizeFlag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return addSizeFlag;
	}
	// ----------------END-----------Add Size--------------------

	// -----------------START ------------GET ALL Size--------------------
	/**
	 * @author : Mary
	 * @Date : 17-06-2026
	 * @version : v1.0
	 * @purpose : get all location from table
	 * @param : Nothing
	 * @throes : SQL Exception
	 * @return : list
	 * @see : DBDAO.java
	 */
	public static List<SizeBean> getAllSize() throws SQLException {
		List<SizeBean> size = new ArrayList<SizeBean>();

		if (conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt = conn.prepareStatement("SELECT * FROM bill_size");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SizeBean sizeBean = new SizeBean();
				sizeBean.setSizeId(rs.getInt(1));
				sizeBean.setBillboardSize(rs.getString(2));

				size.add(sizeBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return size;
	}
	// ----------------end ----get all Size ----------------------

	// ----------------Start ----location Edit----------------------
	/**
	 * @author : Mary
	 * @Date : 18-06-2026
	 * @version : v1.0
	 * @purpose : Edit table
	 * @param : Nothing
	 * @throws : SQL Exception
	 * @return :SizeBean object(model)
	 * @see : DBDAO.java
	 */

	public static SizeBean editSize(SizeBean sizeBean) throws SQLException {
		SizeBean sizeEdit = new SizeBean();
		if (conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt = conn.prepareStatement("select * from bill_size where size_id=?");
			pstmt.setInt(1, sizeBean.getSizeId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sizeEdit.setSizeId(rs.getInt(1));
				sizeEdit.setBillboardSize(rs.getString(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sizeEdit;
	}

	// ----------------End ----size Edit----------------------

	// ----------------Start ----size update----------------------
	/**
	 * @author : Mary
	 * @Date : 18-06-2026
	 * @version : v1.0
	 * @purpose : update table
	 * @param : Nothing
	 * @throws : SQL Exception
	 * @return : flag
	 * @see : DBDAO.java
	 */

	public static boolean updateSize(SizeBean sizeBean) throws SQLException {
		boolean updateFlag = false;
		if (conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {

			pstmt = conn.prepareStatement("update bill_size set billboard_size=?where size_id=?");
			pstmt.setString(1, sizeBean.getBillboardSize());
			pstmt.setInt(2, sizeBean.getSizeId());
			pstmt.executeUpdate();

			updateFlag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateFlag;
	}

	// ----------------end ----size update---------------------

	// ----------------Start ----size delete----------------------

	/**
	 * @author : Mary
	 * @Date : 18-06-2026
	 * @version : v1.0
	 * @purpose : delete table
	 * @param : Nothing
	 * @throws : SQL Exception
	 * @return : flag
	 * @see : DBDAO.java
	 */
	public static boolean deletesize(SizeBean sizeBean) throws SQLException {
		boolean DeleteFlag = false;
		if (conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt = conn.prepareStatement("delete from bill_size where size_id=?");
			pstmt.setInt(1, sizeBean.getSizeId());
			pstmt.executeUpdate();

			DeleteFlag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return DeleteFlag;
	}
	// ----------------end ----size delete----------------------
}
