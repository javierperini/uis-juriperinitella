package detective

import java.util.List
import lugares.Lugar
import org.uqbar.commons.utils.Observable
import personajes.Villano
import pista.PistaHobbie
import pista.PistaSenia
import org.uqbar.commons.model.ObservableUtils

@Observable
class Sistema {
	
	@Property Caso caso
	@Property List<Pais> paisesSistema= newArrayList()
	@Property List<Pais> paisesVisitados= newArrayList()
	@Property List<Pais> paisesFallidos= newArrayList()
	@Property List<Villano> villanosSistema = newArrayList()
	@Property List<Lugar> lugaresSistema = newArrayList()
	@Property Villano villanoEnCreacion
	@Property Pais paisActual
	@Property  Villano villanoArrestar
	@Property OrdenDeArresto ordenDeArresto
	@Property Pais paisEnCreacion
	@Property Pais paisSeleccionado
	@Property String paisesRecorridos
	
	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema, List<Lugar> lugares){
		this.caso=caso
		this.paisesSistema=paisesSistema
		this.villanosSistema=villanosSistema
		this.paisActual=caso.paisInicio
		this.lugaresSistema = lugares
		this.ordenDeArresto= new OrdenDeArresto()
		this.paisesRecorridos=caso.nombrePaisInicio()
	}
	
	new() { }
	
	def paisesAViajar(){
		paisesSistema.remove(paisActual)
	}
	
	def viajar(Pais pais){
		paisActual=pais
		paisesVisitados.add(pais)
		pasarAString(pais.nombre)
		paisesSistema.remove(pais)
	}
	
	def pasarAString(String string) {
		paisesRecorridos.concat("<-")
		 paisesRecorridos.concat(string)	
	}
	
	def volverAPaisAnterior(){
		paisActual=paisesVisitados.get(0)
		paisesSistema.add(paisesVisitados.get(0)) 
		paisesVisitados.remove(paisesVisitados.get(0))
	}
	
	def iniciarJuego(){
		caso.inicioCaso
	}
	
	def generarOrdenDeArrestro(){
		for(Villano villano: villanosSistema){
	//		 if(villano.hobbies.contains(ordenDeArresto.pistaHobbie) &&  --MODIFICAR LA CONDICION 
		//	 		villano.seniasPart.contains(ordenDeArresto.pistaSenia))
			 	villanoArrestar= villano
			}
		 if( villanoArrestar== null){
		 	throw new NingunVillanoException("No hay coincidencia con ningun villano")
			}
	}
	
	def completarHobbieOrdenDeArresto(PistaHobbie pista){
		ordenDeArresto.agregarPistaHobbie(pista)
	}
	
	def completarSeniaOrdenDeArresto(PistaSenia pista){
		ordenDeArresto.agregarPistaSenia(pista)
	}
	def arrestar(){
		villanoArrestar== caso.villano
	}
	
	def agregarVillanoALaLista(Villano villano) {
		villanosSistema.add(villano)
		ObservableUtils.firePropertyChanged(this, "villanosSistema", villanosSistema)
	}

	def removerPais(Pais pais) {
		paisesSistema.remove(pais)
		ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)
		
	}
	
	def agregarPais(Pais pais) {
		paisesSistema.add(pais)
		ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)
	}
	
	def getNombreCaso() {
		caso.nombreCaso
	}
	def paisDeInicio(){
		caso.paisInicio
	}
}