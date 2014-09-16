package ui

import detective.Sistema
import expediente.ExpedientesAppModel

class CarmenApplicationAppModel {

	@Property Sistema sistema
	@Property ExpedientesAppModel eam
	
	new(Sistema sis) {
		sistema = sis
		eam = new ExpedientesAppModel()
	}
	
	
}