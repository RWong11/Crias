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

	public String toString() {
		return "Crias";
	}
}