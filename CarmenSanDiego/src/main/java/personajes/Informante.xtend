package personajes


import org.uqbar.commons.utils.Observable

@Observable
class Informante extends Personaje {

	new(String nombre) {
		super(nombre)
	}
	new() {}

	override puedeRevelarPista() {
		true
	}

	override getInformacion() {
		"El informante " + this.nombre + " dice: "
	}

}
