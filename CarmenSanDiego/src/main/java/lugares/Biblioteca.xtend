package main.java.lugares

import java.util.List
import main.java.pista.Pista
import main.java.personajes.Personaje

class Biblioteca extends Lugar{
	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - un PistaLugar 
	 * - un PistaSenia
	 * - un PistaHobbie (50% de chances de revelarse)
	 */
	new(Personaje personaje, List<Pista> pistas) {
		super(personaje, pistas)
	}
	
	override imprimirPistas() {
		var rand = Math.random() * 1;
		
		ocupante.informacion
		
		if(ocupante.puedeRevelarPista) {
			println(pistas.get(0).pista)
			println(pistas.get(1).pista)
			if(Math.round(rand) == 1)
				println(pistas.get(2).pista)
		}
	}

}