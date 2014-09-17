package mapamundi

import detective.Pais
import detective.Sistema
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class NuevoPais extends EdicionPais{
	
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema, new Pais())
		title = "Mapamundi - Nuevo Pais"
	}
	
	override botonAceptar(Panel mainPanel) {		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | modelObject.agregarPaisALaLista()
						close ]
		]
	}

	

		
		
}