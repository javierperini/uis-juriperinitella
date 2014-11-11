package detective

import java.util.List
import lugares.Lugar
import personajes.Personaje
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
	@Property Boolean encontrasteAlVillano = false;
	@Property String  descripcionCaso;
	@Property List<Personaje> informantes
	@Property List<Personaje> cuidadores
	
	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema) {
		this.caso = caso
		this.paisesSistema = paisesSistema
		this.villanosSistema = villanosSistema
		this.paisActual= caso.paisInicio
		this.descripcionCaso= caso.getDescripcion
		this.lugaresActuales=paisActual.lugares
		this.paisesVisitados.add(paisActual)	
	}
	
	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema, List<Personaje> informantes, List<Personaje> cuidadores) {
		this.caso = caso
		this.paisesSistema = paisesSistema
		this.villanosSistema = villanosSistema
		this.paisActual= caso.paisInicio
		this.descripcionCaso= caso.getDescripcion
		this.lugaresActuales=paisActual.lugares
		this.paisesVisitados.add(paisActual)		
		this.informantes=informantes
		this.cuidadores=cuidadores
	}

	def nombreDelLugar(int i) {
		lugaresActuales.get(i).nombre
	}
	
	def viajar(){
	 if(paisSeleccionado.nombre!= paisActual.nombre){
			paisAnterior=paisActual
			sacarPaisFallido(paisSeleccionado)
			actualizarPaisActual(paisSeleccionado)
			paisesVisitados.add(paisActual)
		}
	 }
	/*
	 * El usuario se equivoca y vuelve al paisAnterior por error
	 */
	def sacarPaisFallido(Pais pais) {
		paisesFallidos.remove(pais)
	}
	def buscarPais(String nombre){
	  var	Pais res 
	  for(Pais p :paisesSistema){
	  	 if(p.nombre.equals(nombre))
	  	      res= p
	  }
	  res
	}
	
	def volverAPaisAnterior(){
		paisesFallidos.add(paisActual)
		paisesVisitados.remove(paisActual)
		actualizarPaisActual(paisAnterior)
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
		caso.getDescripcion
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
		var List<String> res
		for(Lugar l : paisActual.lugares){
			if(l.nombre == nombreLugar){
		  	  estaElVillano(l.ocupante)
		  	  res=l.interrogarOcupante
		  	}
		  }
	     res
	}
	def estaElVillano(Personaje personaje){
		encontrasteAlVillano=personaje.estasArrestado
	}
	
	def buscarLugar(String nombreLugar) {
		var Lugar res
		for(Lugar l:paisActual.lugares)
	        if(l.nombre == nombreLugar)	
	           res=l
		res
	}
	
	def ganeJuego(String nombreLugar){
		var Personaje l= buscarLugar(nombreLugar).ocupante
		var String res="Perdiste el juego, no tenias orden de arresto";
		if(!(villanoAtrapado== null )){
			if(villanoAtrapado.nombre==l.nombre){
			    res="Ganaste el juego, felicitaciones! Tenias una orden para "+villanoAtrapado.nombre
			}
			else{
				res = "Perdiste el juego, tenias orden contra "+villanoAtrapado.nombre+ " y el villano es " + l.nombre  
			}
		}
		res
	}
	
	def conexiones(){
		paisActual.conexiones
	}
	
	def emitirOrdenContra(String nombreVillano){
		for(Villano villano:villanosSistema){
			 if(villano.nombre.equals(nombreVillano))
			    villanoAtrapado=villano
		}
	    villanoAtrapado
	}
	
	def getInformante(int i) {
		informantes.get(i)
	}
	
	def getCuidador(int i) {
		cuidadores.get(i)
	}
	
}
