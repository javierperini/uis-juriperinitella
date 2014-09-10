package lugares

import java.util.List
import personajes.Personaje
import pista.Pista
import org.uqbar.commons.utils.Observable

@Observable
class Lugar {
	@Property String nombre
	@Property Personaje ocupante
	@Property List<Pista> pistas
	
	new(Personaje ocupante,List<Pista> pistas){
		this.ocupante = ocupante
		this.pistas = pistas
	}

	def imprimirPistas(){
		ocupante.informacion
		
		if(ocupante.puedeRevelarPista)
			pistas.forEach[ print(it.pista + "\n") ]
	}
	
}