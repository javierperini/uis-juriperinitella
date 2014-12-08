package com.example.domain

import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pais implements Serializable {
	String nombre
	List<Pais> conexiones
	List<Lugar> lugares
	
	new(String nombreNuevo){
		nombre=nombreNuevo
	}
	override toString(){
		nombre
	}
	
	def lugar(int i){
		lugares.get(i)	
	}
	
	
	
}