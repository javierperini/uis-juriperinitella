package lugares

import java.util.List
import pista.Pista
import personajes.Personaje
import org.uqbar.commons.utils.Observable

@Observable
class Biblioteca extends Lugar {

	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - un PistaLugar 
	 * - un PistaSenia
	 * - un PistaHobbie (50% de chances de revelarse)
	 */
	new(String nombre, Personaje personaje, List<Pista> pistas) {
		super(nombre, personaje, pistas)
	}

	override pistasOcupante() {
		var rand = Math.random() * 1;
		var List<Pista> res = newArrayList

		if (ocupante.puedeRevelarPista) {
			res.add(pistas.get(0))
			res.add(pistas.get(1))
			if (Math.round(rand) == 1)
				res.add(pistas.get(2))
		}

		res
	}

}
