package detective

import java.util.List
import personajes.Villano

class Sistema {
	
	@Property Caso _caso
	@Property List<Pais> _paisesSistema
	@Property List<Villano> _villanosSistema
			  Pais _paisActual
			  List<Pais> _paisesVisitados
			  Villano _villanoArrestar
	
	new(Caso caso,List<Pais>paisesSistema,List<Villano> villanosSistema){
		_caso=caso
		_paisesSistema=paisesSistema
		_villanosSistema=villanosSistema
		_paisActual=caso.get_paisInicio
	}
	def paisesAViajar(){
		_paisesSistema.remove(_paisActual)
	}
	def viajar(Pais pais){
		_paisActual=pais
		_paisesVisitados.add(pais)
		_paisesSistema.remove(pais)
	}
	def volverAPaisAnterior(){
		_paisActual=_paisesVisitados.get(0)
		_paisesVisitados.remove(_paisesVisitados.get(0))
		_paisesSistema.add(_paisesVisitados.get(0)) 
	}
	def iniciarJuego(){
		_caso.get_inicioCaso
	}
	def ordenDeArrestro(){
		_villanosSistema
	}
	//DUDAS Como hacerlo
	def generarOrdenDeArrestro(){
		_villanoArrestar
	}
	def gano(){
		_villanoArrestar ==_caso.get_villano
	}
	def perdio(){
		_villanoArrestar !=_caso.get_villano
	}	
}