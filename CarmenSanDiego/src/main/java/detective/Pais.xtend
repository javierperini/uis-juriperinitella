package main.java.detective

import java.util.List
import main.java.lugares.Lugar
import org.uqbar.commons.utils.Observable
import java.util.Map.Entry
import org.uqbar.commons.model.ObservableUtils
import scala.util.control.Breaks.TryBlock
import java.util.ArrayList

@Observable
class Pais {
	@Property String nombre
	@Property List<String> caracteristicas = new ArrayList<String>()
	@Property List<Lugar> lugares
	@Property List<Pais> conexiones = new ArrayList<Pais>()
	@Property List<Pais> paisesLimitrofes
	@Property Lugar  lugarActual
	@Property String caracteristicaAEliminar
	@Property String caracteristicaParaAgregar
	@Property Pais conexionAEliminar
	@Property Pais conexionParaAgregar
	/**
	 * INV. REP.: Un pais representa un lugar fisico en el juego
	 * - Un pais no puede tener mas de 3 lugares para visitar.
	 * - Los lugares a visitar no pueden ser iguales
	 */
//	new(String nombre, String caracteristica, List<Lugar>lugares){
//		this.nombre=nombre
//		this.caracteristica=caracteristica
//		this.lugares=lugares
//	}

	new() {
//		caracteristicas = #["Caracteristica", "Caracteristica2", "Caracteristica3"]
		caracteristicas.add("Carac1")
		caracteristicas.add("Carac2")
		caracteristicas.add("Carac3")
	}
	/**
	 * i no puede ser <  a 0 ni > a 3
	 */
	def irALugar(int i){
		
		lugarActual= lugares.get(i-1);
	}
	
	def hablarConElPersonaje(){
		if(lugarActual != null){
		lugarActual.imprimirPistas	
		}else{
			//throw new exeptionNoEstaEnNingunLugar()
		}
	}
	
//	def setCaracteristicas(List<String> carac){
//		this._caracteristicas = carac
//		ObservableUtils.firePropertyChanged(this, "caracteristicas", carac )
//	}
	
	def quitarCaracteristica() {
		this.caracteristicas.remove(caracteristicaAEliminar)
		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
		}
	
	def agregarCaracteristica() {
		this.caracteristicas.add(caracteristicaParaAgregar)
		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
	}
	
	def quitarConexion() {
		this.conexiones.remove(conexionAEliminar)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}
	
	def agregarConexion() {
		this.conexiones.add(conexionParaAgregar)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}
	
	
}