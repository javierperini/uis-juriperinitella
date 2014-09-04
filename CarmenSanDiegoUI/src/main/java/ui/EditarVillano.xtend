package main.java.ui

import org.uqbar.arena.windows.SimpleWindow
import main.java.personajes.Villano
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import java.awt.Color

class EditarVillano extends SimpleWindow<Villano>{
	
	new(WindowOwner parent, Villano model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Nuevo Villano")
		val form = new Panel(mainPanel)
		form.setLayout(new ColumnLayout(2))

		new Label(form).setText("Nombre: ")
		new TextBox(form).bindValueToProperty("nombre")
		new Label(form).setText("Sexo")
		new TextBox(form).bindValueToProperty("sexo")
		new Label(form).setText("Señas Particulares: ")
		

	}
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}