package resolverMisterio

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class FinDelJuegoPerdido extends FinDelJuego{
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
	}
	
	override texto(Panel mainPanel){
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		
		new Label(p).setText("Malas noticias :(")
		if(modelObject.villanoAtrapado != null)
			new Label(p).setText("Ha detenido a " + modelObject.sistema.caso.villano.nombre + " pero usted tenia una orden contra " + modelObject.villanoAtrapado.nombre)
		else
			new Label(p).setText("Ha detenido a " + modelObject.sistema.caso.villano.nombre + " pero usted no tenia una orden de arresto contra el")
		new Label(p).setText("Lamentablemente, este crimen quedará impune")
	}
	
	override button(Panel mainPanel){
		new Button(mainPanel) => [
			caption = "Aceptar el error cometido"
			onClick [ | close ]
		]
	}
}