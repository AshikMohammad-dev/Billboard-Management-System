package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.PaymentBean;

public class PaymentDAO {
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	//---------Start--Add Payment----------
	
	
	public static boolean addPayment(PaymentBean paymentBean) throws SQLException {
	    boolean addFlag = false;
	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }
	    try {
	        pstmt = conn.prepareStatement(
	            "INSERT INTO payment(purchase_id, amount_paid, payment_date, payment_status) VALUES(?,?,?,?)"
	        );
	        pstmt.setInt(1, paymentBean.getPurchaseId());
	        pstmt.setFloat(2, paymentBean.getAmountPaid());
	        pstmt.setDate(3, paymentBean.getPaymentDate());
	        pstmt.setString(4, paymentBean.getPaymentStatus());
	        pstmt.executeUpdate();
	        addFlag = true;
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return addFlag;
	}
	// ----------End-----Add purchase------------
	// --------- Start -- Get All Payments ----------

		public static List<PaymentBean> getAllPayments() throws SQLException {
			List<PaymentBean> payments = new ArrayList<>();
			if (conn == null)
				conn = DBConnection.getDbConnection();
			try {
				pstmt = conn.prepareStatement(
						"SELECT p.payment_id, c.company_name, bp.amount, p.amount_paid, p.payment_date, p.payment_status "
						+ "FROM payment p "
						+ "JOIN billboard_purchase bp ON p.purchase_id = bp.purchase_id "
						+ "JOIN customer c ON bp.customer_id = c.customer_id");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					PaymentBean pb = new PaymentBean();
					pb.setPaymentId(rs.getInt(1));
					pb.setCompanyName(rs.getString(2));
					pb.setTotalAmount(rs.getFloat(3));
					pb.setAmountPaid(rs.getFloat(4));
					pb.setPaymentDate(rs.getDate(5));
					pb.setPaymentStatus(rs.getString(6));
					payments.add(pb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return payments;
		}
		// ---------- End ----- Get All Payments ------------
	// --------- Start -- Update Amount Paid ----------

		public static boolean updateAmountPaid(int paymentId, float newAmount) throws SQLException {
			boolean flag = false;
			if (conn == null)
				conn = DBConnection.getDbConnection();
			try {
				pstmt = conn.prepareStatement(
						"UPDATE payment SET amount_paid = ? WHERE payment_id = ?");
				pstmt.setFloat(1, newAmount);
				pstmt.setInt(2, paymentId);
				pstmt.executeUpdate();
				flag = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return flag;
		}
		// ---------- End ----- Update Amount Paid ------------

		// --------- Start -- Get Single Payment (for edit prefill) ----------

		public static PaymentBean getPaymentById(int paymentId) throws SQLException {
			PaymentBean pb = null;
			if (conn == null)
				conn = DBConnection.getDbConnection();
			try {
				pstmt = conn.prepareStatement(
						"SELECT p.payment_id, c.company_name, bp.amount, p.amount_paid, p.payment_date, p.payment_status "
						+ "FROM payment p "
						+ "JOIN billboard_purchase bp ON p.purchase_id = bp.purchase_id "
						+ "JOIN customer c ON bp.customer_id = c.customer_id "
						+ "WHERE p.payment_id = ?");
				pstmt.setInt(1, paymentId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					pb = new PaymentBean();
					pb.setPaymentId(rs.getInt(1));
					pb.setCompanyName(rs.getString(2));
					pb.setTotalAmount(rs.getFloat(3));
					pb.setAmountPaid(rs.getFloat(4));
					pb.setPaymentDate(rs.getDate(5));
					pb.setPaymentStatus(rs.getString(6));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return pb;
		}
		// ---------- End ----- Get Single Payment ------------
}
