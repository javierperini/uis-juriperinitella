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
	@Property Pais paisSeleccionado=new Pais
	@Property List<Villano> villanosSistema
	@Property Villano villanoSeleccionado
	@Property Pista caracteristicaSeleccionada

			
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

	def creaPais(Pais pais) {
		sistema.agregarPais(pais)
	}
	
	def borra(Pais pais) {
		sistema.removerPais(pais)
	}
	
	def validarMapamundiEliminar(){
		if(!paisSeleccionado.conexiones.empty)
			throw new UserException("No se puede eliminar este país, tiene conexiones")		
	}
	
	def validarMapamundiAgregar(){
		if(nombrePaisExiste(paisSeleccionado.nombre))
			throw new UserException("Elegí otro nombre, este país ya existe")
		if(paisSeleccionado.conexiones.size() > 3)
			throw new UserException("Un país no puede tener más de tres conexiones")
	}
	
	def nombrePaisExiste(String pais) {
		var boolean res = false;
		for(var i = 0; i < sistema.paisesSistema.size(); i++){
			if(sistema.paisesSistema.get(i).nombre == pais)
				return true;
		}
		res
	}
	
	
	
}