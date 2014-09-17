package expediente

import org.uqbar.arena.bindings.Transformer
import org.uqbar.arena.windows.WindowOwner

class EditarHobbies extends EdicionPista {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		title = "Editar Hobbies"
	} 
	
	override String listaABindear() {
		"villanoSeleccionado.hobbies"
	}
	
	override pistaSeleccionada() {
		"pistaHobbieSeleccionada"
	}
		
	override String tituloColumna() {
		"Hobbies"
	}
	
	override quitarPista() {
		modelObject.villanoSeleccionado.quitarHobbie(modelObject.pistaHobbieSeleccionada)
	}
	
	override agregarPista() {
		modelObject.villanoSeleccionado.agregarHobbie(modelObject.pistaHobbieParaAgregar)
	}
	
	 override String pistaAAgregar() {
	 	"pistaHobbieParaAgregar"
	 }
	
	override Transformer crearTransformer() {
		new PistaHobbieTransformer
	}
}
	
	
