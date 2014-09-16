package expediente

import detective.Sistema
import personajes.Villano

class ExpedientesAppModel {

	@Property Sistema sistema
	@Property Villano villanoSeleccionado
	
	new(Sistema sistema){
		this.sistema = sistema
	}
	
	
}