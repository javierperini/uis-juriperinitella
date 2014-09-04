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
	@Property List<PistaHobbie> hobbies
	@Property List<PistaSenia> seniasPart = new ArrayList<PistaSenia>()
	
//	new(String nombre, String sexo, PistaHobbie hobbie, PistaSenia seniasPart) {
//		super(nombre)
//		this.sexo=sexo
//		this.hobbie=hobbie
//		this.seniasPart=seniasPart
//	}
	
	new(){
		seniasPart = #[new PistaSenia("Hola, soy una pista"), new PistaSenia("javier feo"), new PistaSenia("anyi linda")]
		hobbies = #[new PistaHobbie("Hola, soy una pista"), new PistaHobbie("javier feo"), new PistaHobbie("anyi linda")]
		sexo = "jarcodeando la vida entera"
		
	}
	override getInformacion() {
		print("Me atrapaste!!")
	}
	
	override puedeRevelarPista() {
		false
	}
	
}