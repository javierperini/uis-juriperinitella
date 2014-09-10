package main.java.ui

import main.java.detective.Pais
import main.java.detective.Sistema
import main.java.lugares.Lugar
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

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

			var Table<Pais> conexiones = new Table<Pais>(it, Pais)
			conexiones.bindItemsToProperty("paisSeleccionado.conexiones")
			new Column<Pais>(conexiones) => [
				title = "Conexiones" 
				bindContentsToProperty("nombre")
			]
			
			var Table<Lugar> lugares = new Table<Lugar>(it, Lugar)
			lugares.bindItemsToProperty("paisSeleccionado.lugares")
			new Column<Lugar>(lugares) => [
				title = "Lugares de Interés" 
				bindContentsToProperty("nombre")
			]	
		]
		
		new Button(colPanel) => [ 
				caption = "Eliminar"
				onClick [ | modelObject.removerPais ]
		]
		new Button(colPanel) => [
				caption = "Editar"
				onClick [ | new EditarPais(owner, modelObject.paisSeleccionado).open ]
		]
		new Button(colPanel) => [
				caption = "Nuevo"
				onClick [ | new NuevoPais(owner, modelObject).open ]
		]
		
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}