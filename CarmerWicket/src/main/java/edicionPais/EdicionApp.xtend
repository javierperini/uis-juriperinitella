package edicionPais

import detective.Pais
import detective.Sistema
import java.io.Serializable
import java.util.List
import lugares.Lugar
import mapamundi.CarmenApp
import org.uqbar.commons.model.UserException
import pista.Pista

class EdicionApp implements Serializable {
	
	@Property Sistema sistema
	@Property Pais paisEditar
	@Property List<Pista> caracteristicas
	@Property String nuevaCaracteristica
	@Property String nombre
	@Property String paisSeleccionado
	@Property List<Pais> conexiones
	@Property String lugarSeleccionado
	@Property List<Lugar>lugares
	@Property String exceptions
	@Property CarmenApp carmen
	
	new(CarmenApp carmen, Pais paisEditar){
		this.carmen=carmen
		this.sistema=carmen.sistema
		this.paisEditar=paisEditar
		this.caracteristicas = this.paisEditar.caracteristicas
		this.nombre=this.paisEditar.nombre
		this.conexiones=this.paisEditar.conexiones
		this.lugares= this.paisEditar.lugares
		this.exceptions = ""
	}
	
	def esNuevo() {
		!sistema.paisesSistema.contains(paisEditar)
	}
	
	def eliminarCaracteristica(Pista caracteristicaSeleccionada) {
		paisEditar.quitarCaracteristica(caracteristicaSeleccionada)
	}
	
	def agregarNombre(){
		paisEditar.setNombre(nombre)
	}
	
	def creaPais() {
		sistema.agregarPais(paisEditar)
	}
	
	def borra(Pais pais) {
		sistema.removerPais(pais)
	}
	
	def borra() {
		sistema.removerPais(paisEditar)
	}
	
	def agregarCaracteristica() {
		paisEditar .agregarCaracteristica(new Pista(nuevaCaracteristica))
	}
	
	def agregarConexion() {
		paisEditar.agregarConexion(sistema.buscarPais(paisSeleccionado))
	}
	
	def eliminarConexion(Pais pais) {
		paisEditar.quitarConexion(pais)
	}
	
	def agregarLugar() {
		paisEditar.agregarLugar(sistema.getLugar(lugarSeleccionado))
	}
	
	def eliminarLugar(Lugar lugar) {
		paisEditar.quitarLugar(lugar)
	}
	
	def validarMapamundiAgregar(){
		validarNombreVacio
		if(nombrePaisExiste(paisEditar.nombre))
			throw new UserException("Elegí otro nombre, este país ya existe")
	}
	
	def validarConexiones(){
		if(paisSeleccionado == null)
			throw new UserException("No seleccionaste país a agregar")
		if(paisEditar.nombre == paisSeleccionado)
			throw new UserException("No se puede agregar a si mismo como conexión")
		if(paisEditar.conexiones.size() >= 3)
			throw new UserException("Un país no puede tener más de tres conexiones")
		if(paisEditar.conexiones.contains(sistema.buscarPais(paisSeleccionado)))
			throw new UserException("No se puede agregar dos veces el mismo país como conexión")
	}
	
	def validarCaracteristicas(){
		if(nuevaCaracteristica == null)
			throw new UserException("No se pueden agregar características vacías")
		if(caracteristicaExiste(nuevaCaracteristica))
			throw new UserException("No se pueden agregar características repetidas")
	}
		
	def validarLugares() {
		if(lugarSeleccionado == null)
			throw new UserException("No se pueden agregar lugares vacíos")
		if(lugarExiste(lugarSeleccionado))
			throw new UserException("No se pueden agregar lugares repetidos")
		if(paisEditar.lugares.size() >= 3)
			throw new UserException("Un país no puede tener más de tres lugares")
	}
	
	def nombrePaisExiste(String pais) {
		var boolean res = false;
		for(var i = 0; i < sistema.paisesSistema.size(); i++){
			if(sistema.paisesSistema.get(i).nombre.toLowerCase == pais.toLowerCase)
				return true;
		}
		res
	}
	
	def caracteristicaExiste(String carac){
		var boolean res = false;
		for(var i = 0; i < paisEditar.caracteristicas.size; i++){
			if(paisEditar.caracteristicas.get(i).pista.toLowerCase == carac.toLowerCase)
				return true;
		}
		res
	}
	
	def lugarExiste(String lugar){
		var boolean res = false;
		for(var i = 0; i < paisEditar.lugares.size; i++){
			if(paisEditar.lugares.get(i).nombre == lugar)
				return true;
		}
		res
	}
	
	def validarNombreVacio() {
		if(paisEditar.nombre == null || paisEditar.nombre == "")
			throw new UserException("Debés ingresar un nombre para tu pais")
	}

		


}