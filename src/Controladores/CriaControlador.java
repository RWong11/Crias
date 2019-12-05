package Controladores;

import com.google.gson.Gson;

import Aplicacion.Aplicacion;
import Modelos.CriaModelo;

public class CriaControlador extends AplControlador {
	static int draw = 0;
	private static final String COLUMNAS[] = { "", "cri_id", "cla_id", "est_id", "cor_id", "ciu_descripcion", "proceso_actual" };
	private CriaModelo modelo = new CriaModelo();
	
	public CriaControlador(Aplicacion aplicacion) {
		super(aplicacion);
	}

	public String registrarCria(double peso, double grasa, int color, int ciudad) {
		String json = new Gson().toJson(modelo.registrarCria(peso, grasa, color, ciudad));
		//System.out.println(json);
		return json;
	}
	
	public String cargarCrias(int num) {
		String json = new Gson().toJson(modelo.cargarCrias(num));
		System.out.println("JSON: " +json);
		return json;
	}
	
	public String json(int draw, String search, int columna, String orderDir, int startRec, int pageSize, String clasificacion, String estado, String ciudad, String proceso) {
		String order = COLUMNAS[columna];
		String json = new Gson().toJson(modelo.cargarCrias_SS(draw, search, order, orderDir, startRec, pageSize, clasificacion, estado, ciudad, proceso));
		System.out.println("JSON: " +json);
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
	
	public int analizarCrias() {
		return modelo.analizarCrias();
	}
	
	public int asignarSensor(int id, String nSerie) {
		return modelo.asignarSensor(id, nSerie);
//		System.out.println(id);
//		return id % 2 == 0 ? 1: 0;
	}
	
	public String cargarMovimientos(int id) {
		String json = new Gson().toJson(modelo.cargarMovimientos(id));
		//System.out.println("JSON: " +json);
		return json;
	}
	
	public String consultarSensores() {
		String json = new Gson().toJson(modelo.consultarSensores());
		return json;
	}
	
	public int subirProceso(int id) {
		return modelo.subirProceso(id);
	}
	
	public String toString() {
		return "Crias";
	}
}