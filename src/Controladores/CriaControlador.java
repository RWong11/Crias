package Controladores;

import com.google.gson.Gson;

import Aplicacion.Aplicacion;
import Modelos.CriaModelo;
import Modelos.GlobalModelo;

public class CriaControlador extends AplControlador {
	private CriaModelo modelo = new CriaModelo();
	
	public CriaControlador(Aplicacion aplicacion) {
		super(aplicacion);
	}

	public int registrarCria(double peso, double grasa, int color) {
		return modelo.registrarCria(peso, grasa, color);
	}
	
	public String toString() {
		return "Crias";
	}
}