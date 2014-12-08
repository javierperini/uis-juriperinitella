package com.example.domain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pista implements Serializable {
	String pista
	
	override toString(){
		pista
	}
}