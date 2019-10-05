package Aplicacion;
import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.*;
import javax.swing.border.BevelBorder;

import com.kingaspx.util.BrowserUtil;
import com.kingaspx.version.Version;
import com.teamdev.jxbrowser.chromium.Browser;
import com.teamdev.jxbrowser.chromium.JSValue;
import com.teamdev.jxbrowser.chromium.events.ConsoleEvent;
import com.teamdev.jxbrowser.chromium.events.ConsoleListener;
import com.teamdev.jxbrowser.chromium.events.FinishLoadingEvent;
import com.teamdev.jxbrowser.chromium.events.LoadAdapter;
import com.teamdev.jxbrowser.chromium.events.ScriptContextAdapter;
import com.teamdev.jxbrowser.chromium.events.ScriptContextEvent;
import com.teamdev.jxbrowser.chromium.swing.BrowserView;

import Controladores.AplicacionControlador;
import Controladores.CriaControlador;
import b4.advancedgui.menu.*;

public class Aplicacion extends JFrame {
	private JPanel menu;
	private JPanel vista;
	
	public Aplicacion() {
		inicializarComponentes();
		abrirFrame();
	}
	
	public void inicializarComponentes() {
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
        BrowserUtil.setVersion(Version.V6_22);
        abrirMenu();
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
	
	public void abrirMenu() {
        Browser browser = new Browser();
        BrowserView browserView = new BrowserView(browser);
        
        browser.addScriptContextListener(new ScriptContextAdapter() {
            @Override
            public void onScriptContextCreated(ScriptContextEvent event) {
                Browser browser = event.getBrowser();
                JSValue window = browser.executeJavaScriptAndReturnValue("window");
                window.asObject().setProperty("java", new CriaControlador());
            }
        });
        
        browser.addConsoleListener(new ConsoleListener() {
            public void onMessage(ConsoleEvent event) {
                System.out.println(event.getLevel()+": "+event.getMessage());
            }
        });

        browser.loadURL(new File("src/Vistas/menu.html").getAbsolutePath());
        
        JButton btn = new JButton("Actualizar");
        btn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				System.out.println("holax");
				browser.loadURL(browser.getURL());
			}
        	
        });
        
        menu.add(btn, BorderLayout.NORTH);
        menu.add(browserView, BorderLayout.CENTER);
    }
	
	public void abrirVista() {
        Browser browser = new Browser();
        BrowserView browserView = new BrowserView(browser);

        browser.addLoadListener(new LoadAdapter() {
            @Override
            public void onFinishLoadingFrame(FinishLoadingEvent event) {
                if (event.isMainFrame()) {
                    System.out.println("HTML is loaded.");
                }
            }
        });
        
        browser.addScriptContextListener(new ScriptContextAdapter() {
            @Override
            public void onScriptContextCreated(ScriptContextEvent event) {
                Browser browser = event.getBrowser();
                JSValue window = browser.executeJavaScriptAndReturnValue("window");
                window.asObject().setProperty("java", new CriaControlador());
            }
        });
        
        browser.addConsoleListener(new ConsoleListener() {
            public void onMessage(ConsoleEvent event) {
                System.out.println(event.getLevel()+": "+event.getMessage());
            }
        });

        browser.loadURL(new File("src/Vistas/Crias/registro.html").getAbsolutePath());
        
        JButton btn = new JButton("Actualizar");
        btn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				System.out.println("holax");
				browser.loadURL(browser.getURL());
			}
        	
        });
        
        vista.add(btn, BorderLayout.NORTH);
        vista.add(browserView, BorderLayout.CENTER);
    }
	
	public static void main(String[] args) {
		new Aplicacion();
	}
}