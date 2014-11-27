package dummieDomain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

class Persona {
	@Accessors
	String nombre
	
	new(String nombre){
		this.nombre = nombre
	}
	
	override toString(){
		nombre
	}
}