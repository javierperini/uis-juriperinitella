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
	 
	new(Personaje personaje, List<Pista> pistas) {
		super(personaje, pistas)
	}

}