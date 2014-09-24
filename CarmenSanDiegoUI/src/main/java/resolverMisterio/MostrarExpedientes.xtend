package resolverMisterio

import expediente.ExpedientesWindow
import org.uqbar.arena.windows.WindowOwner
import detective.Sistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class MostrarExpedientes extends ExpedientesWindow {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
	}
	
	override mostrarBotones(Panel mainPanel){
				new Button(mainPanel) => [
				caption = "Aceptar"
				width = 100
				onClick [ | close ]
		]	
	}
	
}