package main.java.detective

import java.util.List
import main.java.personajes.Villano

class Caso {

	@Property Pais paisInicio
	@Property List<Pais> reocorridoVillano
	@Property Villano villano
	@Property String inicioCaso
	/**
	 * paisInicio   el pais donde comienza la partida
	 * recorridoVillano   el recorrido que hace el villano
	 * Villano   el sospecho del caso
	 * inicioCaso  el informe inicial del robo
	 */
	new(Pais paisInicio,List<Pais> recorridoVillano, Villano villano,String inicioCaso){
		this.paisInicio=paisInicio
		this.reocorridoVillano=recorridoVillano
		this.villano=villano
		this.inicioCaso=inicioCaso
		}
		
	}