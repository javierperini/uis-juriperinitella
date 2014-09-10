package lugares

import java.util.List
import pista.Pista
import personajes.Personaje
import org.uqbar.commons.utils.Observable

@Observable
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