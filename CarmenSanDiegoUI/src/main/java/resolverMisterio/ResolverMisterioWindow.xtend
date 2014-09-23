package resolverMisterio

import detective.Pais
import detective.Sistema
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class ResolverMisterioWindow extends Dialog<ResolverAppModel> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner,new ResolverAppModel(sistema))
		title="Resolviendo :" +sistema.nombreCaso
	}
	
	override createContents(Panel mainPanel){
		val colPanel = new Panel(mainPanel)
			colPanel.setLayout(new ColumnLayout(2))
		panelDeArriba(colPanel)
		panelDeAcciones(colPanel)
		panelBotonesDeLugar(colPanel)
		panelPaisesVisitados(colPanel)
	}
	
	def panelDeArriba(Panel colPanel) {
		new Panel(colPanel) => [
			layout = new HorizontalLayout
			new Label(it).setText("Estás en: ")
			new Label(it).setWidth(100).bindValueToProperty("paisActual.nombre")
			
			]
		new Label(colPanel).setText("Lugares")
	}
	
	def panelPaisesVisitados(Panel colPanel) {
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
	
	def panelBotonesDeLugar(Panel colPanel) {
		new Panel(colPanel)=>[
			layout =  new VerticalLayout
			new Button(it) => [
				var lugar2=modelObject.nombreDelLugar(0)
				caption = lugar2
				width = 100
				modelObject.lugar(0)
				onClick [ | new LugaresWindows(owner,modelObject).open ]
			]
			new Button(it) => [
				caption = modelObject.nombreDelLugar(1)
				width = 100
				onClick [ | new LugaresWindows(owner,modelObject).open ]
			]	
			new Button(it) => [
				caption = modelObject.nombreDelLugar(2)
				width = 100
				onClick [ | new LugaresWindows(owner,modelObject).open]
			]
		]
	}
	
	def panelDeAcciones(Panel colPanel) {
		new Panel(colPanel)=>[
			layout =  new VerticalLayout
			new Panel(it)=>[
				layout = new HorizontalLayout
				new Label(it).setText("Orden ya emitida: ")
				new Label(it).setWidth(100).bindValueToProperty("sistema.ordenDeArresto.villano.nombre")
				]
			new Panel(it)=>[
				new Button(it) => [
					caption = "Orden de Arresto"
					width = 150
					onClick [ | new OrdenDeArrestoWindows(owner,modelObject).open]
				]
				new Button(it) => [
					caption = "Viajar"
					width = 100
					onClick [ | new ViajarWindows(owner,modelObject).open ]
				]
				new Button(it) => [
					caption = "Expediente"
					width = 100
					onClick [ | ]
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