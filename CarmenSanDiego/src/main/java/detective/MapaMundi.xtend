package detective

import lugares.Lugar
import java.util.List

class MapaMundi {
	Pais pais
	
	new(Pais pais){
		this.pais=pais
	}
	def getNombrePais(){
		pais.getNombre
	}
	def getCaracteristicasPais(){
		pais.caracteristica
	}
	def getPaisesLimitrofes(){
		pais.paises
	}
	
	
	
}