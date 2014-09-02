package main.java.lugares

import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Banco extends Lugar {
	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - un PistaLugar
	 * - un PistaSenia
	 */
	new(Personaje personaje, List<Pista> pistas) {
		super(personaje, pistas)
	}
	
}