package main.java.detective

import java.util.List
import main.java.lugares.Lugar
import org.uqbar.commons.utils.Observable

@Observable
class Pais {
	@Property String nombre
	@Property List<String> caracteristicas
	@Property List<Lugar> lugares
	@Property List<Pais> conexiones
	@Property List<Pais> paisesLimitrofes
	@Property Lugar  lugarActual
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
		conexiones = #[]
		caracteristicas = #["Caracteristica", "Caracteristica2", "Caracteristica3"]
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
	
	
}