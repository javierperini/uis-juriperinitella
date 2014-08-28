package personajes

import personajes.Personaje
import lugares.Lugar

class Cuidador extends Personaje {
	
	new(String nombre) {
		super(nombre)
	}
	
	override getInformacion(Lugar lugar) {
		println("Te equivocaste de pais , el villano no paso por aca")	
	}
	
}