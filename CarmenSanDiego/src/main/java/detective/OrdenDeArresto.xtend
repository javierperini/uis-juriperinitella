package main.java.detective

import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import main.java.personajes.Villano

class OrdenDeArresto {
	
	@Property PistaHobbie pistaHobbie
	@Property PistaSenia pistaSenia
	@Property Villano villano
	/**
	 * Una orden de arresto se llena a medida que el detective va conociendo
	 *  al sospechoso
	 */
	new(){
	 this.pistaHobbie= null  		
	 this.pistaSenia= null
	 this.villano=null
	}
	

	
	
	
}