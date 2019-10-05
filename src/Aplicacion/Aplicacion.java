package Aplicacion;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.*;

import com.kingaspx.util.BrowserUtil;
import com.kingaspx.version.Version;
import com.teamdev.jxbrowser.chromium.Browser;
import com.teamdev.jxbrowser.chromium.swing.BrowserView;

import Controladores.*;

public class Aplicacion extends JFrame {
	private Browser browser;
    private BrowserView browserView;
	private JPanel menu;
	private JPanel vista;
	
	public Aplicacion() {
		inicializarComponentes();
		abrirFrame();
	}
	
	public void inicializarComponentes() {
		BrowserUtil.setVersion(Version.V6_22);
		browser = new Browser();
        browserView = new BrowserView(browser);
		
		JPanel panel = new JPanel(new GridBagLayout());
		menu = new JPanel(new BorderLayout());
        vista = new JPanel(new BorderLayout());

        GridBagConstraints c = new GridBagConstraints();
        c.weightx = 1.0;
        c.fill = GridBagConstraints.BOTH;
        c.gridy = 0;
        c.weighty = 1;
        panel.add(menu, c);
        c.weightx = 4.0;
        panel.add(vista, c);
        
        add(panel);
        cargarMenu();
        cargarVista("registro", new CriaControlador(this));
        JButton btn = new JButton("Actualizar");
        btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				System.out.println(browser.getURL());
				browser.loadURL(browser.getURL());
			}
        	
        });

        this.vista.add(btn, BorderLayout.NORTH);
        this.vista.add(browserView, BorderLayout.CENTER);
        pack();
	}
	
	public void abrirFrame() {
		setTitle("Corrales Ternero");
		setSize(1000, 700);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	
	public void cargarVista(String vista, AplControlador controlador) {
		if(controlador == null) {
			//panel.add(new JLabel("No se encontro el controlador para la vista: " +vista), BorderLayout.CENTER);
			System.out.println("no controller found");
			revalidate();
			repaint();
			return;
		}
		System.out.println("hi2"); 
        browser.addScriptContextListener(controlador);
        browser.addConsoleListener(controlador);
        
        browser.loadURL(new File("src/Vistas/"+controlador+"/"+vista+".html").getAbsolutePath());
        //validate();
        System.out.println(browser.getURL());
	}
	
	public void cargarMenu() {
		Browser browser = new Browser();
        BrowserView browserView = new BrowserView(browser);
	        
        AplControlador controlador = new AplControlador(this);
        browser.addScriptContextListener(controlador);
        browser.addConsoleListener(controlador);
        
        browser.loadURL(new File("src/Vistas/menu.html").getAbsolutePath());
        menu.add(browserView, BorderLayout.CENTER);
	}

	public static void main(String[] args) {
		new Aplicacion();
	}
}