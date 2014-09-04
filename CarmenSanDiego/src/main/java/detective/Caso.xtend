package main.java.detective

import java.util.List
import main.java.personajes.Villano
import org.uqbar.commons.utils.Observable

@Observable
class Caso {

	@Property Pais paisInicio
	@Property List<Pais> reocorridoVillano
	@Property Villano villano
	@Property String inicioCaso
	
	/**
	 * @param paisInicio el pais donde comienza la partida
	 * @param recorridoVillano el recorrido que hace el villano
	 * @param villano el sospecho del caso
	 * @param inicioCaso el informe inicial del robo
	 */
	new(Pais paisInicio, List<Pais> recorridoVillano, Villano villano, String inicioCaso){
		this.paisInicio=paisInicio
		this.reocorridoVillano=recorridoVillano
		this.villano=villano
		this.inicioCaso=inicioCaso
		}
		
	}