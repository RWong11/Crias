package Controladores;

import javax.swing.JOptionPane;

import com.teamdev.jxbrowser.chromium.Browser;
import com.teamdev.jxbrowser.chromium.JSValue;
import com.teamdev.jxbrowser.chromium.events.ConsoleEvent;
import com.teamdev.jxbrowser.chromium.events.ConsoleListener;
import com.teamdev.jxbrowser.chromium.events.ScriptContextAdapter;
import com.teamdev.jxbrowser.chromium.events.ScriptContextEvent;

import Aplicacion.Aplicacion;

public class AplControlador extends ScriptContextAdapter implements ConsoleListener {
	Aplicacion aplicacion;
	
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
	
	public void onMessage(ConsoleEvent event) {
        System.out.println(event.getLevel()+": "+event.getMessage());
    }
	// ----------------------------------------
	
	public void cargarVista(String vista, String controlador) {
		AplControlador aplControlador = null;
		if(controlador.equals("Crias")) 
			aplControlador = new CriaControlador(aplicacion);
		else if(controlador.equals("Otro")) {
			
		}
		
		aplicacion.cargarVista(vista, aplControlador);
	}
	
	public void salir() {
		int input = JOptionPane.showConfirmDialog(null, "Esta seguro que desea salir?", "Confirmacion", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
		
		if(input == 0)
			System.exit(0);
	}
}
