package main.java.lugares

import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Banco extends Lugar {
	/**
	 * Recibe  una pista de lugar y una de senias caracteristicas
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}