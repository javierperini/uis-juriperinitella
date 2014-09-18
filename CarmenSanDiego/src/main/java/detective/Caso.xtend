package detective

import java.util.List
import personajes.Villano
import org.uqbar.commons.utils.Observable

@Observable
class Caso {

	@Property Pais paisInicio
	@Property List<Pais> reocorridoVillano
	@Property Villano villano
	@Property String inicioCaso
	@Property String nombreCaso
	
	/**
	 * @param paisInicio el pais donde comienza la partida
	 * @param recorridoVillano el recorrido que hace el villano
	 * @param villano el sospecho del caso
	 * @param inicioCaso el informe inicial del robo
	 */
	new(Pais paisInicio, List<Pais> recorridoVillano, Villano villano, String inicioCaso,String nombreCaso){
		this.paisInicio=paisInicio
		this.reocorridoVillano=recorridoVillano
		this.villano=villano
		this.inicioCaso=inicioCaso
		this.nombreCaso=nombreCaso
		}
		
		new(){
			
		}
		
		def getDescripcion() '''
	   «inicioCaso»,
	   en «paisInicio.nombre» a las 9 horas del dia miercoles
	   el villano mas conocido como  «villano.nombre».
	   El sospechoso del caso es un «villano.sexo».
	   Él fue muy prolijo y la escena del crimen
	   no contaba con pista alguna,su misión 
	   como detective es desifrar el responsable de tal crímen y apresarlo.
	'''
		
	}