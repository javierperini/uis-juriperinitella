package detective

import lugares.Lugar
import java.util.List

class MapaMundi {
	Pais pais
	@Property List<Lugar>lugares
	new(Pais pais,List<Lugar>lugares){
		this.pais=pais
		this.lugares=lugares
	}
	def getNombrePais(){
		pais.getNombre
	}
	def getCaracteristicasPais(){
		pais.getCaracteristicas
	}
	def getPaisesLimitrofes(){
		pais.getPaisesLimitrofes
	}
	
	
	
}