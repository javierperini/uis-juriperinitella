package com.example.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Villano implements Serializable {
	String nombre
	
	override toString(){
		nombre
	}
}