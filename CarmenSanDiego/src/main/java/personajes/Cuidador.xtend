package main.java.personajes

import main.java.personajes.Personaje
import main.java.lugares.Lugar

class Cuidador extends Personaje {
	
	new(String nombre) {
		super(nombre)
	}
	
	override getInformacion(Lugar lugar) {
		println("Te equivocaste de pais , el villano no paso por aca")	throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}