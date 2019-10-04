package Aplicacion;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.*;

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
        cont.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.LOWERED));
        cont.setLayout(new javax.swing.BoxLayout(cont, javax.swing.BoxLayout.LINE_AXIS));
        
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
	
	public static void main(String[] args) {
		new Aplicacion();
	}
}
