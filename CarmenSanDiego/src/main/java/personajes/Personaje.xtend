package main.java.personajes

abstract class Personaje {
	@Property String nombre
	@Property String declaracion
	
	new(String nombre){
		this.nombre=nombre
	}
	
	def void getInformacion()
	
	def boolean puedeRevelarPista()
}