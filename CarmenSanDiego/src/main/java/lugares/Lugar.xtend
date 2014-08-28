package lugares

import java.util.List
import pista.Pista
import personajes.Personaje

class Lugar {
	Personaje personaje
	List<Pista>pistas
	/**
	 * 
	 */
	new(Personaje personaje,List<Pista> lista){
		this.personaje= personaje
		this.pistas=lista
	}
	def pistas(){
		personaje.getInformacion(this)	
	}
	def imprimirPistas(){
		pistas.forEach[p|println(p.getPista)]
	}
	
	}