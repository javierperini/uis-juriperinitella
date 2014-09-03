package main.java.ui

import main.java.personajes.Villano
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color


class NuevoVillano extends MainWindow<Villano>  {
	new() {
		super(new Villano)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Nuevo Villano")
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)	
		val algo = new Panel(mainPanel)
		algo.layout = new VerticalLayout
		
		new Label(form).setText("Nombre: ")
		new TextBox(form).bindValueToProperty("nombre")	
		new Label(form).setText("Sexo")
		new TextBox(form).bindValueToProperty("sexo")
		new Label(form).setText("Señas Particulares: ")
		new Button(form) => [
			setBackground(Color::LIGHT_GRAY)
			caption = "Editar Señas Particulares"
//			onClick [ | new NuevoPais().startApplication ]
		]
		new Label(algo).setText("Javi puto")
		
//		new ErrorsPanel(mainPanel, "nombre: ")
//
//		new Label(mainPanel).setText("Ingrese la longitud en millas")
//
//		new TextBox(mainPanel).bindValueToProperty("sexo")
//
//		new Button(mainPanel) => [
//			caption = "Convertir a kilÃ³metros"
//			onClick [ | this.modelObject.convertir ]
//		]
//
//		new Label(mainPanel)
//			.setBackground(Color::ORANGE)
//			.bindValueToProperty("kilometros")
//
//		new Label(mainPanel).setText(" kilÃ³metros")
	}

	def static main(String[] args) {
		
		new NuevoVillano().startApplication
	}

}