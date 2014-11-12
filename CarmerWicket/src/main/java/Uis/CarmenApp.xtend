package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema
import personajes.Villano

class CarmenApp {
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	@Property List<Villano> villanosSistema
	@Property Villano villanoSeleccionado
	
	new(){

		this.sistema = new SetUpCarmen().sistema	
		this.paisesSistema = this.listaDePaisesSistema
		this.villanosSistema = this.listaDeVillanosSistema
	}

	def listaDePaisesSistema(){
		return this.sistema.paisesSistema
	}
	
	def listaDeVillanosSistema(){
		return this.sistema.villanosSistema
	}
	
	def eliminarVillanoSeleccionado() {
		this.sistema.elimarVillanoSeleccionado(this.villanoSeleccionado)
		this.villanosSistema = this.listaDeVillanosSistema
		this.villanoSeleccionado = null
	}


}