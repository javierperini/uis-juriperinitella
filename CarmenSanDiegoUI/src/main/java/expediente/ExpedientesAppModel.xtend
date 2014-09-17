package expediente

import detective.Sistema
import org.uqbar.commons.utils.Observable
import personajes.Villano
import pista.PistaHobbie
import pista.PistaSenia

@Observable
class ExpedientesAppModel {

	@Property Sistema sistema
	@Property Villano villanoSeleccionado
	@Property PistaSenia pistaSeniaSeleccionada
	@Property PistaSenia pistaSeniaParaAgregar
	@Property PistaHobbie pistaHobbieSeleccionada
	@Property PistaHobbie pistaHobbieParaAgregar
	
	new(Sistema sistema){
		this.sistema = sistema
	}
}