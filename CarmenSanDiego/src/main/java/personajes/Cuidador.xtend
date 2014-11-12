package personajes

import personajes.Personaje



class Cuidador extends Personaje {

	new(String nombre) {
		super(nombre)
	}
	new() {}

	override getInformacion() {
		"El cuidador " + this.nombre + " dice: Te equivocaste de país, el villano no paso por acá"
	}

	override puedeRevelarPista() {
		false
	}
}
