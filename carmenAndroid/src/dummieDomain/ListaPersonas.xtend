package dummieDomain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class ListaPersonas {
	@Accessors
	List<Persona> personas
	
	new(){
		this.personas = #[
			new Persona("Pepe"),
			new Persona("Pupo"),
			new Persona("Gumersindo")
		]
	}
}