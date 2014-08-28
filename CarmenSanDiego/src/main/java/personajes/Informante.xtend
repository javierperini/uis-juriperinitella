package personajes

import personajes.Personaje
import lugares.Lugar

class Informante extends Personaje {
	
	new(String nombre) {
		super(nombre)
	}
	
	override getInformacion(Lugar lugar) {
		lugar.imprimirPistas
	}
	
}