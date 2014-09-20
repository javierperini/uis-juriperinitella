package mapamundi

import detective.Pais
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class EditarPais extends EdicionPais {
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
		title = "Mapamundi - Editar País"
	}
	
	override botonAceptar(Panel mainPanel) {		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | if(modelObject.paisSeleccionado.nombre == "") {
							//tirar error
						} else {
							close
						}
					]
		]
	}	
//	new(WindowOwner owner, Sistema sistema, Pais pais) {
//		super(owner, sistema, pais)
//		title = "Mapamundi - Editar País"
//	}
//	
//	override botonAceptar(Panel mainPanel) {		
//		new Button(mainPanel) => [
//			caption = "Aceptar"
//			onClick [ | close ]
//		]
//	}
	
}