package personajes

import org.uqbar.commons.utils.Observable

@Observable
abstract class Personaje {
	@Property String nombre
	@Property String declaracion

	new(String nombre) {
		this.nombre = nombre
	}

	def String getInformacion()

	def boolean puedeRevelarPista()
}
