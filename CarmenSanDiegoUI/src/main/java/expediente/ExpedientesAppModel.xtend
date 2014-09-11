package expediente

import detective.Sistema
import personajes.Villano

class ExpedientesAppModel {
	@Property
	Sistema sistema
	
	@Property
	Villano villanoSeleccionado
	
	@Property
	Nota notaSeleccionada 
	
	def getUbicacionesPosibles(){
		Arrays.asList(Ubicacion.values)
	}
	
	def nuevaNota() {
		var nota = new Nota
		materiaSeleccionada.agregarNota(nota)
		nota
	}
	
	def eliminarNota() {
		materiaSeleccionada.eliminarNota(notaSeleccionada)
	}
}