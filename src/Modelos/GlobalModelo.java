package Modelos;

import java.util.ArrayList;
import java.util.List;

public class GlobalModelo {
	public List<SelectItem> cargarLista(int n) {
		List<SelectItem> lista = new ArrayList<SelectItem>();
		lista.add(new SelectItem(1, "Rojo"));
		lista.add(new SelectItem(2, "Azul"));
		lista.add(new SelectItem(5, "Verde"));
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
