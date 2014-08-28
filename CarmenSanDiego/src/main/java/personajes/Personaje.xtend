package personajes

import lugares.Lugar


abstract class Personaje {
	String nombre
	new(String nombre){
		this.nombre=nombre
	}
	def  void getInformacion(Lugar lugar)
}