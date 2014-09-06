package main.java.personajes

import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList
import main.java.pista.Pista

@Observable
class Villano extends Personaje {
	@Property String sexo
	@Property List<PistaHobbie> hobbies = new ArrayList<PistaHobbie>()
	@Property List<PistaSenia> seniasPart = new ArrayList<PistaSenia>()
			  PistaSenia seniaSel
			  PistaHobbie hobbieSel
			  
	
//	new(String nombre, String sexo, PistaHobbie hobbie, PistaSenia seniasPart) {
//		super(nombre)
//		this.sexo=sexo
//		this.hobbie=hobbie
//		this.seniasPart=seniasPart
//	}
	
	new(){
		
		seniasPart.add(new PistaSenia("Hola, soy una pista"))
		seniasPart.add(new PistaSenia("javier feo"))
		seniasPart.add(new PistaSenia("anyi linda"))
		
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
	
}