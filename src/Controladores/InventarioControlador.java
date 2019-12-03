package Controladores;

import com.google.gson.Gson;

import Aplicacion.Aplicacion;
import Modelos.InventarioModelo;

public class InventarioControlador extends AplControlador {
	private InventarioModelo modelo = new InventarioModelo();
	
	public InventarioControlador(Aplicacion aplicacion) {
		super(aplicacion);
	}

	public String cargarSensores() {
		String json = new Gson().toJson(modelo.cargarSensores());
		return json;
	}
	
	public int eliminarSensor(String numSerie) {
		return modelo.eliminarSensor(numSerie);
	}
	
	public int registrarSensor(String numSerie) {
		return modelo.registrarSensor(numSerie);
	}

	public String toString() {
		return "Inventario";
	}
}