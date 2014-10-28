package detective

import java.util.List
import lugares.Lugar



class Pais {
	@Property String nombre
	@Property List<String> caracteristicas = newArrayList
	@Property List<Lugar> lugares = newArrayList
	@Property List<Pais> conexiones = newArrayList
	@Property List<Pais> paisesLimitrofes
	@Property Lugar lugarActual

	/**
	 * INV. REP.: Un pais representa un lugar fisico en el juego
	 * - Un pais no puede tener mas de 3 lugares para visitar.
	 * - Los lugares a visitar no pueden ser iguales
	 */
	new(String nombre, List<String> caracteristicas, List<Lugar> lugares, List<Pais> conexiones) {
		this.nombre = nombre
		this.caracteristicas = caracteristicas
		this.lugares = lugares
		this.conexiones = conexiones
	}

	new() {
	}

	/**
	 * i no puede ser <  a 0 ni > a 3
	 */
	def irALugar(int i) {
		lugarActual = lugares.get(i - 1);
	}

	def isPuedeAceptar() {
		nombre != null && nombre != "" && !nombre.startsWith(" ")
	}

	def setNombre(String nombre) {
		this._nombre = nombre
//		ObservableUtils.firePropertyChanged(this, "puedeAceptar", puedeAceptar)
	}

	//	def setCaracteristicas(List<String> carac){
	//		this._caracteristicas = carac
	//		ObservableUtils.firePropertyChanged(this, "caracteristicas", carac )
	//	}
	def quitarCaracteristica(String caracteristica) {
		this.caracteristicas.remove(caracteristica)
//		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
	}

	def agregarCaracteristica(String caracteristica) {
		this.caracteristicas.add(caracteristica)
//		ObservableUtils.firePropertyChanged(this, "caracteristicas", caracteristicas)
	}

	def agregarConexion(Pais conex) {
		this.conexiones.add(conex)
//		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}

	def quitarLugar(Lugar lugar) {
		lugares.remove(lugar)
//		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}

	def agregarLugar(Lugar lugar) {
		lugares.add(lugar)
//		ObservableUtils.firePropertyChanged(this, "lugares", lugares)
	}

	def quitarConexion(Pais pais) {
		conexiones.remove(pais)
//		ObservableUtils.firePropertyChanged(this, "conexiones", conexiones)
	}

	def lugar(int i) {
		lugares.get(i)
	}

}
