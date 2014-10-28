package lugares

import java.util.List

import personajes.Personaje
import pista.Pista


class Lugar {
	@Property 
	String nombre
	
	@Property 
	Personaje ocupante
	
	@Property 
	List<Pista> pistas
     new(){
     	
     }
	new(String nombre, Personaje ocupante, List<Pista> pistas) {
		this.nombre = nombre
		this.ocupante = ocupante
		this.pistas = pistas
	}

	def List<String> interrogarOcupante() {
		var List<String> res = newArrayList
		var List<Pista> pistasOcupante = pistasOcupante()
		res.add(ocupante.informacion)
		for (var i = 0; i < pistasOcupante.size(); i++) {
			res.add(pistasOcupante.get(i).pista)
		}

		//		pistasOcupante.forEach[ res.add(it.pista) ] :(
		res
	}

	def List<Pista> pistasOcupante() {
				if(ocupante.puedeRevelarPista)
					pistas
				else
					newArrayList
	}

}
