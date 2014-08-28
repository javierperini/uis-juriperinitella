package lugares

import lugares.Lugar
import java.util.List
import pista.Pista
import personajes.Personaje

class Embajada extends Lugar {
	/**
	 * Precondicon: Recibe solo dos pistas del lugar
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}