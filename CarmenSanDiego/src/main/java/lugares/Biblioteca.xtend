package main.java.lugares

import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Biblioteca extends Lugar{
	/**
	 * Recibe una pista de lugar , una pista de senias caracteristicas
	 * y el 50% de las veces recibe una de hobbies
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}