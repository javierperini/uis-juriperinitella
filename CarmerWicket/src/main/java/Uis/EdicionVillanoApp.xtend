package Uis

import detective.Sistema
import personajes.Villano
import java.util.List
import pista.PistaHobbie
import pista.PistaSenia
import org.uqbar.commons.model.UserException

class EdicionVillanoApp {
	@Property Sistema sistema
	@Property Villano villano
	@Property String nombre
	@Property List<PistaHobbie> hobbies
	@Property String nuevoHobbie
	@Property List<PistaSenia> seniasParticulares
	@Property String nuevaPistaSenia
	@Property String sexo
	@Property List<String> sexos = newArrayList()
	@Property String sexoSeleccionado
	@Property String exceptions
	
	new (Sistema sistema, Villano villano){
		this.sistema = sistema
		this.villano = villano		
		this.nombre = villano.nombre
		this.hobbies = villano.hobbies
		this.sexo= villano.sexo
		this.seniasParticulares = villano.seniasParticulares
		this.sexos.add("Femenino");this.sexos.add("Masculino") 
	}
	
	def esNuevo(){
		!sistema.villanosSistema.contains(villano)
	}
	
	def eliminarVillano() {
		sistema.eliminarVillano(villano)
	}

	def crearVillano() {
		sistema.agregarVillanoALaLista(villano)
	}
	
	def eliminarHobbie(PistaHobbie hobbie){
		villano.quitarHobbie(hobbie)
	}
	
	def agregarNombre(){
		villano.setNombre(nombre)
	}
	
	def agregarHobbie(){
		villano.agregarHobbie(new PistaHobbie(nuevoHobbie))
	}
	
	def eliminarPistaSenia(PistaSenia p){
		villano.quitarSeniaParticular(p)
	}
	
	def agregarPistaSenia() {
		villano.agregarSeniaParticular(new PistaSenia(nuevaPistaSenia))
	}
	
	def agregarSexo() {
		villano.setSexo(sexoSeleccionado)
		setSexo(sexoSeleccionado)
	}
	
	def validarVillanoiAgregar() {
		if(nombreVillanoExiste(villano.nombre))
			throw new UserException("Elegí otro nombre, este villano ya existe")
	}
	
	def validarSeniasParticulares(){
		if(nuevaPistaSenia == null)
			throw new UserException("No se pueden agregar señas vacías")
		if(seniaExiste(nuevaPistaSenia))
			throw new UserException("No se pueden agregar señas repetidas")
	}
		
	def validarHobbies() {
		if(nuevoHobbie == null)
			throw new UserException("No se pueden agregar hobbies vacíos")
		if(hobbieExiste(nuevoHobbie))
			throw new UserException("No se pueden agregar hobbies repetidos")
		
	}
	
	def hobbieExiste(String hobbieNuevo) {
		var res=false
		for(var i = 0; i < sistema.villanosSistema.size(); i++){
			if(villano.hobbies.get(i).pista.toLowerCase == hobbieNuevo.toLowerCase)
				return true;
		}
		res
	}
	
	def seniaExiste(String seniaNueva){
		var res=false
		for(var i = 0; i < sistema.villanosSistema.size(); i++){
			if(villano.seniasParticulares.get(i).pista.toLowerCase == seniaNueva.toLowerCase)
				return true;
		}
		res
	}
	
	def nombreVillanoExiste(String nombreVillano) {
		var res=false
		for(var i = 0; i < sistema.villanosSistema.size(); i++){
			if(sistema.villanosSistema.get(i).nombre.toLowerCase == nombreVillano.toLowerCase)
				return true;
		}
		res
	}
	
}