package personajes

import personajes.Personaje
import org.uqbar.commons.utils.Observable

@Observable
class Cuidador extends Personaje {
	
	new(String nombre) {
		super(nombre)
	}
	
	override getInformacion() {
		print( "El cuidador " + this.nombre + " dice: Te equivocaste de país, el villano no paso por acá\n" )
	}
	
	override puedeRevelarPista() {
		false
	}
	
}