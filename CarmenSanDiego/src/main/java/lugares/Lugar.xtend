package main.java.lugares

import java.util.List
import main.java.personajes.Personaje
import main.java.pista.Pista

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