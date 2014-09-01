package main.java.personajes

import main.java.personajes.Personaje
import main.java.lugares.Lugar

class Villano extends Personaje {
	@Property String sexo
	@Property String hobbies
	@Property String seniasPart
	new(String nombre,String sexo,String hobbies,String seniasPart) {
		super(nombre)
		this.sexo=sexo
		this.hobbies=hobbies
		this.seniasPart=seniasPart
	}
	
	override getInformacion(Lugar lugar) {
		println("Me atrapaste!!!!")
	}
	
}