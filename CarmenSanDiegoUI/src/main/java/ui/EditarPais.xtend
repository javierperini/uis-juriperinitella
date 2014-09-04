package main.java.ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import main.java.detective.Pais
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import java.awt.Color
import main.java.lugares.Lugar

class EditarPais extends SimpleWindow<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
	
		
	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi - Nuevo País")

		new Label(mainPanel).setText("Nombre: ")
		new TextBox(mainPanel).bindValueToProperty("nombre")

		var Table<String> tablaDeCaracteristicas = new Table<String>(mainPanel, String)
		tablaDeCaracteristicas.bindItemsToProperty("caracteristicas")
		tablaDeCaracteristicas.width = 200
//		new Column<String>(tablaDeCaracteristicas) => [
//			title = "Características"
//			bindContentsToProperty("this")			// *** NO FUNCIONA ***
//		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Características"
					onClick [ | new EditarCaracteristicas(owner, modelObject).open ]
		]
		
		var Table<Pais> tablaDeConexiones = new Table<Pais>(mainPanel, Pais)
		tablaDeConexiones.bindItemsToProperty("conexiones")
		tablaDeConexiones.width = 200
		new Column<Pais>(tablaDeConexiones) => [
			title = "Conexiones"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Conexiones"
					onClick [ | new EditarConexiones(owner, modelObject).open ]
		]
		
		var Table<Lugar> tablaLugares = new Table<Lugar>(mainPanel, Lugar)
		tablaLugares.bindItemsToProperty("lugares")
		tablaLugares.width = 200
		new Column<Lugar>(tablaLugares) => [
			title = "Lugares de interés"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Lugares"
					onClick [ | new EditarLugaresInteres(owner, modelObject).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ |  close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}