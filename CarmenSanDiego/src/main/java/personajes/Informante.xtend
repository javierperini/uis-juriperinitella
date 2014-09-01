package main.java.personajes

import main.java.personajes.Personaje
import main.java.lugares.Lugar

class Informante extends Personaje {
	
	new(String nombre) {
		super(nombre)
	}
	
	override getInformacion(Lugar lugar) {
		lugar.imprimirPistas
	}
	
}