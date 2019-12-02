package Modelos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

public class CriaModelo {
	public int registrarCria(double peso, double grasa, int color) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			CallableStatement cs = con.prepareCall("EXEC Pa_RegistrarCria ?, ?, ?");
			cs.setDouble(1, peso);
			cs.setDouble(2, grasa);
			cs.setInt(3, color);

			ResultSet rs = cs.executeQuery();
			if(rs.next()) 
				resultado = rs.getInt(1);
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
			resultado = 0;
		}
		finally { BDConexion.cierraConexion(); }
		
		return resultado;
	}
	
	public List<Cria> cargarCrias(int num) {
		List<Cria> lista = new ArrayList<Cria>();
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_CargarCrias ?");
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				lista.add(new Cria(rs.getInt("cri_id"), rs.getInt("cla_id"), rs.getString("cla_descripcion"), rs.getDouble("cri_peso"), rs.getDouble("cri_grasa"), rs.getInt("col_id"), rs.getString("col_descripcion"), 
						rs.getInt("est_id"), rs.getString("est_descripcion"), rs.getInt("cor_id"), rs.getString("cor_descripcion"), rs.getString("dieta"), rs.getInt("proceso_actual"), rs.getString("sensor")));
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
				
		return lista;
	}
	
	public int registrarCuarentena(int id, String dieta) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_RegistrarCuarentena ?, ?");
			ps.setInt(1, id);
			ps.setString(2, dieta);
			
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public int sacarCuarentena(int id) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_SacarCuarentena ?");
			ps.setInt(1, id);
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public int sacrificar(int id) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_SacrificarCria ?");
			ps.setInt(1, id);
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public List<Movimiento> cargarMovimientos(int id) {
		List<Movimiento> lista = new ArrayList<Movimiento>();
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_LogCria ?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				lista.add(new Movimiento(rs.getString(1), rs.getString(2)));
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
				
		return lista;
	}
	
	public int subirProceso(int id) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_SubirProceso ?");
			ps.setInt(1, id);
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public int analizarCrias() {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			CallableStatement ps = con.prepareCall("EXEC Pa_PruebaSensor ?");
			ps.registerOutParameter(1, java.sql.Types.INTEGER);
			ps.execute();
			resultado = ps.getInt(1);
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public int asignarSensor(int id, String nSerie) {
		int resultado = 0;
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_AsignarSensor ?, ?");
			ps.setInt(1, id);
			ps.setString(2, nSerie);
			resultado = ps.executeUpdate();
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		return resultado;
	}
	
	public List<String> consultarSensores() {
		List<String> lista = new ArrayList<String>();
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_ConsSensoresLibres");

			ResultSet rs = ps.executeQuery();
			while(rs.next())
				lista.add(rs.getString(1));
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }

		return lista;
	}
}

class Cria {
	private int cri_id;
	private int cla_id;
	private String cla_descripcion;
	private double cri_peso;
	private double cri_grasa;
	private int col_id;
	private String col_descripcion;
	private int est_id;
	private String est_descripcion;
	private int cor_id;
	private String cor_descripcion;
	private String cri_dieta;
	private int proceso_actual;
	private String sensor;
	
	public Cria(int cri_id, int cla_id, String cla_descripcion, double cri_peso, double cri_grasa, int col_id, String col_descripcion, int est_id, String est_descripcion, int cor_id, String cor_descripcion, String cri_dieta, int proceso_actual, String sensor) {
		this.cri_id = cri_id;
		this.cla_id = cla_id;
		this.cla_descripcion = cla_descripcion;
		this.cri_peso = cri_peso;
		this.cri_grasa = cri_grasa;
		this.col_id = col_id;
		this.col_descripcion = col_descripcion;
		this.est_id = est_id;
		this.est_descripcion = est_descripcion;
		this.cor_id = cor_id;
		this.cor_descripcion = cor_descripcion;
		this.cri_dieta = cri_dieta;
		this.proceso_actual = proceso_actual;
		this.sensor = sensor;
	}
}

class Movimiento {
	private String movimiento;
	private String fecha;
	
	public Movimiento(String movimiento, String fecha) {
		this.movimiento = movimiento;
		this.fecha = fecha;
	}
}
