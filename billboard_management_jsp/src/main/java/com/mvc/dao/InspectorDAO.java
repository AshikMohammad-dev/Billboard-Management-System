package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.InspectorBean;

public class InspectorDAO {
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	
	
	public static boolean addInspector(InspectorBean inspectorBean) throws SQLException {

	    boolean addFlag = false;

	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }

	    try {
	        pstmt = conn.prepareStatement(
	            "INSERT INTO inspector(loginId,inspector_name,phone) VALUES(?,?,?)");

	        pstmt.setInt(1, inspectorBean.getLoginId());
	        pstmt.setString(2, inspectorBean.getInspectorName());
	        pstmt.setLong(3, inspectorBean.getPhone());

	        pstmt.executeUpdate();
	        addFlag = true;

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return addFlag;
	}
	//----------------------------------------------------
	
	
	public static List<InspectorBean> getAllInspectors() throws SQLException {

	    List<InspectorBean> inspectors = new ArrayList<>();

	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }

	    try {

	        pstmt = conn.prepareStatement("SELECT * FROM inspector");
	        rs = pstmt.executeQuery();

	        while(rs.next()) {

	            InspectorBean inspectorBean = new InspectorBean();

	            inspectorBean.setInspectorId(rs.getInt(1));
	            inspectorBean.setLoginId(rs.getInt(2));
	            inspectorBean.setInspectorName(rs.getString(3));
	            inspectorBean.setPhone(rs.getLong(4));

	            inspectors.add(inspectorBean);
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return inspectors;
	}
	
	//--------------------------------
	public static InspectorBean editInspector(InspectorBean inspectorBean)
	        throws SQLException {

	    InspectorBean inspectorEdit = new InspectorBean();

	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }

	    try {

	        pstmt = conn.prepareStatement(
	                "SELECT * FROM inspector WHERE inspector_id=?");

	        pstmt.setInt(1, inspectorBean.getInspectorId());

	        rs = pstmt.executeQuery();

	        while(rs.next()) {

	            inspectorEdit.setInspectorId(rs.getInt(1));
	            inspectorEdit.setLoginId(rs.getInt(2));
	            inspectorEdit.setInspectorName(rs.getString(3));
	            inspectorEdit.setPhone(rs.getLong(4));
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return inspectorEdit;
	}
	//-----------------------------------------
	public static boolean updateInspector(InspectorBean inspectorBean)
	        throws SQLException {

	    boolean updateFlag = false;

	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }

	    try {

	        pstmt = conn.prepareStatement(
	                "UPDATE inspector SET login_id=?, inspector_name=?, phone=? WHERE inspector_id=?");

	        pstmt.setInt(1, inspectorBean.getLoginId());
	        pstmt.setString(2, inspectorBean.getInspectorName());
	        pstmt.setLong(3, inspectorBean.getPhone());
	        pstmt.setInt(4, inspectorBean.getInspectorId());

	        pstmt.executeUpdate();

	        updateFlag = true;

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return updateFlag;
	}
	//--------------------------------------------------
	public static boolean deleteInspector(InspectorBean inspectorBean)
	        throws SQLException {

	    boolean deleteFlag = false;

	    if(conn == null) {
	        conn = DBConnection.getDbConnection();
	    }

	    try {

	        pstmt = conn.prepareStatement(
	                "DELETE FROM inspector WHERE inspector_id=?");

	        pstmt.setInt(1, inspectorBean.getInspectorId());

	        pstmt.executeUpdate();

	        deleteFlag = true;

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return deleteFlag;
	}
	//------------------------------------
	public static List<com.mvc.bean.LoginBean> getInspectorLogins() throws SQLException {
        List<com.mvc.bean.LoginBean> logins = new ArrayList<>();
        if (conn == null) {
            conn = DBConnection.getDbConnection();
        }
        try {
            pstmt = conn.prepareStatement(
                "SELECT login_id, login_username FROM login "
                + "WHERE login_role = 'inspector' "
                + "AND login_id NOT IN (SELECT login_id FROM inspector WHERE login_id IS NOT NULL)"
            );
            rs = pstmt.executeQuery();
            while (rs.next()) {
                com.mvc.bean.LoginBean lb = new com.mvc.bean.LoginBean();
                lb.setLoginId(rs.getInt("login_id"));
                lb.setLoginUsername(rs.getString("login_username"));
                logins.add(lb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logins;
    }
}
