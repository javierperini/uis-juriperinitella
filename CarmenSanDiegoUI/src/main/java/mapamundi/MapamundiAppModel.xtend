package mapamundi

import detective.Pais
import detective.Sistema
import java.util.ArrayList
import java.util.List
import lugares.Lugar
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Observable
class MapamundiAppModel {
	
	@Property Sistema sistema
	@Property List<Pais> paisesAMostrar = new ArrayList<Pais>()
	@Property Pais paisSeleccionado
	@Property Pais conexionAEliminar
	@Property Pais conexionParaAgregar
	@Property List<String> lugares =#["Club","Embajada","Biblioteca","Banco"]
	@Property String nombreLugarParaAgregar
	@Property Lugar lugarAEliminar
	@Property Lugar lugarParaAgregar
	@Property String caracteristicaAEliminar
	@Property String caracteristicaParaAgregar
	
	new(Sistema sistema) {
		this.sistema = sistema
		this.paisesAMostrar.addAll(sistema.paisesSistema)
	}
	
	def quitarPaisSeleccionado() {
		this.paisesAMostrar.remove(paisSeleccionado)
		ObservableUtils.firePropertyChanged(this, "paisesAMostrar", paisesAMostrar)
	}
	def agregarPaisSeleccionado(){
		paisesAMostrar.add(paisSeleccionado)
		ObservableUtils.firePropertyChanged(this, "paisesAMostrar", paisesAMostrar)
	}
	
	def removerPais(){
		sistema.removerPais(paisSeleccionado)
	}
	
	def crearPais() {
		paisSeleccionado = new Pais
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
		caracteristicaParaAgregar = ""
	}
	
	def isPuedeAgregarCaracteristica(){
		caracteristicaParaAgregar != null &&
		caracteristicaParaAgregar != "" &&
		!caracteristicaParaAgregar.startsWith(" ")
	}
	
	def setCaracteristicaParaAgregar(String carac){
		this._caracteristicaParaAgregar = carac
		ObservableUtils.firePropertyChanged(this, "puedeAgregarCaracteristica", puedeAgregarCaracteristica)
	}
	
	def agregarPaisALaLista() {
		sistema.agregarPais(paisSeleccionado)
	}
	
}