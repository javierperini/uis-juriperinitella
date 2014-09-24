package mapamundi

import detective.Pais
import detective.Sistema
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class NuevoPais extends EdicionPais{
	
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
		modelObject.paisSeleccionado = new Pais
		title = "Mapamundi - Nuevo Pais"
	}
	
	override botonAceptar(Panel mainPanel) {		
		new Button(mainPanel) => [
			caption = "Aceptar"
//			onClick [ | if(modelObject.paisSeleccionado.nombre == "") {
//							//tirar error
//						} else {
//							modelObject.agregarPaisALaLista()
//							close
//						}
//					]
			onClick [ | modelObject.agregarPaisSeleccionado()
//						modelObject.agregarPaisALaLista()
						close	
			]
			bindEnabledToProperty("paisSeleccionado.puedeAceptar")			
		]
	}

	

		
		
}