package expediente

import detective.Sistema
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano

class NuevoVillano extends EdicionVillano {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema, new Villano)
		title = "Expedientes - Nuevo Villano"
	}

	override botonAceptar(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
					onClick [ | modelObject.sistema.villanosSistema.add(modelObject.villanoSeleccionado)
								close
					]
		]
	}



}
