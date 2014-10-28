package lugares

import java.util.List
import pista.Pista
import personajes.Personaje



class Banco extends Lugar {

	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - un PistaLugar
	 * - un PistaSenia
	 */
	new(){	}
	
	new(String nombre, Personaje personaje, List<Pista> pistas) {
		super(nombre, personaje, pistas)
	}

	override pistasOcupante() {
		var List<Pista> res = newArrayList

		if (ocupante.puedeRevelarPista) {
			res.add(pistas.get(0))
			res.add(pistas.get(1))
		}

		res
	}
}
