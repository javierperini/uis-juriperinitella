package expediente

import detective.Sistema
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano

class NuevoVillano extends EdicionVillano {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		modelObject.villanoSeleccionado = new Villano("", null, null, null)
		title = "Expedientes - Nuevo Villano"
	}

	override botonAceptar(Panel mainPanel) {
		new Button(mainPanel) => [
		//	setBackground(Color::LIGHT_GRAY)	
			caption = "Editar hobbies"
					onClick [ | new EditarHobbies(owner, modelObject).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
					onClick [ | modelObject.sistema.agregarVillanoALaLista(modelObject.villanoSeleccionado)
								close
					]
		]
	}



}
