package expediente

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano
import pista.PistaHobbie
import java.util.ArrayList
import pista.PistaSenia

class NuevoVillano extends EdicionVillano {
		ArrayList<PistaHobbie> pistaH=newArrayList
		ArrayList<PistaSenia> pistaB=newArrayList
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		modelObject.villanoSeleccionado = new Villano("", "", pistaH, pistaB)
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
