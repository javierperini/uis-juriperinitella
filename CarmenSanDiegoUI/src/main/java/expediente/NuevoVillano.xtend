package expediente

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano

class NuevoVillano extends EdicionVillano {
		
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		modelObject.villanoSeleccionado = new Villano()
		title = "Expedientes - Nuevo Villano"
	}

	override botonAceptar(Panel mainPanel) {
		new Button(mainPanel) => [
			caption = "Aceptar"
					onClick [ | modelObject.sistema.agregarVillanoALaLista(modelObject.villanoSeleccionado)
								close
					]
		]
	}
}
