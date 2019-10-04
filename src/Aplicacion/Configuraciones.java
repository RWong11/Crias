package Aplicacion;

import java.awt.Color;
import java.awt.Font;

import b4.advancedgui.menu.AccordionMenu;

public final class Configuraciones {
	public static final String licencia = "1BNDHFSC1FT9UH5ZESOBF3O6U0WV7EWVAMFIILKJH40K57J3DRUKE1182LM7BG8WZHYKL1"; 
	
	public static void crearEstructuraMenu(AccordionMenu target) {
        target.addNewMenu("menu1", "Crias");
        target.addNewLeafTo("menu1", "1", "Consultar");
        target.addNewLeafTo("menu1", "2", "Registrar");

        target.addNewMenu("menu2", "Otro menu");
        target.addNewLeafTo("menu2", "5", "Sub Menu 1");
        target.addNewLeafTo("menu2", "6", "Sub Menu 2");

        target.addNewMenu("menu3", "Otro menu 3");
        target.addNewLeafTo("menu3", "10", "Sub Menu 1");
        target.addNewLeafTo("menu3", "11", "Sub Menu 2");
        target.addNewLeafTo("menu3", "12", "Sub Menu 3");

        target.calculateAvaiableSpace();
        
        target.setBackground(Color.white);
        target.setForeground(Color.blue.darker().darker().darker());
        target.setFont(new Font(Font.DIALOG_INPUT, Font.PLAIN, 15));
        target.setSelectionColor(Color.lightGray);
    }
}
