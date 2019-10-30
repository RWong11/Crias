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
	
	public int registrarCuarentena(int id, String dieta) {
		return modelo.registrarCuarentena(id, dieta);
	}
	
	public int sacarCuarentena(int id) {
		return modelo.sacarCuarentena(id);
	}
	
	public int sacrificar(int id) {
		return modelo.sacrificar(id);
	}
	
	public String cargarMovimientos(int id) {
		String json = new Gson().toJson(modelo.cargarMovimientos(id));
		//System.out.println("JSON: " +json);
		return json;
	}
	
	public String toString() {
		return "Crias";
	}
}