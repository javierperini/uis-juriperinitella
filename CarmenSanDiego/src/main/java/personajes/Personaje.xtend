package personajes



abstract class Personaje {
	@Property String nombre
	@Property String declaracion

	new(String nombre) {
		this.nombre = nombre
	}
	
	new() {}

	def String getInformacion()

	def boolean puedeRevelarPista()
}
