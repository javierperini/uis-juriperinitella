package ui

import detective.Sistema
import org.uqbar.arena.Application
import personajes.Villano
import java.util.List
import detective.Pais
import detective.Caso
import pista.PistaSenia
import pista.PistaHobbie
import lugares.Lugar
import pista.Pista
import lugares.Club
import lugares.Embajada
import lugares.Biblioteca
import lugares.Banco
import personajes.Informante
import personajes.Personaje
import pista.PistaLugar

class CarmenApplication extends Application{
	
	List<Villano> villanos= newArrayList()
	List<Pais> paisesSistema= newArrayList()
	List<Pista> pistas = newArrayList()
	List<PistaSenia> seniasPart = newArrayList()
	List<PistaHobbie> hobbies = newArrayList()
	List<String> caracteristicas=newArrayList()
	List<Lugar>lugares=newArrayList()
	List<Lugar>lugaresPais=newArrayList()
	List<Lugar>lugaresPais2=newArrayList()
	
	override createMainWindow() {
		
		
		var String nombreCaso = "Soy el nombre del caso"
		var String inicioCaso = "Soy el inicio del caso"
		
		var List<PistaHobbie> hobbies = newArrayList
		var List<PistaSenia> seniasPart = newArrayList
		seniasPart.add(new PistaSenia("Le gustan los pantalones azules"))
		seniasPart.add(new PistaSenia("La sal no sala, y el azucar no endulza"))
		seniasPart.add(new PistaSenia("Borracho ahora sobrio y sin espinas. "))
		hobbies.add(new PistaHobbie("Con mexicanos margaritas ,dos chicas: una sabe mentir "))
		hobbies.add(new PistaHobbie("Run beach Run"))
		hobbies.add(new PistaHobbie("Ayer se fue, agarro sus cosas y se puso a navegar"))	
		var Villano villano = new Villano("Don Ramon", "Masculino", hobbies, seniasPart)

		var Pais conexionEgipto1 = new Pais("Afganistán", null, null, null)
		var Pais conexionEgipto2 = new Pais("Argelia", null, null, null)
		var Pais conexionEgipto3 = new Pais("Estados Unidos", null, null, null)
		var List<Pais> conexionesEgipto = newArrayList
		conexionesEgipto.add(conexionEgipto1) conexionesEgipto.add(conexionEgipto2) conexionesEgipto.add(conexionEgipto3)
		var List<Pista> pistasLugEgip1 = newArrayList
		pistasLugEgip1.add(new PistaSenia("Lunar en la boca")) pistasLugEgip1.add(new PistaSenia("Parche en el ojo")) pistasLugEgip1.add(new PistaHobbie("Tennis"))
		var List<Pista> pistasLugEgip2 = newArrayList
		pistasLugEgip2.add(new PistaLugar("Quería comer baguettes")) pistasLugEgip2.add(new PistaLugar("Iba a bailar tango"))
		var List<Pista> pistasLugEgip3 = newArrayList
		pistasLugEgip3.add(new PistaLugar("Planeaba ir a una corrida de toros")) pistasLugEgip3.add(new PistaSenia("Era colorada")) pistasLugEgip3.add(new PistaHobbie("Jugar al ajedrez"))
		var Personaje personajeLugEgip1 = new Informante("Ahmed")
		var Personaje personajeLugEgip2 = new Informante("Luis")
		var Personaje personajeLugEgip3 = new Informante("Camila")
		var Lugar lugarEgip1 = new Club("Club el faraón", personajeLugEgip1, pistasLugEgip1)
		var Lugar lugarEgip2 = new Embajada("Embajada", personajeLugEgip2, pistasLugEgip2)
		var Lugar lugarEgip3 = new Biblioteca("Biblioteca", personajeLugEgip3, pistasLugEgip3)
		var List<Lugar> lugaresEgipto = #[lugarEgip1, lugarEgip2, lugarEgip3] 
		var List<String> caracsEgipto = newArrayList
		caracsEgipto.add("mucho calor");caracsEgipto.add("pirámides")
		var Pais paisInicio = new Pais("Egipto", caracsEgipto, lugaresEgipto, conexionesEgipto)
		
		var Pais argentina = new Pais("Argentina", null, null, null)
		var Pais brasil = new Pais("Brasil", null, null, null)
		var List<Pais> paises = newArrayList
		paises.add(argentina) paises.add(brasil) paises.add(paisInicio) paises.add(conexionEgipto1) paises.add(conexionEgipto2) paises.add(conexionEgipto3)

		var List<Pais> recorridoVillano = newArrayList
		recorridoVillano.add(argentina) recorridoVillano.add(brasil) recorridoVillano.add(new Pais("Inglaterra", null, null, null))		

		var Villano carmenSandiego = new Villano("Carmen Sandiego", "Femenino", null, null)
		var List<Villano> villanos = newArrayList
		villanos.add(villano) villanos.add(carmenSandiego)

		var Caso caso= new Caso(paisInicio, recorridoVillano, villano, inicioCaso, nombreCaso)
		
		var Sistema sistema = new Sistema(caso, paises, villanos)

		
//		/*Pistas*/
//		pistas.add(new Pista("cuchillo"))
//		pistas.add(new Pista("arma"))
//		pistas.add(new Pista("chrarco de sangre!!"))
//		/*Villano */
//		var Villano b = new Villano("Maria Jose","?",hobbies,seniasPart)
//		var Villano c = new Villano("Raquel","Femenino",hobbies,seniasPart)
//		villanos.add(a)
//		villanos.add(b)
//		villanos.add(c)
//		/*Caracteristicas*/
//		caracteristicas.add("Robo")
//		caracteristicas.add("Incendios")
//		caracteristicas.add("Fiesta")
//		
//		/*Lugares */
//		var Informante inf = new Informante("pepe")
//		lugares.add(new Club("Club", a, pistas))
//		lugares.add(new Embajada("Embajada", b, pistas))
//		lugares.add(new Biblioteca("Biblioteca", c, pistas))
//		lugares.add(new Banco("Banco", a, pistas))
//		//----
//		lugaresPais.add(new Club("Club", a, pistas))
//		lugaresPais.add(new Embajada("Embajada", b, pistas))
//		lugaresPais.add(new Biblioteca("Biblioteca", c, pistas))
//		/*Pais */
//		var Pais ap = new Pais("Argentina",caracteristicas,lugaresPais)
//		var Pais bp = new Pais("Brasil",caracteristicas,lugaresPais)
//		paisesSistema.add(ap)
//	    paisesSistema.add(bp)
//		
//		/*Caso*/
//		var Caso caso= new Caso(ap, paisesSistema, a, "Se robaron las papasFritas de todo MCDONALDS","Robo de PapasFritas")
//		var sistema = new Sistema(caso,paisesSistema,villanos, lugares)
		
		
		new MenuDeAcciones(this, sistema)
	}
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
}