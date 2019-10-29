package Controladores;

import com.google.gson.Gson;

import Aplicacion.Aplicacion;
import Modelos.CriaModelo;

public class CriaControlador extends AplControlador {
	private CriaModelo modelo = new CriaModelo();
	
	public CriaControlador(Aplicacion aplicacion) {
		super(aplicacion);
	}

	public int registrarCria(double peso, double grasa, int color) {
		return modelo.registrarCria(peso, grasa, color);
	}
	
	public String cargarCrias() {
		String json = new Gson().toJson(modelo.cargarCrias());
		//System.out.println("JSON: " +json);
		return json;
	}
	
	public String toString() {
		return "Crias";
	}
}