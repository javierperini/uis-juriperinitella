package dummieDomain

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

class Persona implements Serializable {
	@Accessors
	String nombre
	
	new(String nombre){
		this.nombre = nombre
	}
	
	override toString(){
		nombre
	}
}