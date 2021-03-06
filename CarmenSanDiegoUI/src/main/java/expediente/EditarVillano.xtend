package expediente

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano

class EditarVillano extends EdicionVillano {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		title = "Expedientes - EditarVillano"
	}
	
	override botonAceptar(Panel mainPanel) {		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | close ]
		]
	}
}