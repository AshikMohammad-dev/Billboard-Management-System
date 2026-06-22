package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.BillboardPurchaseBean;

public class BillboardPurchaseDAO {
	
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	//---------Start--Add Purchase----------
	
	
	public static boolean addPurchase(BillboardPurchaseBean purchaseBean) throws SQLException {
	    boolean addFlag = false;
	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }
	    try {
	        pstmt = conn.prepareStatement(
	            "INSERT INTO billboard_purchase(customer_id, locsize_id, start_date, duration, amount) VALUES(?,?,?,?,?)"
	        );
	        pstmt.setInt(1, purchaseBean.getCustomer_id());
	        pstmt.setInt(2, purchaseBean.getLocsize_id());
	        pstmt.setDate(3, purchaseBean.getStart_date());
	        pstmt.setInt(4, purchaseBean.getDuration());
	        pstmt.setFloat(5, purchaseBean.getAmount());
	        pstmt.executeUpdate();
	        addFlag = true;
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return addFlag;
	}
	// ----------End-----Add purchase------------
	
	//---------Start -----------getPrice--------------
	
	public static float getPrice(int locSizeId) throws SQLException {
	    float price = 0;
	    if(conn == null) conn = DBConnection.getDbConnection();
	    try {
	        pstmt = conn.prepareStatement(
	            "SELECT price FROM com_location_size WHERE locsize_id = ?"
	        );
	        pstmt.setInt(1, locSizeId);
	        rs = pstmt.executeQuery();
	        if(rs.next()) price = rs.getFloat(1);
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return price;
	}
	//-------End ------------getPrice-----------
	
	
	//---------Start -----------getAll--------------
	
		public static List<BillboardPurchaseBean> getAllPurchases() throws SQLException {
		    List<BillboardPurchaseBean> purchase = new ArrayList<>();
		    if(conn == null) conn = DBConnection.getDbConnection();
		    try {
		        pstmt = conn.prepareStatement(
		            "SELECT bp.purchase_id, "
		            + "    c.company_name, "
		            + "    l.location_name, "
		            + "    s.billboard_size, "
		            + "    bp.start_date, "
		            + "    bp.duration, "
		            + "    bp.amount "
		            + " FROM billboard_purchase bp "
		            + " JOIN customer c ON bp.customer_id = c.customer_id "
		            + " JOIN com_location_size cls ON bp.locsize_id = cls.locsize_id "
		            + " JOIN location l ON cls.location_id = l.location_id "
		            + " JOIN bill_size s ON cls.size_id = s.size_id"
		        );
		        rs = pstmt.executeQuery();
		        while (rs.next()) {
		            BillboardPurchaseBean pb = new BillboardPurchaseBean();
		            pb.setPurchase_id(rs.getInt(1));
		            pb.setCompanyName(rs.getString(2));
		            pb.setLocationName(rs.getString(3));
		            pb.setSize(rs.getString(4));
		            pb.setStart_date(rs.getDate(5));
		            pb.setDuration(rs.getInt(6));
		            pb.setAmount(rs.getFloat(7));
		            purchase.add(pb);
		        }
		        
		    } catch(SQLException e) {
		        e.printStackTrace();
		    }
		    return purchase;
		}
		//---end -getAll
}
