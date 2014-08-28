package lugares

import java.util.List
import pista.Pista
import personajes.Personaje

class Banco extends Lugar {
	/**
	 * Recibe  una pista de lugar y una de senias caracteristicas
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}