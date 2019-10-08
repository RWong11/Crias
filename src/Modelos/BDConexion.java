<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d459051ed7a3e5510840e026dd3860029fb7e17c
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
			String url= "jdbc:sqlserver://10.10.99.113\\sqlutilerias;databaseName="+db+";user=rwong;password=456852;";
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
<<<<<<< HEAD
=======
=======
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
			String url= "jdbc:sqlserver://10.10.99.113\\sqlutilerias;databaseName="+db+";user=rwong;password=456852;";
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
>>>>>>> 8d7b97a7f652346f119c393899bc9f4d977f07ad
>>>>>>> d459051ed7a3e5510840e026dd3860029fb7e17c
}