package Aplicacion;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;

import javax.swing.*;
import javax.swing.border.BevelBorder;

import com.teamdev.jxbrowser.browser.Browser;
import com.teamdev.jxbrowser.engine.Engine;
import com.teamdev.jxbrowser.engine.EngineOptions;
import com.teamdev.jxbrowser.engine.RenderingMode;
import com.teamdev.jxbrowser.view.swing.BrowserView;

import Controladores.AplicacionControlador;
import b4.advancedgui.menu.*;

public class Aplicacion extends JFrame {
	private AccordionMenu menu;
	private JPanel vista;
	
	public Aplicacion() {
		inicializarComponentes();
		abrirFrame();
	}
	
	public void inicializarComponentes() {
		JPanel panel = new JPanel(new GridBagLayout());
		JPanel cont = new JPanel();

        cont.setBackground(new java.awt.Color(153, 153, 153));
        cont.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
        cont.setLayout(new BoxLayout(cont, BoxLayout.LINE_AXIS));
        
        menu = new AccordionMenu();
        Configuraciones.crearEstructuraMenu(menu);
        setMouseAdapter(menu);
        cont.add(menu);
        
        vista = new JPanel();
        vista.add(new JButton("hola"));

        GridBagConstraints c = new GridBagConstraints();
        c.weightx = 1.0;
        c.fill = GridBagConstraints.BOTH;
        c.gridy = 0;
        c.weighty = 1;
        panel.add(cont, c);

        c.weightx = 4.0;
        panel.add(vista, c);
        
        add(panel);
        abrirVista();
        pack();
	}
	
    public void setMouseAdapter(AccordionMenu menu) {
        for (AccordionLeafItem leaf : menu.getAllLeafs()) {
            leaf.addMouseListener(new AplicacionControlador());
        }
    }
	
	public void abrirFrame() {
		setTitle("Crias");
		setSize(1000, 700);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public void abrirVista() {
		EngineOptions options = EngineOptions.newBuilder(RenderingMode.HARDWARE_ACCELERATED).licenseKey(Configuraciones.licencia).build();
		Engine engine = Engine.newInstance(options);
			 
		// Create the Browser
		Browser browser = engine.newBrowser();
		BrowserView view = BrowserView.newInstance(browser);

		vista.add(view);
		 
		browser.navigation().loadUrl("https://www.google.com");
	}
	
	public static void main(String[] args) {
		new Aplicacion();
	}
}