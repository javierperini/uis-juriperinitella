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
	List<Pais> paisesVisitados
	Boolean encontrasteAlVillano
	String descripcionCaso
	String paisesRecorridos
	
	
}