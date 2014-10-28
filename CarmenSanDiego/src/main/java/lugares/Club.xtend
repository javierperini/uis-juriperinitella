package lugares

import lugares.Lugar
import java.util.List
import pista.Pista
import personajes.Personaje


class Club extends Lugar {

	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - dos PistaSenia
	 * - un PistaHobbie  (70% de chances de revelarse)
	 */
	new(){}
	new(String nombre, Personaje personaje, List<Pista> pistas) {
		super(nombre, personaje, pistas)
	}
	

	override pistasOcupante() {
		var rand = Math.random() * 10;
		var List<Pista> res = newArrayList

		if (ocupante.puedeRevelarPista) {
			res.add(pistas.get(0))
			res.add(pistas.get(1))
			if (Math.round(rand) <= 7)
				res.add(pistas.get(2))
		}

		res
	}

}
