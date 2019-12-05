package Aplicacion;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.io.File;
import java.nio.charset.Charset;
import java.util.logging.Level;

import javax.swing.*;

import com.kingaspx.util.BrowserUtil;
import com.kingaspx.version.Version;
import com.teamdev.jxbrowser.chromium.Browser;
import com.teamdev.jxbrowser.chromium.BrowserContext;
import com.teamdev.jxbrowser.chromium.BrowserPreferences;
import com.teamdev.jxbrowser.chromium.DataReceivedParams;
import com.teamdev.jxbrowser.chromium.LoggerProvider;
import com.teamdev.jxbrowser.chromium.NetworkService;
import com.teamdev.jxbrowser.chromium.events.ConsoleEvent;
import com.teamdev.jxbrowser.chromium.events.ConsoleListener;
import com.teamdev.jxbrowser.chromium.swing.BrowserView;
import com.teamdev.jxbrowser.chromium.swing.DefaultNetworkDelegate;

import Controladores.*;

public class Aplicacion extends JFrame {
	private Browser browser;
    private BrowserView browserView;
	private JPanel menu;
	private JPanel vista;
	private AplControlador controlador;
	
	public Aplicacion() {
		inicializarComponentes();
		abrirFrame();
	}
	
	public void abrirFrame() {
		setTitle("Corrales Ternero");
		setSize(1200, 600);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public void cargarVista(String vista, AplControlador controlador) {
		File file = new File("src/Vistas/"+controlador+"/"+vista+".html");
		browser.removeScriptContextListener(this.controlador);
		browser.addScriptContextListener(controlador);
		if(file.exists())
	        browser.loadURL(file.getAbsolutePath());
		else
			browser.loadURL(new File("src/Vistas/error.html").getAbsolutePath());
	}
	
	public void cargarMenu() {
		Browser browser = new Browser();
        BrowserView browserView = new BrowserView(browser);

        browser.addScriptContextListener(new AplControlador(this));
        browser.loadURL(new File("src/Vistas/menu.html").getAbsolutePath());
        menu.add(browserView, BorderLayout.CENTER);
	}

	public void mostrarSalir() {
		String prueba = "Swal.fire({" + 
				"  title: 'Salir'," + 
				"  text: '¿Esta seguro que desea salir de la aplicación?'," + 
				"  type: 'warning'," + 
				"  showCancelButton: true," + 
				"  cancelButtonColor: '#d33'," + 
				"  cancelButtonText: 'Cancelar'," + 
				"  confirmButtonText: 'Si'" + 
				"}).then((result) => {" + 
				"  if (result.value) {" + 
				"    window.java.salir(1) " +
				"  }" + 
				"})";
		browser.executeJavaScript(prueba);
	}
	
	public void inicializarComponentes() {
		BrowserUtil.setVersion(Version.V6_22);
		BrowserPreferences.setChromiumSwitches("--disable-web-security", "--allow-file-access-from-files");
		browser = new Browser();
        browserView = new BrowserView(browser);
		
		setLayout(new GridBagLayout());
		menu = new JPanel(new BorderLayout());
        vista = new JPanel(new BorderLayout());

        GridBagConstraints c = new GridBagConstraints();
        c.weightx = 1.0;
        c.fill = GridBagConstraints.BOTH;
        c.gridy = 0;
        c.weighty = 1;
        add(menu, c);
        c.weightx = 4.0;
        add(vista, c);

        cargarMenu();
        browser.loadURL(new File("src/Vistas/inicio.html").getAbsolutePath());
        
        browser.addConsoleListener(new ConsoleListener() {
        	public void onMessage(ConsoleEvent event) {
                System.out.println(event.getLevel()+": "+event.getMessage() + " (" +event.getLineNumber() + ")");
            }
        });

        vista.add(browserView, BorderLayout.CENTER);
        pack();
	}
	
	public static void main(String[] args) {
		new Aplicacion();
	}
}