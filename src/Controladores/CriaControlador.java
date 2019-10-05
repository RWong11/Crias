package Controladores;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import Aplicacion.Aplicacion;

public class CriaControlador extends AplControlador {
	
	public CriaControlador(Aplicacion aplicacion) {
		super(aplicacion);
	}
	
	public String cargarLista(int n) {
		List<SelectItem> lista = new ArrayList<SelectItem>();
		lista.add(new SelectItem(1, "Rojo"));
		lista.add(new SelectItem(2, "Azul"));
		lista.add(new SelectItem(5, "Verde"));
		return new Gson().toJson(lista);
	}
	
	public String toString() {
		return "Crias";
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