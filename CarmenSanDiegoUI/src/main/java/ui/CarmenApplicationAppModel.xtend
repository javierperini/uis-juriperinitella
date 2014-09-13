package ui

class CarmenApplicationAppModel {
	@Property Sistema sistema
	@Property ExpedientesAppModel eam
	
	new(Sistema sistema) {
		sistema = sistema
		eap = new ExpedientesAppModel(sistema)
	}
	
	
}