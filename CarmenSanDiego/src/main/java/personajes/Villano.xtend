package main.java.personajes

import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.ObservableUtils

@Observable
class Villano extends Personaje {
	@Property String sexo
	@Property List<PistaHobbie> hobbies =  newArrayList()
	@Property List<PistaSenia> seniasPart = newArrayList()
	@Property PistaSenia seniaSel
	@Property PistaHobbie hobbieSel
	@Property PistaSenia seniaPartAEliminar
	@Property PistaSenia caracteristicaParaAgregar
	@Property PistaSenia seniasPartParaAgregar	
	
			  
	
	new(String nombre, String sexo, List<PistaHobbie> hobbies, List<PistaSenia> seniasPart) {
		super(nombre)
		this.sexo = sexo
		this.hobbies = hobbies
		this.seniasPart = seniasPart
	}
	
	new(){
		
		var PistaSenia a=new PistaSenia("Hola, soy una pista")
		var PistaSenia b=new PistaSenia("javier feo")
		var PistaSenia c=new PistaSenia("anyi linda")
		seniasPart = #[a, b, c]
		
		hobbies.add(new PistaHobbie("Le gustan los pantalones azules"))
		hobbies.add(new PistaHobbie("Run beach Run"))
		hobbies.add(new PistaHobbie("Ayer se fue, agarro sus cosas y se puso a navegar"))
		sexo = "Mujer Amante"
		
	}
	override getInformacion() {
		print("Me atrapaste!!")
	}
	
	override puedeRevelarPista() {
		false
	}
	def setHobbie(PistaHobbie h){
		hobbies.add(h)
	}
	def	 setSeniasPart(PistaSenia p){
		seniasPart.add(p)
	}
	
	def quitarSeniaPart() {
		seniasPart.remove(seniaPartAEliminar)
		ObservableUtils.firePropertyChanged(this, "seniasPart", seniasPart)
	}
	
	def agregarSeniasPart() {
		seniasPart.add(caracteristicaParaAgregar)
		ObservableUtils.firePropertyChanged(this, "seniasPart", seniasPart)
	}
	
}