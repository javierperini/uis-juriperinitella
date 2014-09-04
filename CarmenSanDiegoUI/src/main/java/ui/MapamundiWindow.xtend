package main.java.ui

import org.uqbar.arena.windows.MainWindow
import main.java.detective.Sistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import main.java.detective.Pais
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import main.java.lugares.Lugar
import org.uqbar.arena.widgets.Button

class MapamundiWindow extends SimpleWindow<Sistema> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
	}
	
	override createContents(Panel mainPanel) {
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))
		
		var Table<Pais> paises = new Table<Pais>(colPanel, Pais)
		paises.bindItemsToProperty("paisesSistema")
		paises.bindValueToProperty("paisSeleccionado")
		new Column<Pais>(paises) => [
			title = "Paises" 
			bindContentsToProperty("nombre")
		]
		
		new Panel(colPanel) => [
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Nombre: ")
				new Label(it).setWidth(60).bindValueToProperty("paisSeleccionado.nombre")
			]
			
			var Table<String> caracteristicas = new Table<String>(it, String)
			caracteristicas.bindItemsToProperty("paisSeleccionado.caracteristicas")
//			caracteristicas.bindValueToProperty("seniasVillanoSeleccionado")
//			new Column<String>(caracteristicas) => [
//				title = "Características" 
//				bindContentsToProperty("this")		//????????
//			]
			
			var Table<Pais> conexiones = new Table<Pais>(it, Pais)
			conexiones.bindItemsToProperty("paisSeleccionado.conexiones")
//			conexiones.bindValueToProperty("hobbiesVillanoSeleccionado")
			new Column<Pais>(conexiones) => [
				title = "Conexiones" 
				bindContentsToProperty("nombre")
			]
			
			var Table<Lugar> lugares = new Table<Lugar>(it, Lugar)
			lugares.bindItemsToProperty("paisSeleccionado.lugares")
//			conexiones.bindValueToProperty("hobbiesVillanoSeleccionado")
			new Column<Lugar>(lugares) => [
				title = "Lugares de Interés" 
				bindContentsToProperty("nombre")
			]	
		]
		
		new Button(colPanel) => [
				caption = "Editar"
				onClick [ | new EditarPais(owner, modelObject.paisSeleccionado).open ]
		]
		new Button(colPanel) => [
				caption = "Nuevo"
				onClick [ | new NuevoPais(owner, modelObject).open ]
		]
		
		new Button(colPanel) => [
				caption = "Aceptar"
				onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}