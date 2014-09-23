package resolverMisterio

import detective.Pais
import detective.Sistema
import java.util.List
import org.uqbar.commons.utils.Observable
import lugares.Lugar

@Observable
class ResolverAppModel {
	
	@Property Sistema sistema
	@Property Pais paisActual
	@Property List<Pais> paisesFallidos=newArrayList()
	@Property List<Pais> paisesVisitados=newArrayList()
	@Property String paisesRecorridos
	@Property Lugar lugarActual
			  StringBuffer paisesBuffer
	
	
	new(Sistema sistema) {
		this.sistema=sistema
		this.paisActual= sistema.paisDeInicio
		this.paisesRecorridos=paisActual.nombre
	 	
	}
	
	def nombreDelLugar(int i) {
		paisActual.lugar(i).nombre
	}
		
	def viajar(Pais pais){
		paisActual=pais
		paisesVisitados.add(pais)
		pasarAString(pais.nombre)
		
	}
	
	def pasarAString(String string) {
		paisesBuffer.append("<-")
		paisesBuffer.append(string)
		paisesRecorridos=paisesBuffer.toString	
	}
	
	def volverAPaisAnterior(){
		paisActual=paisesVisitados.get(0)
		sacarDelRecorrido(paisActual.nombre)
		paisesFallidos.add(paisesVisitados.get(0))
		paisesVisitados.remove(paisesVisitados.get(0))
	}
	//Metodo para sacar los paises de recorrido villano
	def sacarDelRecorrido(String paisActual) {
		var borrar=paisActual.length+2
		paisesBuffer.replace(paisesBuffer.length()-borrar, paisesBuffer.length(), "")
		paisesRecorridos=paisesBuffer.toString	
	}
	
	def lugar(int i){
		lugarActual=paisActual.lugar(i)
	}
	
	
}