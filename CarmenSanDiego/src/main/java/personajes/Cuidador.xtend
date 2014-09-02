package main.java.personajes

import main.java.personajes.Personaje

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