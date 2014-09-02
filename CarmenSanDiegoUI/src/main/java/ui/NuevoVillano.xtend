package main.java.ui

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel
import main.java.personajes.Villano
import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.arena.widgets.tables.Column

class NuevoVillano extends MainWindow<Villano>  {
	new() {
		super(new Villano)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Nuevo Villano")
		mainPanel.setLayout(new VerticalLayout)
		
		new Label(mainPanel).setText("Nombre: " + (new TextBox(mainPanel).bindValueToProperty("nombre")))
//		(new TextBox(mainPanel).bindValueToProperty("nombre"))
		new Label(mainPanel).setText("Flopi te amo!!")
		
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