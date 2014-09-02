package main.java.personajes

import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia

class Villano extends Personaje {
	@Property String sexo
	PistaHobbie hobbie
	PistaSenia seniasPart
	
//	new(String nombre, String sexo, PistaHobbie hobbie, PistaSenia seniasPart) {
//		super(nombre)
//		this.sexo=sexo
//		this.hobbie=hobbie
//		this.seniasPart=seniasPart
//	}
	
	override getInformacion() {
		print("Me atrapaste!!")
	}
	
	def String getSeniasPart() {
		seniasPart.pista
	}
	
	def String getHobbie() {
		hobbie.pista
	}
	
	override puedeRevelarPista() {
		false
	}
	
}