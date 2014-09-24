package detective

import java.util.List
import lugares.Lugar
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import personajes.Villano

@Observable
class Sistema {

	@Property Caso caso
	@Property List<Pais> paisesSistema = newArrayList()
	@Property List<Pais> paisesVisitados = newArrayList()
	@Property List<Villano> villanosSistema = newArrayList()
	@Property List<Lugar> lugaresSistema = newArrayList()

	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema) {
		this.caso = caso
		this.paisesSistema = paisesSistema
		this.villanosSistema = villanosSistema
	}

	def iniciarJuego() {
		caso.inicioCaso
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

	def paisDeInicio() {
		caso.paisInicio
	}

}
