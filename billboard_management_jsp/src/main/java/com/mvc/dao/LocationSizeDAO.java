package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.bean.LocationSizeBean;

public class LocationSizeDAO {
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	//-------------------Start---------Add Location and Size--------------------
	
	
		public static boolean addLocationAndSize(LocationSizeBean locationSizeBean)throws SQLException{
			boolean addLocSizeFlag = false;
			if(conn == null) {
				conn = DBConnection.getDbConnection();
			}
			try {
				pstmt =conn.prepareStatement("INSERT INTO com_location_size(location_id,size_id,price,availability_status)VALUES(?,?,?,?)");
				pstmt.setInt(1, locationSizeBean.getLocationId());
				pstmt.setInt(2, locationSizeBean.getSizeId());
				pstmt.setFloat(3,locationSizeBean.getPrice());
				pstmt.setString(4, locationSizeBean.getAvailabilityStatus());
				
				pstmt.executeUpdate();
				addLocSizeFlag = true;
			}catch(SQLException ex) {
				ex.printStackTrace();
			}
			
			return addLocSizeFlag;
		}

		//----------------END-----------Add LocationSize--------------------
		
		//-----------------START ------------GET ALL Location Size--------------------

		
		public static List<LocationSizeBean>getAllLocationAndSize()throws SQLException{
			List<LocationSizeBean>locationSize = new ArrayList<LocationSizeBean>();
			
			
			if(conn == null) {
				conn = DBConnection.getDbConnection();
			}
			try {
				pstmt =conn.prepareStatement("SELECT l.location_name,s.billboard_size,ls.price,ls.availability_status "
						+ "FROM  com_location_size ls "
						+ "JOIN location l ON ls.location_id = l.location_id "
						+ "JOIN bill_size s ON ls.size_id =s.size_id");
				rs =pstmt.executeQuery();
				while(rs.next()) {
					LocationSizeBean locationSizeBean = new LocationSizeBean();
					locationSizeBean.setLocationName(rs.getString("location_name"));
					locationSizeBean.setSize(rs.getString("billboard_size"));
					locationSizeBean.setPrice(rs.getFloat(3));
					locationSizeBean.setAvailabilityStatus(rs.getString(4));
					locationSize.add(locationSizeBean);
				}	
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return locationSize;
		}


	//----------------end ----get all locations size ----------------------
	
		//-----------------START ------------GET ALL Available--------------------
		
		
				public static List<LocationSizeBean>getAllAvailable()throws SQLException{
					List<LocationSizeBean>avaliable = new ArrayList<LocationSizeBean>();
					
					
					if(conn == null) {
						conn = DBConnection.getDbConnection();
					}
					try {
						pstmt =conn.prepareStatement("SELECT ls.locsize_id, l.location_name, s.billboard_size, ls.price "
								+ "FROM com_location_size ls "
								+ "JOIN location l ON ls.location_id = l.location_id "
								+ "JOIN bill_size s ON ls.size_id = s.size_id "
								+ "WHERE ls.availability_status = 'Available'");
						rs =pstmt.executeQuery();
						while(rs.next()) {
							LocationSizeBean locationSizeBean = new LocationSizeBean();
							
							locationSizeBean.setLocSizeId(rs.getInt("locsize_id"));
							locationSizeBean.setLocationName(rs.getString("location_name"));
							locationSizeBean.setSize(rs.getString("billboard_size"));
							locationSizeBean.setPrice(rs.getFloat("price"));
							
							avaliable.add(locationSizeBean);
						}	
					}catch(SQLException e) {
						e.printStackTrace();
					}
					return avaliable;
				}


			//----------------end ----get all Available ----------------------
		
}
