package detective

import java.util.List

class Pais {
	String nombre
	String caracteristica
	List<Pais> paises
	new(String nombre,String caracteristica,List<Pais>paises){
		this.nombre=nombre
		this.caracteristica=caracteristica
		this.paises=paises
	}
	def getGetNombre() {
		nombre
	}
	
	def getCaracteristicas() {
		caracteristica
	}
	
	def getGetPaisesLimitrofes() {
		paises
	}
	
}