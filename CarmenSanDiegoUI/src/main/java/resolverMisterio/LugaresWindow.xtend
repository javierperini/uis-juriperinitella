package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout

class LugaresWindow extends SimpleWindow<ResolverAppModel> {
	
	new(WindowOwner parent, ResolverAppModel model, int posLugar) {
		super(parent, model)
		modelObject.lugarActual = model.paisActual.lugar(posLugar)
	}
	
	override createContents(Panel mainPanel){
		val panel = new Panel(mainPanel)
		panel.setLayout(new VerticalLayout)
		new Label(panel).setText("Estás Visitando: " + modelObject.paisActual.nombre)
		if(modelObject.lugarActual.ocupante.puedeRevelarPista) {
			new Label(panel).setText(modelObject.lugarActual.ocupante.declaracion)
		} else {
			new Label(panel).setText("que onda si no puede revelar la pista?")
		}
	}
	
	override protected addActions(Panel actionsPanel) { }
	
	override protected createFormPanel(Panel mainPanel) { }
	
}