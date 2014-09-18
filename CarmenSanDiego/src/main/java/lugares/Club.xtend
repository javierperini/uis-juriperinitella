package lugares

import lugares.Lugar
import java.util.List
import pista.Pista
import personajes.Personaje
import org.uqbar.commons.utils.Observable

@Observable
class Club extends Lugar {
	/**
	 * INV. REP.: pistas debe estar compuesto por:
	 * - dos PistaSenia
	 * - un PistaHobbie  (70% de chances de revelarse)
	 */
	new(String nombre, Personaje personaje, List<Pista> lista) {
		super(nombre, personaje, lista)
	}
	
	override imprimirPistas() {
		var rand = Math.random() * 10;
		
		ocupante.informacion
		
		if(ocupante.puedeRevelarPista)
			println(pistas.get(0).pista)
			println(pistas.get(1).pista)
			if(Math.round(rand) <= 7)
				println(pistas.get(2).pista)
	}
	
}