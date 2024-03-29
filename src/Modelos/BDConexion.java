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
			String url= "jdbc:sqlserver://localhost\\mssqlserver:1433;databaseName="+db+";user=sa;password=totopos;";
			//String url= "jdbc:sqlserver://localhost\\sqlexpress:49816;databaseName="+db+";user=sa;password=totopos;";
			//String url= "jdbc:sqlserver://10.10.99.113\\sqlutilerias;databaseName="+db+";user=rwong;password=456852;";
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