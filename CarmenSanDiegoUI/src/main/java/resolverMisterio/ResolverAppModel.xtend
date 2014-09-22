package resolverMisterio

import detective.Sistema
import detective.Pais
import java.util.List

class ResolverAppModel {
	
	@Property Sistema sistema
	@Property Pais paisActual
	@Property List<Pais> paisesFallidos=newArrayList()
	@Property List<Pais> paisesVisitados=newArrayList()
	@Property String paisesRecorridos
	
	
	
	new(Sistema sistema) {
		this.sistema=sistema
		this.paisActual= sistema.paisDeInicio
	//		stringBuffer.replace(stringBuffer.length()-2, stringBuffer.length(), "");
	}
	
	def nombreDelLugar(int i) {
		paisActual.lugar(i);
	}
	
	def paisesAViajar(){
		//paisesSistema.remove(paisActual)
	}
	
	def viajar(Pais pais){
		paisActual=pais
		paisesVisitados.add(pais)
		pasarAString(pais.nombre)
		//paisesSistema.remove(pais)
	}
	
	def pasarAString(String string) {
		paisesRecorridos.concat("<-")
		 paisesRecorridos.concat(string)	
	}
	
	def volverAPaisAnterior(){
		paisActual=paisesVisitados.get(0)
		paisesRecorridos
		paisesFallidos.add(paisesVisitados.get(0))
		//paisesSistema.add(paisesVisitados.get(0)) 
		paisesVisitados.remove(paisesVisitados.get(0))
	}
	
	
}