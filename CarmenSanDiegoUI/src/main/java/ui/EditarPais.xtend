package main.java.ui

import java.awt.Color
import main.java.detective.Pais
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EditarPais extends SimpleWindow<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
	
		
	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi - Editar País")

		new Label(mainPanel).setText("Nombre: ")
		new TextBox(mainPanel).bindValueToProperty("nombre")
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			setText = "Características"
		]
		new List(mainPanel) => [
			// TITULO REEMPLAZADO CON LABEL 
			allowNull(false)
			bindItemsToProperty("caracteristicas")
			bindValueToProperty("caracteristicas")
		]

		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Características"
					onClick [ | new EditarCaracteristicas(owner, modelObject).open ]
		]
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			setText = "Conexiones"
		]
//		var Table<Pais> tablaDeConexiones = new Table<Pais>(mainPanel, Pais)
//		tablaDeConexiones.bindItemsToProperty("conexiones")
//		tablaDeConexiones.width = 200
//		new Column<Pais>(tablaDeConexiones) => [
//			title = "Conexiones"
//			bindContentsToProperty("nombre")
//		]
		new List(mainPanel) => [
			bindItemsToProperty("conexiones")
			bindValueToProperty("nombre")
		]

		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Conexiones"
					onClick [ | new EditarConexiones(owner, modelObject).open ]
		]
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			setText = "Lugares de interés"
		]
//		var Table<Lugar> tablaLugares = new Table<Lugar>(mainPanel, Lugar)
//		tablaLugares.bindItemsToProperty("lugares")
//		tablaLugares.width = 200
//		new Column<Lugar>(tablaLugares) => [
//			title = "Lugares de interés"
//			bindContentsToProperty("nombre")
//		]
		new List(mainPanel) => [
			bindItemsToProperty("lugares")
			bindValueToProperty("nombre")		// ***CHEQUEAR ESTO***
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