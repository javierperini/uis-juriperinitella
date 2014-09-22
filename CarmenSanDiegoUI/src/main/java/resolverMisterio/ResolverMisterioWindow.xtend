package resolverMisterio

import detective.Sistema
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import detective.Pais
import org.uqbar.arena.widgets.tables.Column

class ResolverMisterioWindow extends SimpleWindow<Sistema> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner,sistema)
		title="Resolviendo :" +sistema.nombreCaso
	}
	
	override createContents(Panel mainPanel){
		val colPanel = new Panel(mainPanel)
			colPanel.setLayout(new ColumnLayout(2))
	
		new Panel(colPanel) => [
			layout = new HorizontalLayout
			new Label(it).setText("Estás en: ")
			new Label(it).setWidth(100).bindValueToProperty("paisActual.nombre")
		
		]
		new Label(colPanel).setText("Lugares")
		new Panel(colPanel)=>[
			layout =  new VerticalLayout
			new Panel(it)=>[
				layout = new HorizontalLayout
				new Label(it).setText("Orden ya emitida: ")
				new Label(it).setWidth(100).bindValueToProperty("ordenDeArresto.villano.nombre")
				]
			new Panel(it)=>[
				new Button(it) => [
					caption = "Orden de Arresto"
					width = 150
					onClick [ | ]
				]
				new Button(it) => [
					caption = "Viajar"
					width = 100
					onClick [ | ]
				]
				new Button(it) => [
					caption = "Expediente"
					width = 100
					onClick [ | ]
				]	
			
			]
		]
		new Panel(colPanel)=>[
			layout =  new VerticalLayout
			new Button(it) => [
				var lugar=modelObject.nombreDelLugar(0)
				caption = lugar
				width = 100
				onClick [ | ]
			]
			new Button(it) => [
				caption = modelObject.nombreDelLugar(1)
				width = 100
				onClick [ | ]
			]	
			new Button(it) => [
				caption = modelObject.nombreDelLugar(2)
				width = 100
				onClick [ | ]
			]
		]
		new Panel(colPanel)=>[
			layout= new VerticalLayout
			new Label(it).setText("Recorrido Criminal: ")
			new Label(it).setWidth(100).bindValueToProperty("paisesRecorridos")
			new Panel(it)=>[
				layout= new VerticalLayout
				new Label(it).setText("Destinos Fallido: ")
				var Table<Pais> paisesFallidos = new Table<Pais>(it, Pais)
					paisesFallidos.bindItemsToProperty("paisesFallidos")
				new Column<Pais>(paisesFallidos) => [
					title = "Paises Fallidos" 
					bindContentsToProperty("nombre")
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