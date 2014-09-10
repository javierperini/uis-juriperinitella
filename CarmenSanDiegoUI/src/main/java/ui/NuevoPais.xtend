package main.java.ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import main.java.detective.Sistema
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import java.awt.Color
import main.java.detective.Pais
import main.java.lugares.Lugar

// caracteristicas, conexiones, lugares de interes

class NuevoPais extends SimpleWindow<Sistema>{
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi - Nuevo País")

		new Label(mainPanel).setText("Nombre: ")
		new TextBox(mainPanel).bindValueToProperty("paisEnCreacion.nombre")

		var Table<String> tablaDeCaracteristicas = new Table<String>(mainPanel, String)
		tablaDeCaracteristicas.bindItemsToProperty("paisEnCreacion.caracteristicas")
		tablaDeCaracteristicas.width = 200
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Características"
					onClick [ | new EditarCaracteristicas(owner, modelObject.paisEnCreacion).open ]
		]
		
		var Table<Pais> tablaDeConexiones = new Table<Pais>(mainPanel, Pais)
		tablaDeConexiones.bindItemsToProperty("paisEnCreacion.conexiones")
		tablaDeConexiones.width = 200
		new Column<Pais>(tablaDeConexiones) => [
			title = "Conexiones"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Conexiones"
					onClick [ | new EditarConexiones(owner, modelObject.paisEnCreacion).open ]
		]
		
		var Table<Lugar> tablaLugares = new Table<Lugar>(mainPanel, Lugar)
		tablaLugares.bindItemsToProperty("paisEnCreacion.lugares")
		tablaLugares.width = 200
		new Column<Lugar>(tablaLugares) => [
			title = "Lugares de interés"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Lugares"
					onClick [ | new EditarLugaresInteres(owner, modelObject.paisEnCreacion).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			
					onClick [ |  
								close
							]
		]
	}
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel arg0) {
		
	}
		
		
}
