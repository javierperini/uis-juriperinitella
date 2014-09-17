package mapamundi

import detective.Pais
import detective.Sistema
import lugares.Lugar
import org.uqbar.commons.utils.Observable

@Observable
class MapamundiAppModel {
	
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	@Property Pais conexionAEliminar
	@Property Pais conexionParaAgregar
	@Property Lugar lugarAEliminar
	@Property Lugar lugarParaAgregar
	@Property String caracteristicaAEliminar
	@Property String caracteristicaParaAgregar
	
	new(Sistema sistema) {
		this.sistema=sistema
	}
	
	def removerPais(){
		sistema.removerPais(paisSeleccionado)
	}
	
	def crearPais() {
		paisSeleccionado = new Pais
	}
	
	def agregarPaisALaLista(){
		sistema.agregarPais(paisSeleccionado)
	}
	
//	Metodos para la edicion de lugares de un pais
	def quitarLugar() {
		paisSeleccionado.quitarLugar(lugarAEliminar)
	}
	
	def agregarLugar() {
		paisSeleccionado.agregarLugar(lugarParaAgregar)
	}
	
//	Metodos para la edicion de las conexiones de un pais
	def quitarConexion() {
		paisSeleccionado.quitarConexion(conexionAEliminar)
	}
	
	def agregarConexion(){
		paisSeleccionado.agregarConexion(conexionParaAgregar)
	}
	
//	Metodos para la edicion de las caracteristicas de un pais	
	def quitarCaracteristica() {
		paisSeleccionado.quitarCaracteristica(caracteristicaAEliminar)
	}
	
	def agregarCaracteristica() {
		paisSeleccionado.agregarCaracteristica(caracteristicaParaAgregar)
	}
	
}