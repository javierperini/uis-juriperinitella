package main.java.detective

import java.util.List
import main.java.personajes.Villano

class Caso {

	@Property Pais _paisInicio
	@Property List<Pais> _reocorridoVillano
	@Property Villano _villano
	@Property String _inicioCaso
	
	new(Pais paisInicio,List<Pais> recorridoVillano, Villano villano,String inicioCaso){
		_paisInicio=paisInicio
		_reocorridoVillano=recorridoVillano
		_villano=villano
		_inicioCaso=inicioCaso
		}
		
	}