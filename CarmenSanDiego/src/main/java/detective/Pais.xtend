package detective

import java.util.List
import lugares.Lugar

class Pais {
	@Property String nombre
	@Property String caracteristica
	@Property List<Pais> paises
	@Property List<Lugar> lugares
	new(String nombre,String caracteristica,List<Pais>paises,List<Lugar>lugares){
		this.nombre=nombre
		this.caracteristica=caracteristica
		this.paises=paises
		this.lugares=lugares
	}
	
	
}