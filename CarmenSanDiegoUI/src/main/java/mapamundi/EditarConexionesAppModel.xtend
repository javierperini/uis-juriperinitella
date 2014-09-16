package mapamundi

import org.uqbar.commons.utils.Observable
import detective.Pais
import org.uqbar.commons.model.ObservableUtils
import detective.Sistema

@Observable
class EditarConexionesAppModel {
	@Property Pais pais
	@Property Pais conexionAEliminar
	@Property Pais conexionParaAgregar
	@Property Sistema sistema
	
	new (Pais p, Sistema s){
		pais = p
		sistema = s
	}
	
	def quitarConexion() {
		this.pais.conexiones.remove(conexionAEliminar)
		ObservableUtils.firePropertyChanged(this, "conexiones", pais.conexiones)
	}
	
	def agregarConexion() {
		this.pais.conexiones.add(conexionParaAgregar)
		ObservableUtils.firePropertyChanged(this, "conexiones", pais.conexiones)
	}
}