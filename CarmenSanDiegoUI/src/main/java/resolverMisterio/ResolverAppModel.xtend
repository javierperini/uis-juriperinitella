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
	@Property Pais paisAnterior
	@Property String paisesRecorridos
	@Property List<Pais> paisesFallidos=newArrayList
	@Property List<Pais> paisesVisitados=newArrayList
	@Property List<Lugar> lugaresActuales=newArrayList
	@Property Lugar lugarActual
	@Property Villano villanoAtrapado 
	@Property String botonUno
			  StringBuffer paisesBuffer
	
	
	
	new(Sistema sistema) {
		this.sistema=sistema
		this.paisActual= sistema.paisDeInicio
		this.lugaresActuales=paisActual.lugares
		this.botonUno=lugaresActuales.get(0).nombre
		this.paisesVisitados.add(paisActual)
		this.paisesBuffer= new StringBuffer(paisActual.nombre)
	 	
	}
	
	def nombreDelLugar(int i) {
		lugaresActuales.get(i).nombre
	}
		
	def pasarAString(String string) {
		paisesBuffer.append("<-")
		paisesBuffer.append(string)
		paisesRecorridos=paisesBuffer.toString	
	}
	
	def viajar(){
			paisAnterior=paisActual
			sacarPaisFallido(paisSeleccionado)
			actualizarPaisActual(paisSeleccionado)
			paisesVisitados.add(paisActual)
			pasarAString(paisActual.nombre)
	}
	/*
	 * El usuario se equivoca y vuelve al paisAnterior por error
	 */
	def sacarPaisFallido(Pais pais) {
		paisesFallidos.remove(pais)
		ObservableUtils.firePropertyChanged(this, "paisesFallidos", paisesFallidos)
	}
	
	def volverAPaisAnterior(){
		sacarDelRecorrido(paisActual.nombre)
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
		ObservableUtils.firePropertyChanged(this, "lugaresActuales", lugaresActuales)
		ObservableUtils.firePropertyChanged(this, "botonUno", botonUno)
		
	}
	def lugar(int i){
		lugarActual=lugaresActuales.get(i)
		ObservableUtils.firePropertyChanged(this, "lugarActual", lugarActual)
		
	}
	
	def agregarVillanoOrden(Villano villano) {
	 	
	}
	
	def	String interrogarOcupante(){
		var List<String> list = lugarActual.interrogarOcupante
		var String res = ""
		for(var i = 0; i<list.size(); i++){
			res += list.get(i)
			res += "\n"
		}
		
		res
	}	
}