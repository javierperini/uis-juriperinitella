package main.java.ui

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel
import main.java.detective.Pais
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout

class EditarCaracteristicas extends SimpleWindow<Pais> {
	
	new(WindowOwner owner, Pais pais) {
		super(owner, pais)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Caracteristicas")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		new Label(p) => [
			setWidth(200)
			setBackground(Color::LIGHT_GRAY)
			setText("Caracteristicas")
		]
		new List(p) => [
		bindItemsToProperty("caracteristicas")
		bindValueToProperty("caracSeleccionada")	
		]
		
		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | modelObject.quitarCaracteristica("caracSeleccionada")]
					bindEnabledToProperty("caracteristicas")
		]
		
//		var javi = new Panel(mainPanel).setLayout(new HorizontalLayout)
		
		
		
//		val form = new Panel(mainPanel)
//		form.setLayout(new ColumnLayout(2))
//		
//		new Label(form).setText("Nombre: ")
//		new TextBox(form).bindValueToProperty("nombre")
//		new Label(form).setText("Sexo")
//		new TextBox(form).bindValueToProperty("sexo")
//		new Label(form).setText("Señas Particulares: ")
//		new Button(form) => [
//			setBackground(Color::LIGHT_GRAY)
//			caption = "Editar Señas Particulares"
//					onClick [ | new EditarVillano(owner, modelObject).open ]
//		]

	}
	
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}