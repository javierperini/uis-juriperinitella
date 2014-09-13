package mapamundi

class MapamundiAppModel {
	@Property Sistema sistema
	@Property Pais paisSeleccionado
	
	def removerPais(){
		sistema.paisesSistema.remove(paisSeleccionado)
		// ?? ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)
	}
	
	def agregarPais(Pais p){
		sistema.paisesSistema.add(p)
		// ?? ObservableUtils.firePropertyChanged(this, "paisesSistema", paisesSistema)
	}
}