package Modelos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventarioModelo {
	public List<Sensor> cargarSensores() {
		List<Sensor> lista = new ArrayList<Sensor>();
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_CargarSensores");

			ResultSet rs = ps.executeQuery();
			while(rs.next())
				lista.add(new Sensor(rs.getString(1)));
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }

		return lista;
	}
	
	public int registrarSensor(String numSerie) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_RegistrarSensor ?");
			ps.setString(1, numSerie);
			
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public int eliminarSensor(String numSerie) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_EliminarSensor ?");
			ps.setString(1, numSerie);
			
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
}

class Sensor {
	private String numSerie;

	public Sensor(String numSerie) {
		this.numSerie = numSerie;
	}
}
