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

class CarmenApplication extends Application{
	
	List<Villano> villanos= newArrayList()
	List<Pais> paisesSistema= newArrayList()
	List<Pista> pistas = newArrayList()
	List<PistaSenia> seniasPart = newArrayList()
	List<PistaHobbie> hobbies = newArrayList()
	List<String> caracteristicas=newArrayList()
	List<Lugar>lugares=newArrayList()
	List<Lugar>lugaresPais=newArrayList()
	
	override createMainWindow() {
		/*Pistas*/
		pistas.add(new Pista("cuchillo"))
		pistas.add(new Pista("arma"))
		pistas.add(new Pista("chrarco de sangre!!"))
		seniasPart.add(new PistaSenia("Le gustan los pantalones azules"))
		seniasPart.add(new PistaSenia("La sal no sala, y la azucar no endulza"))
		seniasPart.add(new PistaSenia("Borracho ahora sobrio y sin espinas. "))
		hobbies.add(new PistaHobbie("Con mexicanos margaritas ,dos chicas: una sabe mentir "))
		hobbies.add(new PistaHobbie("Run beach Run"))
		hobbies.add(new PistaHobbie("Ayer se fue, agarro sus cosas y se puso a navegar"))
		
		/*Villano */
		var Villano a = new Villano("Don Ramon","Hombre",hobbies,seniasPart)
		var Villano b = new Villano("Maria Jose","?",hobbies,seniasPart)
		var Villano c = new Villano("Raquel","La Mujer de los muchachos",hobbies,seniasPart)
		villanos.add(a)
		villanos.add(b)
		villanos.add(c)
		/*Caracteristicas*/
		caracteristicas.add("Robo")
		caracteristicas.add("Incendios")
		caracteristicas.add("Fiesta")
		
		/*Lugares */
		lugares.add(new Club("Club", a, pistas))
		lugares.add(new Embajada("Embajada", b, pistas))
		lugares.add(new Biblioteca("Biblioteca", c, pistas))
		lugares.add(new Banco("Banco", a, pistas))
		
		/*Pais */
		var Pais ap = new Pais("Argentina",caracteristicas,lugaresPais)
		var Pais bp = new Pais("Brasil",caracteristicas,lugaresPais)
		paisesSistema.add(ap)
	    paisesSistema.add(bp)
		
		/*Caso*/
		var Caso caso= new Caso(ap, paisesSistema, a, "Se robaron las papasFritas de todo MCDONALDS","Robo de PapasFritas")
		var sistema = new Sistema(caso,paisesSistema,villanos, lugares)
		
		
		new MenuDeAcciones(this, sistema)
	}
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
}