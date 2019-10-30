package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GlobalModelo {
//	public List<SelectItem> cargarLista(int n) {
//		List<SelectItem> lista = new ArrayList<SelectItem>();
//		lista.add(new SelectItem(1, "Rojo"));
//		lista.add(new SelectItem(2, "Azul"));
//		lista.add(new SelectItem(5, "Verde"));
//		return lista;
//	}
	
	public List<SelectItem> cargarLista(int n) {
		List<SelectItem> lista = new ArrayList<SelectItem>();
		try(Connection con = BDConexion.getConexion("pruebas")) {
			PreparedStatement ps = con.prepareStatement("EXEC Pa_CargarLista ?");
			ps.setInt(1, n);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				lista.add(new SelectItem(rs.getInt(1), rs.getString(2)));
		}
		catch(SQLException e) { 
			System.out.println(e.toString());
		}
		finally { BDConexion.cierraConexion(); }
		
		return lista;
	}
}

class SelectItem {
	private int value;
	private String text;
	
	public SelectItem(int value, String text) {
		this.value = value;
		this.text = text;
	}
}