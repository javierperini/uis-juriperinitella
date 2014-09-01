package main.java.lugares

import main.java.lugares.Lugar
import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Embajada extends Lugar {
	/**
	 * Precondicon: Recibe solo dos pistas del lugar
	 */
	new(Personaje personaje, List<Pista> lista) {
		super(personaje, lista)
	}
	
}