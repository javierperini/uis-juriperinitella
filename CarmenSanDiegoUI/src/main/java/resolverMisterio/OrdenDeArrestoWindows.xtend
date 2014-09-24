package resolverMisterio

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano

class OrdenDeArrestoWindows extends SimpleWindow<ResolverAppModel> {
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
		title="Resolviendo :" +model.sistema.nombreCaso
	}
	override createContents(Panel mainPanel){
		val colPanel = new Panel(mainPanel)
			colPanel.setLayout(new VerticalLayout)
		labelOrdenDeArresto(colPanel)
		 selector(colPanel)
		
	}
	
	def labelOrdenDeArresto(Panel colPanel) {
		new Panel(colPanel)=>[
			layout=	new HorizontalLayout
			new Label(it).setText("Orden de arresto emitida contra: ")
		 	new Label(it).setWidth(100).bindValueToProperty("villanoAtrapado.nombre")
		 ]
	}
	
	def selector(Panel colPanel) {
		new Panel(colPanel)=>[
		 	layout=new ColumnLayout(2)
			new Label(it).setText("Villano:")
			new Selector(it) => [
				setWidth(100)
				bindItemsToProperty("sistema.villanosSistema").adapter = new PropertyAdapter(Villano, "nombre")
				bindValueToProperty("villanoAtrapado")
			]
		]
	  	new Button(colPanel) =>[
	 		caption = "Generar Orden de Arresto "
			width = 100
			onClick[| close	]
		 ]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}