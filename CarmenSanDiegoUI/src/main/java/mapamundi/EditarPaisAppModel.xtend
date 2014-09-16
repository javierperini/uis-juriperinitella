package mapamundi

import detective.Pais
import detective.Sistema
import org.uqbar.commons.utils.Observable

@Observable
class EditarPaisAppModel {
	@Property Pais pais
	@Property Sistema sistema
	
	new (Pais p, Sistema s){
		pais = p
		sistema = s
	}
	
}