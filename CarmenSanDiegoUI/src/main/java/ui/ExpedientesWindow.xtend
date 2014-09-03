package main.java.ui

import org.uqbar.arena.windows.MainWindow
import main.java.personajes.Villano
import org.uqbar.arena.widgets.Panel

class ExpedientesWindow extends MainWindow<Villano> {
	
	new() {
		super(new Villano())
	}
	
	override createContents(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}