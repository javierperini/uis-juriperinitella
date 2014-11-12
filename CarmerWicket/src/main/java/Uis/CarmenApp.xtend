package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema
import personajes.Villano

class CarmenApp {
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	@Property List<Villano> villanosSistema
	@Property Villano villanoSeleccionado
	
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


}