package main.java.detective

import java.util.List
import main.java.lugares.Lugar

class Pais {
	@Property String nombre
	@Property String caracteristica
	@Property List<Lugar> lugares
//	new(String nombre, String caracteristica, List<Lugar>lugares){
//		this.nombre=nombre
//		this.caracteristica=caracteristica
//		this.lugares=lugares
//	}
	
	new() {}
	
	
}