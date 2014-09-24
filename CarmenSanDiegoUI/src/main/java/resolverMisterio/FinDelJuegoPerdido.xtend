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
		new Label(p).setText("A detenido a " + modelObject.villanoAtrapado.nombre + "pero usted tenia una orden contra" + modelObject.villanoAtrapado.nombre)
		new Label(p).setText("Lamentablemente este crimen quedara impune")
	}
	
	override button(Panel mainPanel){
		new Button(mainPanel) => [
			caption = "Aceptar el error cometido"
			onClick [ | close ]
		]
	}
}