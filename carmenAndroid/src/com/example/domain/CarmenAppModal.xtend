package com.example.domain

import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarmenAppModal implements Serializable {
	Sistema sistema
	Pais paisActual
	List<Lugar> lugares
	Pais paisAnterior
	Villano villanoOrden= new Villano("")
	String paisesRecorridos
	List<Pais>paisesVisitados
	
	def conexionesPaisActual() {
		paisActual.conexiones
	}
	

	def asignarSistema(Sistema s) {
		sistema = s
		paisesRecorridos =sistema.paisesRecorridos
		paisActual = s.paisActual
		paisAnterior = s.paisAnterior
		lugares=paisActual.lugares
	}
	def getDescripcionCaso(){
		sistema.descripcionCaso
	}

	def villanosSistema(){
		sistema.villanosSistema
	}
	
	def lugar(int i){
		lugares.get(i)
	}
	
	def esPrimerPais() {
		sistema.paisesVisitados.size ==1
	}
	
	def paisSinConexiones(){
		paisActual.conexiones.size == 0
	}
	
}
