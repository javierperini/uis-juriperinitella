package Uis

import detective.Sistema
import personajes.Villano
import java.util.List
import pista.PistaHobbie
import pista.PistaSenia

class EdicionVillanoApp {
	@Property Sistema sistema
	@Property Villano villano
	@Property String nombre
	@Property List<PistaHobbie> hobbies
	@Property String nuevoHobbie
	@Property List<PistaSenia> seniasParticulares
	@Property String nuevaPistaSenia
	@Property List<String> sexos = newArrayList()
	@Property String sexoSeleccionado
	
	new (Sistema sistema, Villano villano){
		this.sistema = sistema
		this.villano = villano		
		this.nombre = villano.nombre
		this.hobbies = villano.hobbies
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
		villano.agregarSexo(sexoSeleccionado)
	}
	
}