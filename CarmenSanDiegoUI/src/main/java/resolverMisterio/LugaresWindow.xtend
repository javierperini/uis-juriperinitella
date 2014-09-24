package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List

class LugaresWindow extends SimpleWindow<ResolverAppModel> {
	
	new(WindowOwner parent, ResolverAppModel model, int posLugar) {
		super(parent, model)
		modelObject.lugarActual = model.paisActual.lugar(posLugar)
	}
	
	override createContents(Panel mainPanel){
		val panel = new Panel(mainPanel)
		panel.setLayout(new VerticalLayout)
		new Label(panel).setText("Estás Visitando: " + modelObject.lugarActual.nombre)
		if(modelObject.lugarActual.ocupante.puedeRevelarPista) {
			new Label(panel).setText(modelObject.interrogarOcupante)
		} else {
			new Label(panel).setText(modelObject.lugarActual.ocupante.getInformacion())
			if (modelObject.lugarActual.ocupante.getInformacion() == "Me encontraste!!"){
				if(modelObject.villanoAtrapado == null || modelObject.sistema.caso.villano.nombre != modelObject.villanoAtrapado.nombre){
					new FinDelJuegoPerdido(owner, modelObject).open
				}
				else{
					new FinDelJuegoGanado(owner, modelObject).open
				}
			}
		}
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}