package lugares

import lugares.Lugar
import java.util.List
import pista.Pista
import personajes.Personaje
import org.uqbar.commons.utils.Observable

@Observable
class Embajada extends Lugar {
	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - dos PistaLugar
	 */
	 
	new(String nombre, Personaje personaje, List<Pista> pistas) {
		super(nombre, personaje, pistas)
	}

}