package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema
import personajes.Villano
import java.io.Serializable

class CarmenApp  implements Serializable{
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	@Property List<Villano> villanosSistema
	@Property Villano villanoSeleccionado
	@Property String caracteristicaSeleccionada
	@Property Pais conexionSeleccionada	
	new(){

		this.sistema = new SetUpCarmen().sistema	
		this.paisesSistema = listaDePaisesSistema
		this.villanosSistema = listaDeVillanosSistema
	}

	def listaDePaisesSistema(){
		sistema.paisesSistema
	}
	
	def listaDeVillanosSistema(){
		sistema.villanosSistema
	}
	
	def eliminarPaisSeleccionado() {
		sistema.removerPais(paisSeleccionado)

		paisSeleccionado = null
	}
	
	def eliminarVillanoSeleccionado() {
		sistema.eliminarVillano(villanoSeleccionado)
		villanoSeleccionado = null
	}
	
	def esNuevo(Pais p) {
		!paisesSistema.contains(p)
	}
	
	def eliminarCaracteristica(Pais pais) {
		pais.quitarCaracteristica(caracteristicaSeleccionada)
	}
	
	def eliminarConexion(Pais pais) {
		pais.quitarConexion(conexionSeleccionada)
	}
	
	def creaPais(Pais pais) {
		sistema.agregarPais(pais)
	}
	
	def borra(Pais pais) {
		sistema.removerPais(pais)
	}
	
	


}