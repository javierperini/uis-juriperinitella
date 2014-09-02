package main.java.lugares

import main.java.lugares.Lugar
import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Embajada extends Lugar {
	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - dos PistaLugar
	 */
	 
	new(Personaje personaje, List<Pista> pistas) {
		super(personaje, pistas)
	}

}