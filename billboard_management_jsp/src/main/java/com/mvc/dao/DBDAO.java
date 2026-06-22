package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {
	private static  Connection dbCon;
	private static  String db_url ;
	private static  String db_driver ;
	private static  String user_name ;
	private static  String pass_word ;
	
	
	//--------------------start------- database initialization------------
		/**
		 * @author : Ashik
		 * @Date   : 19-06-2026
		 * @version : v1.0
		 * @purpose : initialize database connection value
		 * @param : Nothing
		 * @see :   Nothing
		 * @return : Nothing
		 
		 */
	
	public static void dbInit() {
		try {
			db_driver ="com.mysql.cj.jdbc.Driver";
			db_url ="jdbc:mysql://localhost:3306/billboard_db";
			user_name ="root";
			pass_word ="root";
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//--------------------END------- database initialization-----------------
	
	//--------------------start------- database connection------------
	
		/**
		 * @author : Mary
		 * @Date   : -06-2026
		 * @version : v1.0
		 * @purpose : database connection 
		 * @param : Nothing
		 * @throws : Exception in case of missing driver
		 * @return : Connection
		 
		 */
	
	public static void connect() throws ClassNotFoundException,SQLException{
		dbInit();
		try {
			Class.forName(db_driver);
			Connection con = DriverManager.getConnection(db_url,user_name,pass_word);
			setDbCon(con);
		}catch(ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}
		
	}
	//--------------------END------- database connection------------
	
	//--------------------start------- set database connection------------
	
		/**
		 * @author : Ashik
		 * @Date   : 19-06-2026
		 * @version : v1.0
		 * @purpose : set Connection 
		 * @param : Connection
		 * @return : Nothing
		 */
	
	public static void setDbCon(Connection con) {
		dbCon = con;
		
	}
	//--------------------END------- set database connection------------
	
	//--------------------start------- get database connection------------
	
			/**
			 * @author : Ashik
			 * @Date   : 19-06-2026
			 * @version : v1.0
			 * @purpose : get Connection 
			 * @param : Nothing
			 * @return : Connection
			 */
		
		public static Connection getDbCon() {
			return dbCon;
			
		}
		//--------------------END------- get database connection------------
	
		//--------------------start------- closing connection------------
		
			/**
			 * @author : Ashik
			 * @Date   : 19-06-2026
			 * @version : v1.0
			 * @purpose : close Connection 
			 * @param : Nothing
			 *  @throws : Exception in case of closing Connection
			 * @return : Nothing
			 */
		
		public static void close() throws SQLException{
			dbCon.close();
			
		}
		//--------------------END------- closing connection------------
	
	
	
	
	

}
