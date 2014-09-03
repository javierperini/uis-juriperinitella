package main.java.detective

import java.util.List
import main.java.personajes.Villano
import main.java.detective.Caso
import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia

class Sistema {
	
	@Property Caso caso
	@Property List<Pais> paisesSistema
	@Property List<Villano> villanosSistema
			  Pais paisActual
			  List<Pais> paisesVisitados
			  Villano villanoArrestar
			   OrdenDeArresto ordenDeArresto
	
	new(Caso caso,List<Pais>paisesSistema,List<Villano> villanosSistema){
		this.caso=caso
		this.paisesSistema=paisesSistema
		this.villanosSistema=villanosSistema
		this.paisActual=caso.paisInicio
		this.ordenDeArresto= new OrdenDeArresto()
	}
	
	def paisesAViajar(){
		paisesSistema.remove(paisActual)
	}
	
	def viajar(Pais pais){
		paisActual=pais
		paisesVisitados.add(pais)
		paisesSistema.remove(pais)
	}
	
	def volverAPaisAnterior(){
		paisActual=paisesVisitados.get(0)
		paisesVisitados.remove(paisesVisitados.get(0))
		paisesSistema.add(paisesVisitados.get(0)) 
	}
	
	def iniciarJuego(){
		caso.inicioCaso
	}
	
	def generarOrdenDeArrestro(){
		for(Villano villano: villanosSistema){
			 if(villano.hobbie.equals(ordenDeArresto.pistaHobbie) && 
			 	villano.seniasPart.equals(ordenDeArresto.pistaSenia))
			 	villanoArrestar= villano
			}
		 if( villanoArrestar== null){}
		 	//throw new exceptionNingunVillano
	}
	
	def completarHobbieOrdenDeArresto(PistaHobbie pista){
		ordenDeArresto.setPistaHobbie(pista)
	}
	
	def completarSeniaOrdenDeArresto(PistaSenia pista){
		ordenDeArresto.setPistaSenia(pista)
	}
	def arrestar(){
		villanoArrestar== caso.villano
	}
	
}