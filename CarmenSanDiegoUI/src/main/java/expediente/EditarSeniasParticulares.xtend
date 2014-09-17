package expediente

import org.uqbar.arena.bindings.Transformer
import org.uqbar.arena.windows.WindowOwner

class EditarSeniasParticulares extends EdicionPista {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		title = "Editar Señas"
	} 
	
	override String listaABindear() {
		"villanoSeleccionado.seniasParticulares"
	}
		
	override pistaSeleccionada() {
		"pistaSeniaSeleccionada"
	}
		
	override String tituloColumna() {
		"Señas Particulares"
	}
	
	override quitarPista() {
		modelObject.villanoSeleccionado.quitarSeniaParticular(modelObject.pistaSeniaSeleccionada)
	}
	
	override agregarPista() {
		modelObject.villanoSeleccionado.agregarSeniaParticular(modelObject.pistaSeniaParaAgregar)
	}
	
	override String pistaAAgregar() {
		"pistaSeniaParaAgregar"
	}
	
	override Transformer crearTransformer() {
		new PistaSeniaTransformer
	}	
}
	
	
