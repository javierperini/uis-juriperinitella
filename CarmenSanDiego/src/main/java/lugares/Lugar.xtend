package main.java.lugares

import java.util.List
import main.java.personajes.Personaje
import main.java.pista.Pista

class Lugar {
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