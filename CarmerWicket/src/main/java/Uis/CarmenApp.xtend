package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema
import personajes.Villano
import java.io.Serializable
import org.uqbar.commons.model.UserException
import pista.Pista

class CarmenApp  implements Serializable{
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	@Property List<Villano> villanosSistema
	@Property Villano villanoSeleccionado
	@Property Pista caracteristicaSeleccionada
	@Property String exceptions

			
	new(){

		this.sistema = new SetUpCarmen().sistema	
		this.paisesSistema = listaDePaisesSistema
		this.villanosSistema = listaDeVillanosSistema
		this.exceptions=""
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
	
	
	
	def borra(Pais pais) {
		sistema.removerPais(pais)
	}
	
	def validarMapamundiEliminar(Pais pais){
		if(!pais.conexiones.empty)
			throw new UserException("No se puede eliminar este país, tiene conexiones")		
	}
	
	def eliminarVillano(Villano villano) {
		sistema.eliminarVillano(villano)
	}

	
	
}