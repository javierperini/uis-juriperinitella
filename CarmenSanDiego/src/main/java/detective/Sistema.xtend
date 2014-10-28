package detective

import java.util.List
import lugares.Lugar
import personajes.Villano

class Sistema {

	@Property Caso caso
	@Property List<Pais> paisesSistema = newArrayList()
	@Property List<Pais> paisesVisitados = newArrayList()
	@Property List<Villano> villanosSistema = newArrayList()
	@Property List<Lugar> lugaresSistema = newArrayList()
	@Property Pais paisActual
	@Property Pais paisSeleccionado=new Pais
	@Property Pais paisAnterior
	@Property String paisesRecorridos
	@Property List<Pais> paisesFallidos=newArrayList
	@Property List<Lugar> lugaresActuales=newArrayList
	@Property Lugar lugarActual
	@Property Villano villanoAtrapado 
	@Property String botonUno
			  StringBuffer paisesBuffer
	
	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema) {
		this.caso = caso
		this.paisesSistema = paisesSistema
		this.villanosSistema = villanosSistema
		this.paisActual= caso.paisInicio
		this.lugaresActuales=paisActual.lugares
		this.botonUno=lugaresActuales.get(0).nombre
		this.paisesVisitados.add(paisActual)	
	}

	def nombreDelLugar(int i) {
		lugaresActuales.get(i).nombre
	}
	
	def viajar(){
			paisAnterior=paisActual
			sacarPaisFallido(paisSeleccionado)
			actualizarPaisActual(paisSeleccionado)
			paisesVisitados.add(paisActual)
			
	}
	/*
	 * El usuario se equivoca y vuelve al paisAnterior por error
	 */
	def sacarPaisFallido(Pais pais) {
		paisesFallidos.remove(pais)
	}
	def buscarPais(String nombre){
	  var	Pais res 
//		paisesSistema.forEach[ if(it.nombre==nombre)
//			                        res=it  
//			                          
//		] 
	  for(Pais p :paisesSistema){
	  	 if(p.nombre.equals(nombre))
	  	      res= p
	  }
	  res
	}
	
	def volverAPaisAnterior(){
//	 	sacarDelRecorrido(paisActual.nombre)
		paisesFallidos.add(paisActual)
		paisesVisitados.remove(paisActual)
		actualizarPaisActual(paisAnterior)
	}
	
	//Metodo para sacar los paises de recorrido villano
	def sacarDelRecorrido(String paisActual) {
		var borrar=paisActual.length+2
		paisesBuffer.replace(paisesBuffer.length()-borrar, paisesBuffer.length(), "")
		paisesRecorridos=paisesBuffer.toString	
	}
	
	def actualizarPaisActual(Pais pais){
		paisActual= pais
	}
	
	def lugar(int i){
		lugarActual=lugaresActuales.get(i)
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
	
	def iniciarJuego() {
		caso.inicioCaso
	}
    
    def viajarA(String nombrePais){
         paisSeleccionado = buscarPais(nombrePais)
         viajar()
    }
	def agregarVillanoALaLista(Villano villano) {
		villanosSistema.add(villano)
//		ObservableUtils.firePropertyChanged(this, "villanosSistema", villanosSistema)
	}

	def removerPais(Pais pais) {
		paisesSistema.remove(pais)
//		ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)

	}

	def agregarPais(Pais pais) {
		paisesSistema.add(pais)
//		ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)
	}

	def getNombreCaso() {
		caso.nombreCaso
	}

	def paisDeInicio() {
		caso.paisInicio
	}
	
	def obtenerPistaDe(String nombreLugar){
		var List<String> res;
		for(Lugar l : paisActual.lugares){
			if(l.nombre == nombreLugar)
				res = l.interrogarOcupante
		}
	     res
	}
	
}
