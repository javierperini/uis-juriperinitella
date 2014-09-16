package mapamundi

import detective.Sistema
import detective.Pais
import org.uqbar.commons.utils.Observable

@Observable
class MapamundiAppModel {
	
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	@Property Pais paisEnCreacion
	
	new(Sistema sistema) {
		this.sistema=sistema
	}
	
	def removerPais(){
		sistema.removerPais(paisSeleccionado)
		
	}
	
	def crearPais() {
		paisEnCreacion = new Pais
	}
	
	def agregarPais(){
		sistema.agregarPais(paisEnCreacion)
		
	}
}