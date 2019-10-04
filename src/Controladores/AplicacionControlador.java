package Controladores;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import b4.advancedgui.menu.AccordionItem;

public class AplicacionControlador extends MouseAdapter {
	
	public void mousePressed(MouseEvent e) {
        AccordionItem item = (AccordionItem) e.getSource();
        System.out.println("Source name: " + item.getName() + "; Source Title: " + item.getText());
    }
}
