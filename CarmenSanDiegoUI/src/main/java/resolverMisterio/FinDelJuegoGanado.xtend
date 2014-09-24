package resolverMisterio

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button

class FinDelJuegoGanado extends FinDelJuego{
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
	}
	
	override texto(Panel mainPanel){
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		
		new Label(p).setText("Enhorabuena!!!")
		new Label(p).setText("Ha detenido a " + modelObject.villanoAtrapado.nombre + " y resuelto " + modelObject.sistema.caso.nombreCaso)
		new Label(p).setText("Felicitaciones!!!")
	}
	
	override button(Panel mainPanel){
		new Button(mainPanel) => [
			caption = "Disfrutar de nuestra victoria"
			onClick [ | close ]
		]
	}
}