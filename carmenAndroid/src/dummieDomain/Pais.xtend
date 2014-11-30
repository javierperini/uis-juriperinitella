package dummieDomain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Pais {
	@Accessors
	String nombre
	List<Lugar> lugares
	
	new(String nombre, List<Lugar> lugares){
		this.nombre = nombre
		this.lugares = lugares
	}
	
	override toString(){
		nombre
	}
	
	def esPrimerPais(){
		true
	}
}