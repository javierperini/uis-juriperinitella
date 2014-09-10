package personajes

import org.uqbar.commons.utils.Observable

@Observable
abstract class Personaje {
	@Property String nombre
	@Property String declaracion
	
	new(String nombre){
		this.nombre=nombre
	}
	
	new(){}
	
	def void getInformacion()
	
	def boolean puedeRevelarPista()
}