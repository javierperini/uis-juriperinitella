package main.java.lugares

import main.java.lugares.Lugar
import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Club extends Lugar {
	/**
	 * Recibe dos pistas de senias caracteristicas
	 *  y el  70% de los casos recibe una de hobbies
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}