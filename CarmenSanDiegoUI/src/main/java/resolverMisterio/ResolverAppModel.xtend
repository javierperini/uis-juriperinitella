package resolverMisterio

import detective.Pais
import detective.Sistema
import java.util.List
import org.uqbar.commons.utils.Observable
import lugares.Lugar
import personajes.Villano
import org.uqbar.commons.model.ObservableUtils

@Observable
class ResolverAppModel {
	
	@Property Sistema sistema
	@Property Pais paisActual
	@Property Pais paisSeleccionado=new Pais
	@Property List<Pais> paisesFallidos=newArrayList()
	@Property List<Pais> paisesVisitados=newArrayList()
	@Property String paisesRecorridos
	@Property Lugar lugarActual
	@Property Villano villanoAtrapado
			  StringBuffer paisesBuffer
	
	@Property Pais paisAnterior
	
	
	new(Sistema sistema) {
		this.sistema=sistema
		this.paisActual= sistema.paisDeInicio
		//this.paisesRecorridos=paisActual.nombre
		this.paisesBuffer= new StringBuffer(paisActual.nombre)
	 	
	}
	
	def nombreDelLugar(int i) {
		paisActual.lugar(i).nombre
	}
		
	def viajar(){
		if(!paisesVisitados.empty){
			paisAnterior= paisesVisitados.get(0)
			actualizarPaisActual(paisSeleccionado)
			paisesVisitados.add(paisActual)
		}else{
			actualizarPaisActual(paisSeleccionado)
			paisesVisitados.add(paisActual)
		}
//		ObservableUtils.firePropertyChanged(this, "paisesVisitados", paisesVisitados)
		//pasarAString(paisActual.nombre)
	}
	
	def pasarAString(String string) {
		paisesBuffer.append("<-")
		paisesBuffer.append(string)
		paisesRecorridos=paisesBuffer.toString	
	}
	
	def volverAPaisAnterior(){
		//sacarDelRecorrido(paisActual.nombre)
		paisesFallidos.add(paisActual)
		paisesVisitados.remove(paisActual)
		actualizarPaisActual(paisAnterior)
		
		ObservableUtils.firePropertyChanged(this, "paisesFallidos", paisesFallidos)
		ObservableUtils.firePropertyChanged(this, "paisesVisitados", paisesVisitados)
	}
	//Metodo para sacar los paises de recorrido villano
	def sacarDelRecorrido(String paisActual) {
		var borrar=paisActual.length+2
		paisesBuffer.replace(paisesBuffer.length()-borrar, paisesBuffer.length(), "")
		paisesRecorridos=paisesBuffer.toString	
	}
	def actualizarPaisActual(Pais pais){
		paisActual= pais
		ObservableUtils.firePropertyChanged(this, "paisActual", paisActual)
	}
	def lugar(int i){
		lugarActual=paisActual.lugar(i)
	}
	
	def agregarVillanoOrden(Villano villano) {
	 	
	}
	
	
}