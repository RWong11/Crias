package Aplicacion;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.*;

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
        createSampleMenuStructure(menu);
        menu.setBackground(Color.white);
        menu.setForeground(Color.blue.darker().darker().darker());
        menu.setFont(new Font(Font.DIALOG_INPUT, Font.PLAIN, 15));
        menu.setSelectionColor(Color.lightGray);
        menu.setLeafHorizontalAlignment(AccordionItem.LEFT);
//        ImageIcon icon3 = new ImageIcon(this.getClass().getResource("b4/advancedgui/menu/resources/blu_arrow_right.png"));
//        ImageIcon icon4 = new ImageIcon(this.getClass().getResource("b4/advancedgui/menu/resources/blu_arrow_down.png"));
//        ImageIcon icon5 = new ImageIcon(this.getClass().getResource("b4/advancedgui/menu/resources/gray_arrow_right.png"));
//        ImageIcon icon6 = new ImageIcon(this.getClass().getResource("b4/advancedgui/menu/resources/green_arrow_right.png"));
//        menu.setMenuIcons(icon3, icon4);
//        menu.setLeafIcons("menu2", icon5, icon6);
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

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
    		layout.createSequentialGroup()
    		.addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(vista, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 678, Short.MAX_VALUE))
                .addContainerGap())
            //.addComponent(jpanel2))
        ));
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(vista, javax.swing.GroupLayout.DEFAULT_SIZE, 346, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addContainerGap())
            //.addComponent(jpanel2)
        );
      
        pack();
	}
	
	public void createSampleMenuStructure(AccordionMenu target) {
        target.addNewMenu("menu1", "Menu One");
        target.addNewLeafTo("menu1", "submenu1.1", "Sub Menu 1");
        target.addNewLeafTo("menu1", "submenu1.2", "Sub Menu 2");
        target.addNewLeafTo("menu1", "submenu1.3", "Sub Menu 3");

        target.addNewMenu("menu2", "Menu Two");
        target.addNewLeafTo("menu2", "submenu2.1", "Sub Menu 1");
        target.addNewLeafTo("menu2", "submenu2.2", "Sub Menu 2");
        target.addNewLeafTo("menu2", "submenu2.3", "Sub Menu 3");

        target.addNewMenu("menu3", "Menu Three");
        target.addNewLeafTo("menu3", "submenu3.1", "Sub Menu 1");
        target.addNewLeafTo("menu3", "submenu3.2", "Sub Menu 2");
        target.addNewLeafTo("menu3", "submenu3.3", "Sub Menu 3");

        target.addNewMenu("menu4", "Menu Four");
        target.addNewLeafTo("menu4", "submenu4.1", "Sub Menu 1");
        target.addNewLeafTo("menu4", "submenu4.2", "Sub Menu 2");
        target.addNewLeafTo("menu4", "submenu4.3", "Sub Menu 3");
        target.calculateAvaiableSpace();
    }

    /**
     * Simple example to browse all Leaf of menu. In this case for each leaf it adds a new Mouse Adapter.
     * @param menu Target Menu to modify.
     */
    public void setMouseAdapter(AccordionMenu menu) {
        for (AccordionLeafItem leaf : menu.getAllLeafs()) {
            leaf.addMouseListener(getSimpleMouseAdapter());
        }
    }

    /**
     * Creates a simple MouseAdapter binded to an AccordionItem. On mouse Pressed it writes on a textBox the source of event.
     * @return {@link MouseAdapter} object.
     */
    public MouseAdapter getSimpleMouseAdapter() {
        return new MouseAdapter() {

            @Override
            public void mousePressed(MouseEvent e) {
                AccordionItem item = (AccordionItem) e.getSource();
                System.out.println("Source name: " + item.getName() + "; Source Title: " + item.getText());
            }
        };
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
