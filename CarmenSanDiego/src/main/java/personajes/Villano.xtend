package personajes

import java.util.List
import pista.PistaHobbie
import pista.PistaSenia

import org.uqbar.commons.utils.Observable

@Observable
class Villano extends Personaje {
	@Property String sexo
	@Property List<PistaHobbie> hobbies = newArrayList()
	@Property List<PistaSenia> seniasParticulares = newArrayList()

	new(String nombre, String sexo, List<PistaHobbie> hobbies, List<PistaSenia> seniasPart) {
		super(nombre)
		this.sexo = sexo
		this.hobbies = hobbies
		this.seniasParticulares = seniasPart
	}
	
	new() {}

	override getInformacion() {
		"ALTO! Deténgase, villano!!!"
	}

	override puedeRevelarPista() {
		false
	}
	 
	override estasArrestado(){
		true
	}
	def setHobbie(PistaHobbie h) {
		hobbies.add(h)
	}

	def setSeniasPart(PistaSenia p) {
		getSeniasParticulares.add(p)
	}

	def quitarSeniaParticular(PistaSenia pista) {
		seniasParticulares.remove(pista)
//		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}

	def agregarSeniaParticular(PistaSenia pista) {
		seniasParticulares.add(pista)
//		ObservableUtils.firePropertyChanged(this, "seniasParticulares", seniasParticulares)
	}

	def quitarHobbie(PistaHobbie pista) {
		hobbies.remove(pista)
//		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}

	def agregarHobbie(PistaHobbie pista) {
		hobbies.add(pista)
//		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
}
