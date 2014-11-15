package Uis

import detective.Pais
import detective.Sistema
import pista.Pista
import java.util.List
import lugares.Lugar

class EdicionApp {
	
	@Property Sistema sistema
	@Property Pais paisEditar
	@Property List<Pista> caracteristicas
	@Property String nuevaCaracteristica
	@Property String nombre
	@Property String paisSeleccionado
	@Property List<Pais> conexiones
	@Property String lugarSeleccionado
	@Property List<Lugar>lugares
	
	new(Sistema sistema, Pais paisEditar){
		this.sistema=sistema
		this.paisEditar=paisEditar
		this.caracteristicas=this.paisEditar.caracteristicas
		this.nombre=this.paisEditar.nombre
		this.conexiones=this.paisEditar.conexiones
		this.lugares= this.paisEditar.lugares
	}
	
	def esNuevo() {
		!sistema.paisesSistema.contains(paisEditar)
	}
	
	def eliminarCaracteristica(Pista caracteristicaSeleccionada) {
		paisEditar.quitarCaracteristica(caracteristicaSeleccionada)
	}
	
	def creaPais() {
		sistema.agregarPais(paisEditar)
	}
	
	def borra(Pais pais) {
		sistema.removerPais(pais)
	}
	
	def borra() {
		sistema.removerPais(paisEditar)
	}
	
	def agregarCaracteristica() {
		paisEditar .agregarCaracteristica(new Pista(nuevaCaracteristica))
	}
	
	def agregarConexion() {
		paisEditar.agregarConexion(sistema.buscarPais(paisSeleccionado))
	}
	
	def eliminarConexion(Pais pais) {
		paisEditar.quitarConexion(pais)
	}
	
	def agregarLugar() {
		paisEditar.agregarLugar(sistema.getLugar(lugarSeleccionado))
	}
	
	def eliminarLugar(Lugar lugar) {
		paisEditar.quitarLugar(lugar)
	}
	

		


}