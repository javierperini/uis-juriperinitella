package lugares

import java.util.List
import pista.Pista
import personajes.Personaje

class Biblioteca extends Lugar{
	/**
	 * Recibe una pista de lugar , una pista de senias caracteristicas
	 * y el 50% de las veces recibe una de hobbies
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}