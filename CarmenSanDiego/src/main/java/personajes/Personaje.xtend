package main.java.personajes

import main.java.lugares.Lugar


abstract class Personaje {
	String nombre
	new(String nombre){
		this.nombre=nombre
	}
	def  void getInformacion(Lugar lugar)
}