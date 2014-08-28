package lugares

import lugares.Lugar
import java.util.List
import pista.Pista
import personajes.Personaje

class Club extends Lugar {
	/**
	 * Recibe dos pistas de senias caracteristicas
	 *  y el  70% de los casos recibe una de hobbies
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}