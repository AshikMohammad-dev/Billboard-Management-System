package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.LoginBean;

public class LoginDAO {
	static Connection conn = null;
	static PreparedStatement pstmt =null;
	static ResultSet rs = null;
	
	//-------------------check login--------------------
	
	public static LoginBean checkLogin(LoginBean loginbean)throws SQLException {
		LoginBean login = new LoginBean();
		if(conn == null) {
			conn =DBConnection.getDbConnection();
		}
		try {
			conn = DBConnection.getDbConnection();
			pstmt = conn.prepareStatement("select login_username,login_role from login where login_username=? and login_password=?");
			pstmt.setString(1,loginbean.getLoginUsername());
			pstmt.setString(2, loginbean.getLoginPassword());
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				login.setLoginUsername(rs.getString("login_username"));
				login.setLoginRole(rs.getString("login_role"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();		
		}
		return login;
	}
}


