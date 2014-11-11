package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema
import personajes.Villano

class CarmenApp {
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	@Property List<Villano> villanosSistema
	
	new(){
		this.sistema= new SetUpCarmen().sistema	
		this.paisesSistema=sistema.paisesSistema
		this.villanosSistema = sistema.villanosSistema
	}
	
}