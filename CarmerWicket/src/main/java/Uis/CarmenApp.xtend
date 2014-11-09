package Uis

import detective.Pais
import detective.SetUpCarmen
import java.util.List
import detective.Sistema

class CarmenApp {
	@Property List<Pais> paisesSistema
	@Property Sistema sistema
	
	new(){
		this.sistema= new SetUpCarmen().sistema	
		this.paisesSistema=sistema.paisesSistema
	}
	
}