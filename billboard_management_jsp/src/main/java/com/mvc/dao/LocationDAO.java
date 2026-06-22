package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.LocationBean;

public class LocationDAO {
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	//-------------------Start---------Add Location--------------------
	

	public static boolean addLocation(LocationBean locBean)throws SQLException{
		boolean addLocFlag = false;
		if(conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt =conn.prepareStatement("INSERT INTO location(location_name,location_address)VALUES(?,?)");
			pstmt.setString(1, locBean.getLocationName());
			pstmt.setString(2, locBean.getLocationAddress());
			
			pstmt.executeUpdate();
			addLocFlag = true;
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return addLocFlag;
	}
	//----------------END-----------Add Location--------------------
	
	//-----------------START ------------GET ALL Location--------------------

	public static List<LocationBean>getAllLocation()throws SQLException{
		List<LocationBean>locations = new ArrayList<LocationBean>();
		
		
		if(conn == null) {
			conn = DBConnection.getDbConnection();
		}
		try {
			pstmt =conn.prepareStatement("SELECT * FROM location");
			rs =pstmt.executeQuery();
			while(rs.next()) {
				LocationBean locationBean = new LocationBean();
				locationBean.setLocationId(rs.getInt(1));
				locationBean.setLocationName(rs.getString(2));
				locationBean.setLocationAddress(rs.getString(3));
				locations.add(locationBean);
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return locations;
	}


//----------------end ----get all locations ----------------------
	
//----------------Start ----location Edit----------------------

	

	public static LocationBean editLocation(LocationBean locationBean)throws SQLException{
		LocationBean locationEdit = new LocationBean();
		if(conn == null) {
			 conn = DBConnection.getDbConnection();
		 }
		try {
		pstmt = conn.prepareStatement("select * from location where location_id=?");
		pstmt.setInt(1,locationBean.getLocationId());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			
			locationEdit.setLocationId(rs.getInt(1));
			locationEdit.setLocationName(rs.getString(2));
			locationEdit.setLocationAddress(rs.getString(3));
		}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return locationEdit;
	}
	
	//----------------End ----location Edit----------------------	
	
	//----------------Start ----location update----------------------
	
	
	public static boolean updateLocation(LocationBean locationBean) throws SQLException{
		boolean updateFlag= false;
		if(conn == null) {
			 conn = DBConnection.getDbConnection();
		 }
		try {
			
			pstmt =conn.prepareStatement("update location set location_name=?,location_address=?  where location_id=?");
			pstmt.setString(1, locationBean.getLocationName());
			pstmt.setString(2, locationBean.getLocationAddress());
			pstmt.setInt(3,locationBean.getLocationId());
			pstmt.executeUpdate();
			 
			 updateFlag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return updateFlag;
	}

	//----------------end ----location update---------------------

	//----------------Start ----location delete----------------------
	

	public static boolean deleteLocation(LocationBean locationBean) throws SQLException{
		boolean DeleteFlag= false;
		if(conn == null) {
			 conn = DBConnection.getDbConnection();
		 }
		try {
			pstmt =conn.prepareStatement("delete from location where location_id=?");
			pstmt.setInt(1,locationBean.getLocationId());
			 pstmt.executeUpdate();
			 
			 DeleteFlag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return DeleteFlag;
	}
	//----------------end ----location delete----------------------
}

