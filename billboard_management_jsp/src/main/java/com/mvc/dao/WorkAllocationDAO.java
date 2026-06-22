package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.WorkAllocationBean;

public class WorkAllocationDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    // ---------Start-- Allocate Work ----------
    public static boolean allocateWork(WorkAllocationBean workBean) throws SQLException {
        boolean addFlag = false;
        if (conn == null) {
            conn = DBConnection.getDbConnection();
        }
        try {
            pstmt = conn.prepareStatement(
                "INSERT INTO work_allocation(inspector_id, purchase_id, work_description, assigned_date, work_status) "
                + "VALUES(?,?,?,?,?)"
            );
            pstmt.setInt(1, workBean.getInspectorId());
            pstmt.setInt(2, workBean.getPurchaseId());
            pstmt.setString(3, workBean.getWorkDescription());
            pstmt.setDate(4, workBean.getAllocationDate());
            pstmt.setString(5, workBean.getStatus());
            pstmt.executeUpdate();
            addFlag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addFlag;
    }
    // ----------End----- Allocate Work ------------

    // ---------Start-- Get All Work Allocations ----------
    public static List<WorkAllocationBean> getAllAllocations() throws SQLException {
        List<WorkAllocationBean> allocations = new ArrayList<>();
        if (conn == null) {
            conn = DBConnection.getDbConnection();
        }
        try {
            pstmt = conn.prepareStatement(
                "SELECT wa.work_id, "
                + "       i.inspector_name, "
                + "       c.company_name, "
                + "       l.location_name, "
                + "       wa.work_description, "
                + "       wa.assigned_date, "
                + "       wa.work_status "
                + " FROM work_allocation wa "
                + " JOIN inspector i ON wa.inspector_id = i.inspector_id "
                + " JOIN billboard_purchase bp ON wa.purchase_id = bp.purchase_id "
                + " JOIN customer c ON bp.customer_id = c.customer_id "
                + " JOIN com_location_size cls ON bp.locsize_id = cls.locsize_id "
                + " JOIN location l ON cls.location_id = l.location_id "
                + " ORDER BY wa.work_id DESC"
            );
            rs = pstmt.executeQuery();
            while (rs.next()) {
                WorkAllocationBean wb = new WorkAllocationBean();
                wb.setAllocationId(rs.getInt("work_id"));
                wb.setInspectorName(rs.getString("inspector_name"));
                wb.setCompanyName(rs.getString("company_name"));
                wb.setLocationName(rs.getString("location_name"));
                wb.setWorkDescription(rs.getString("work_description"));
                wb.setAllocationDate(rs.getDate("assigned_date"));
                wb.setStatus(rs.getString("work_status"));
                allocations.add(wb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allocations;
    }
    // ----------End----- Get All Allocations ------------
    
    // --------- Start -- Get Work By Inspector Username (Inspector login) ----------
    public static List<WorkAllocationBean> getWorkByUsername(String username) throws SQLException {
        List<WorkAllocationBean> allocations = new ArrayList<>();
        if (conn == null) {
            conn = DBConnection.getDbConnection();
        }
        try {
            // login_username in login table links to inspector via inspector_name or a FK.
            // We JOIN login -> inspector on inspector_name = login_username
            pstmt = conn.prepareStatement(
                "SELECT wa.work_id, "
                + "       i.inspector_name, "
                + "       c.company_name, "
                + "       l.location_name, "
                + "       wa.work_description, "
                + "       wa.assigned_date, "
                + "       wa.work_status "
                + " FROM work_allocation wa "
                + " JOIN inspector i ON wa.inspector_id = i.inspector_id "
                + " JOIN billboard_purchase bp ON wa.purchase_id = bp.purchase_id "
                + " JOIN customer c ON bp.customer_id = c.customer_id "
                + " JOIN com_location_size cls ON bp.locsize_id = cls.locsize_id "
                + " JOIN location l ON cls.location_id = l.location_id "
                + " WHERE i.inspector_name = ? "
                + " ORDER BY wa.work_id DESC"
            );
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                WorkAllocationBean wb = new WorkAllocationBean();
                wb.setAllocationId(rs.getInt("work_id"));
                wb.setInspectorName(rs.getString("inspector_name"));
                wb.setCompanyName(rs.getString("company_name"));
                wb.setLocationName(rs.getString("location_name"));
                wb.setWorkDescription(rs.getString("work_description"));
                wb.setAllocationDate(rs.getDate("assigned_date"));
                wb.setStatus(rs.getString("work_status"));
                allocations.add(wb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allocations;
    }
    // ---------- End ----- Get Work By Inspector Username ------------

    // --------- Start -- Update Work Status ----------
    public static boolean updateWorkStatus(int workId, String newStatus) throws SQLException {
        boolean flag = false;
        if (conn == null) {
            conn = DBConnection.getDbConnection();
        }
        try {
            pstmt = conn.prepareStatement(
                "UPDATE work_allocation SET work_status = ? WHERE work_id = ?"
            );
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, workId);
            pstmt.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    // ---------- End ----- Update Work Status ------------
}
