package dummieDomain

import org.eclipse.xtend.lib.annotations.Accessors

class Lugar {
	@Accessors
	String nombre
	String pista
	
	new(String nombre, String pista){
		this.nombre = nombre
		this.pista = pista
	}
}