package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDConexion {
	static private Connection conn;

	private BDConexion() {

	}

	static synchronized public Connection getConexion(String db) {
		if(conn == null) {
			String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName="+db+";user=tuusuario;password=tupassword;";
			try {
				conn = DriverManager.getConnection(url);
			} 
			catch (SQLException e) {
				return null;
			}
		}
		
		return conn;
	}

	static synchronized public void cierraConexion() {
		try {
			conn.close();
			conn = null;
		} 
		catch(SQLException E) {
			
		}
	}
}