package Controladores;

import com.google.gson.Gson;
import com.teamdev.jxbrowser.chromium.Browser;
import com.teamdev.jxbrowser.chromium.JSValue;
import com.teamdev.jxbrowser.chromium.events.ScriptContextAdapter;
import com.teamdev.jxbrowser.chromium.events.ScriptContextEvent;

import Aplicacion.Aplicacion;
import Modelos.GlobalModelo;

public class AplControlador extends ScriptContextAdapter {
	private Aplicacion aplicacion;
	
	public AplControlador(Aplicacion aplicacion) {
		this.aplicacion = aplicacion;
	}
	
	// SOBREESCRITOS
	// ----------------------------------------
	public void onScriptContextCreated(ScriptContextEvent event) {
        Browser browser = event.getBrowser();
        JSValue window = browser.executeJavaScriptAndReturnValue("window");
        window.asObject().setProperty("java", this);
    }
	public String toString() {
		return "../..";
	}
	// ----------------------------------------
	
	public void cargarVista(String vista, String controlador) {
		AplControlador aplControlador = new AplControlador(aplicacion);
		if(controlador.equals("Crias")) 
			aplControlador = new CriaControlador(aplicacion);
		else if(controlador.equals("Otro")) {
			
		}
		
		aplicacion.cargarVista(vista, aplControlador);
	}
	
	/*public void salir() {
		int input = JOptionPane.showConfirmDialog(null, "Esta seguro que desea salir?", "Confirmacion", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
		
		if(input == 0)
			System.exit(0);
	}*/
	
	public void salir(int accion) {
		if(accion == 1)
			System.exit(0);
		else 
			aplicacion.mostrarSalir();
	}
	
	public String cargarLista(int n) {
		String json = new Gson().toJson(new GlobalModelo().cargarLista(n));
		return json;
	}
}