package dummieDomain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class ListaPersonas {
	@Accessors
	List<Persona> personas= newArrayList
	
	new(){
		this.personas.add(
			new Persona("Pepe"))
			
	}
}