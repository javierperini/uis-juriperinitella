package mapamundi

import detective.Pais
import detective.Sistema
import lugares.Lugar
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class MapamundiWindow extends Dialog<MapamundiAppModel> {
		
	new(WindowOwner owner, Sistema sistema) {
		super(owner, new MapamundiAppModel(sistema))
		title = "Mapamundi"
	}
	
	override createContents(Panel mainPanel) {
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))
		
		var Table<Pais> paises = new Table<Pais>(colPanel, Pais)
		paises.height = 200
		paises.bindItemsToProperty("sistema.paisesSistema")
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
			caracteristicas.height = 60
			caracteristicas.bindItemsToProperty("paisSeleccionado.caracteristicas")
//			new Column<String>(caracteristicas) => [
//				title = "Caracteristicas" 
//				bindContentsToProperty("nombre")
//			]
			var Table<Pais> conexiones = new Table<Pais>(it, Pais)
			conexiones.height = 60
			conexiones.bindItemsToProperty("paisSeleccionado.conexiones")
			new Column<Pais>(conexiones) => [
				title = "Conexiones" 
				bindContentsToProperty("nombre")
			]
			var Table<Lugar> lugares = new Table<Lugar>(it, Lugar)
			lugares.height = 60
			lugares.bindItemsToProperty("paisSeleccionado.lugares")
			new Column<Lugar>(lugares) => [
				title = "Lugares de Interés" 
				bindContentsToProperty("nombre")
			]	
		]
		
		new Button(colPanel) => [ 
				caption = "Eliminar"
				width = 50
				onClick [ | modelObject.removerPais ]
		]
		new Button(colPanel) => [
				caption = "Editar"
				width = 50
				onClick [ | new EditarPais(owner,  modelObject).open ]
//				onClick [ | new EditarPais(owner,  modelObject.sistema, modelObject.paisSeleccionado).open ]
		]
		new Button(colPanel) => [
				caption = "Nuevo"
				width = 50
				onClick [ | new NuevoPais(owner, modelObject).open ]
//				onClick [ | new NuevoPais(owner, modelObject.sistema).open ]
		]
		new Button(colPanel) => [
				caption = "Aceptar"
				width = 100
				onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) { }
	override protected createFormPanel(Panel arg0) { }
}