package com.example.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Lugar implements Serializable{
	String nombre
	Pista pista
	
	override toString(){
		nombre
	}
	

	
	
}