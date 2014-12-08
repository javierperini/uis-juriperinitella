package com.example.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Sistema implements Serializable {
	Pais paisActual	
	List<Villano> villanosSistema
	Lugar lugar1
	Lugar lugar2
	Lugar Lugar3
	Pais paisAnterior
	
	def conexionesPaisActual(){
		paisActual.conexiones
	}
	def asignarLugares(){
	 	lugar1= paisActual.lugar(0)	
		lugar2= paisActual.lugar(1)	
		lugar3= paisActual.lugar(2)	
	}
}