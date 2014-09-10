package detective

import java.util.ArrayList
import java.util.List
import lugares.Lugar
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class Pais {
	@Property String nombre
	@Property List<String> caracteristicas = new ArrayList<String>()
	@Property List<Lugar> lugares = new ArrayList<Lugar>()
	@Property List<Pais> conexiones = new ArrayList<Pais>()
	@Property List<Pais> paisesLimitrofes
	@Property Lugar  lugarActual
	@Property String caracteristicaAEliminar
	@Property String caracteristicaParaAgregar
	@Property Pais conexionAEliminar
	@Property Pais conexionParaAgregar
	@Property Pais lugarAEliminar
	@Property Pais lugarParaAgregar

	/**
	 * INV. REP.: Un pais representa un lugar fisico en el juego
	 * - Un pais no puede tener mas de 3 lugares para visitar.
	 * - Los lugares a visitar no pueden ser iguales
	 */
	new(String nombre, List<String> caracteristicas, List<Lugar>lugares){
		this.nombre=nombre
		this.caracteristicas=caracteristicas
		this.lugares=lugares
	}

	new() { }
	
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
			throw new NoEstaEnNingunLugarException("No fuiste a ningun lugar")
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
	
	def quitarLugar() {
		this.conexiones.remove(lugarAEliminar)
		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}
	
	def agregarLugar() {
		this.conexiones.add(conexionParaAgregar)
		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}
	
	
}