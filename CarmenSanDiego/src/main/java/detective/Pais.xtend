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
	
	def quitarCaracteristica(String caracteristica) {
		this.caracteristicas.remove(caracteristica)
		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
		}
	
	def agregarCaracteristica(String caracteristica) {
		this.caracteristicas.add(caracteristica)
		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
	}
	
	def agregarConexion(Pais conex) {
		this.conexiones.add(conex)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}
	
	def quitarLugar(Lugar lugar) {
		lugares.remove(lugar)
		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}
	
	def agregarLugar(Lugar lugar) {
		lugares.add(lugar)
		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}
	
	def quitarConexion(Pais pais) {
		conexiones.remove(pais)
		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}
	
	
}