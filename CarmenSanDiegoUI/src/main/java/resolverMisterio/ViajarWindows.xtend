package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import detective.Pais
import pista.Pista
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog

class ViajarWindows extends Dialog<ResolverAppModel> {
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
		title="Resolviendo :" + model.sistema.nombreCaso
	}
		
	override createContents(Panel mainPanel){
		val colPanel = new Panel(mainPanel)
			colPanel.setLayout(new VerticalLayout)
		new Label(colPanel).setText("Estás en: " +modelObject.paisActual.nombre)
		var Table<Pais> paisesTabla = new Table<Pais>(colPanel, Pais)
		paisesTabla.bindItemsToProperty("paisActual.conexiones")
		paisesTabla.bindValueToProperty("paisSeleccionado")
		new Column<Pais>(paisesTabla) => [
			title = "Posibles Destinos" 
			bindContentsToProperty("nombre")
		]
		new Panel(colPanel) => [
			layout= new HorizontalLayout
			new Button(it)=>[
				caption = "Volver al País anterior "
				width = 100
				modelObject.lugar(0)
				onClick [ | modelObject.volverAPaisAnterior
							close
				]
			
			]
			new Button(it)=>[
				caption = "Viajar "
				width = 100
				modelObject.lugar(0)
				onClick [ | modelObject.viajar
							close
						]
			
			]
		]
		
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}