package mapamundi

import org.uqbar.commons.utils.Observable
import detective.Pais
import org.uqbar.commons.model.ObservableUtils
import detective.Sistema
import lugares.Lugar

@Observable
class EditarLugaresInteresAppModel {
	@Property Pais pais
	@Property Lugar lugarAEliminar
	@Property Lugar lugarParaAgregar
	@Property Sistema sistema
	
	new (Pais p, Sistema s){
		pais = p
		sistema = s
	}
	
	def quitarLugar() {
		this.pais.lugares.remove(lugarAEliminar)
		ObservableUtils.firePropertyChanged(this, "pais.lugares", pais.lugares)
	}
	
	def agregarLugar() {
		this.pais.lugares.add(lugarParaAgregar)
		ObservableUtils.firePropertyChanged(this, "pais.lugares", pais.lugares)
	}
}