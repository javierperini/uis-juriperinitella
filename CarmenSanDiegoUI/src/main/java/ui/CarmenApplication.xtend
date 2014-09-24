package ui

import detective.Caso
import detective.Pais
import detective.Sistema
import java.util.List
import lugares.Biblioteca
import lugares.Club
import lugares.Embajada
import lugares.Lugar
import org.uqbar.arena.Application
import personajes.Cuidador
import personajes.Informante
import personajes.Personaje
import personajes.Villano
import pista.Pista
import pista.PistaHobbie
import pista.PistaLugar
import pista.PistaSenia

class CarmenApplication extends Application{
	

	
	override createMainWindow() {
		
		
		var String nombreCaso = "Robo al Faraon"
		var String inicioCaso = "Se intento robar la mochila del Faraon Pepi I"
		/*Personajes*/
		var Personaje personajeAfg = new Informante("Ahmed")
		var Personaje personajeAfg2 = new Informante("Luis")
		var Personaje personajeAfg3 = new Informante("Camila")
		var Personaje  personajeCuid= new Cuidador("Ramon")
		var Personaje  personajeCuid2= new Cuidador("Laura")
		var Personaje  personajeCuid3= new Cuidador("Ricardo")
		var Personaje  personajeArg= new Informante("Patricio")
		var Personaje  personajeArg2= new Informante("Leandro")
		var Personaje personajeLugEgip1 = new Informante("Ahmed")
		var Personaje personajeLugEgip2 = new Informante("Luis")
		var Personaje personajeLugEgip3 = new Informante("Camila")
	
		/*Pistas Villanos */
		var List<PistaHobbie> hobbiesRamon = newArrayList
		var List<PistaSenia> seniasPartRamon = newArrayList
		seniasPartRamon.add(new PistaSenia("Le gustan los pantalones azules"))
		seniasPartRamon.add(new PistaSenia("Usa Bigote"))
		seniasPartRamon.add(new PistaSenia("Tiene sombrero "))
		hobbiesRamon.add(new PistaHobbie("Con mexicanos margaritas ,dos chicas: una sabe mentir "))
		hobbiesRamon.add(new PistaHobbie("Pegarle al chavo"))
		hobbiesRamon.add(new PistaHobbie("No pagar la renta"))	
		var List<PistaHobbie> hobbiesCarmen = newArrayList
		var List<PistaSenia> seniasPartCarme = newArrayList
		seniasPartCarme.add(new PistaSenia("Pelo Rojo"))
		seniasPartCarme.add(new PistaSenia("Usa sombrero"))
		seniasPartCarme.add(new PistaSenia("Fuma "))
		hobbiesCarmen.add(new PistaHobbie("Le gusta bailar "))
		hobbiesCarmen.add(new PistaHobbie("Viaja mucho"))
		hobbiesCarmen.add(new PistaHobbie("Juega con el tiempo"))
		var List<PistaHobbie> hobbiesGaston = newArrayList
		var List<PistaSenia> seniasPartGaston = newArrayList
		seniasPartGaston.add(new PistaSenia("Tiene bigote"))
		seniasPartGaston.add(new PistaSenia("Pelo Negro"))
		seniasPartGaston.add(new PistaSenia("Cicatriz en la cara"))
		hobbiesGaston.add(new PistaHobbie("Le gusta Viajar en moto "))
		hobbiesGaston.add(new PistaHobbie("No estudia"))
		hobbiesGaston.add(new PistaHobbie("Hablar con turistas"))		
		
		/*Villanos*/
		var Villano carmenSandiego = new Villano("Carmen Sandiego", "Femenino", hobbiesCarmen, seniasPartCarme)
		var Villano ramon = new Villano("Don Ramon", "Masculino", hobbiesRamon, seniasPartRamon)
		var Villano gaston= new Villano("Gaston Aguirre","Masculino",hobbiesGaston,seniasPartGaston)
		var List<Villano> villanos = newArrayList
		villanos.add(ramon) villanos.add(carmenSandiego) villanos.add(gaston)
		
		/*Pistas Afagnistan */
		var List<Pista> pistasLugarAfg=newArrayList
		pistasLugarAfg.add(new PistaLugar("Planeaba caminar por Caminito ")) pistasLugarAfg.add(new PistaLugar("Queria comer Asado")) pistasLugarAfg.add(new PistaLugar("Cambio su dinero a pesos"))
		var List<Pista> pistasLugarAfg2=newArrayList
		pistasLugarAfg2.add(new PistaLugar("Tenia una bandera Celeste y Blanca")) pistasLugarAfg2.add(new PistaSenia("Le gusta Viajar en moto ")) pistasLugarAfg2.add(new PistaHobbie("Hablar con turistas"))
		var List<Pista> pistasLugarAfg3=newArrayList
		pistasLugarAfg3.add(new PistaHobbie("Tiene una cicatriz en la cara ")) pistasLugarAfg3.add(new PistaLugar("Planeaba hablar con Maradona "))
		pistasLugarAfg3.add(new PistaLugar("Tenia la mano de Peron")) 
		
		/*Pistas Egipto */
		var List<Pista> pistasLugarEgip=newArrayList
		pistasLugarEgip.add(new PistaLugar("Hablo del islam"))  pistasLugarEgip.add(new PistaLugar("Llevaba una bandera negra, roja y verde"))
	    pistasLugarEgip.add(new PistaLugar("Usan turbantes")) 
	    var List<Pista> pistasLugarEgip2=newArrayList
	    pistasLugarEgip2.add(new PistaHobbie("Le gusta Viajar en moto "))  pistasLugarEgip2.add(new PistaHobbie("Tiene una cicatriz en la cara "))pistasLugarEgip2.add(new PistaLugar("Llevaba una bandera negra, roja y verde"))
		var List<Pista> pistasLugarEgip3=newArrayList
		pistasLugarEgip3.add(new PistaSenia("Le gusta Viajar en moto ")) pistasLugarEgip3.add(new PistaLugar("Queria conocer las montañas Hindu Kush"))
	
		
			
		/*Pistas Argentina */
		var List<Pista> pistasLugarArg=newArrayList
		pistasLugarArg.add(new PistaLugar("Cuidado el villano esta cerca"))  pistasLugarArg.add(new PistaLugar("El villano esta en el pais")) 
	    pistasLugarArg.add(new PistaSenia("Cuidado el villano esta cerca"))  pistasLugarArg.add(new PistaSenia("El villano esta en el pais")) 
	    
		/*Pistas donde no esta el villano*/
		var List<Pista> pistasSinVillano=newArrayList
		 pistasSinVillano.add(new PistaLugar("No hay nadie, con esas caracteristicas"))
		
		/*Lugares donde no esta el villano */
		var List<Lugar>lugaresSinVillano=newArrayList
		lugaresSinVillano.add(new Embajada("Embajada",personajeCuid,pistasSinVillano));lugaresSinVillano.add(new Biblioteca("Biblioteca",personajeCuid2,pistasSinVillano));lugaresSinVillano.add(new Club("Club ",personajeCuid3,pistasSinVillano))
		
		/*Lugares Egipto */
		var List<Lugar>lugaresEgipto=newArrayList
		lugaresEgipto.add(new Embajada("Embajada",personajeLugEgip1,pistasLugarEgip3));lugaresEgipto.add(new Biblioteca("Biblioteca",personajeLugEgip1,pistasLugarEgip2));lugaresEgipto.add(new Club("Club ",personajeLugEgip3,pistasLugarEgip))

		/*Lugares Afagnistan */
		var List<Lugar>lugaresAfg=newArrayList
		lugaresAfg.add(new Embajada("Embajada",personajeAfg,pistasLugarAfg2));lugaresAfg.add(new Biblioteca("Biblioteca",personajeAfg2,pistasLugarAfg));lugaresAfg.add(new Club("Club ",personajeAfg3,pistasLugarAfg3))
		
		/*Lugares Argentina */
		var List<Lugar>lugaresArg=newArrayList
		lugaresArg.add(new Embajada("Embajada",personajeArg,pistasLugarArg));lugaresArg.add(new Biblioteca("Biblioteca",personajeArg2,pistasLugarArg));lugaresArg.add(new Club("Club ",gaston,pistasLugarArg))
		
		/*Paises sin conexiones*/
		var List<Pais> sinConexion= newArrayList
		var List <String> sinCaracteristicas= newArrayList
		var Pais conexionEgipto2 = new Pais("Argelia", sinCaracteristicas, lugaresSinVillano, sinConexion)
		var Pais conexionEgipto3 = new Pais("Estados Unidos", sinCaracteristicas, lugaresSinVillano, sinConexion)
		var Pais conexionConAfag1= new Pais("Brasil", sinCaracteristicas, lugaresSinVillano, sinConexion)
		var Pais conexionConAfag2= new Pais("España", sinCaracteristicas, lugaresSinVillano, sinConexion)
		
		
		/*Paises con conexiones */
		/*Argentina */
		var List<String> caracterArg = newArrayList
		caracterArg.add("El obelisco");caracterArg.add("Caminito")
		var Pais conexionConAfag3= new Pais("Argentina", caracterArg, lugaresArg, sinConexion)
		
		/*Afagnistan*/
		var List<String> caracterAfg = newArrayList
		caracterAfg.add("Desierto enorme");caracterAfg.add("Montañas")
		var List<Pais> conexionesAfg = newArrayList
		conexionesAfg.add(conexionConAfag1) conexionesAfg.add(conexionConAfag2) conexionesAfg.add(conexionConAfag3)
		var Pais conexionEgipto1 = new Pais("Afganistán", caracterAfg, lugaresAfg, conexionesAfg)
		
		/*Egipto */
		var List<String> caracsEgipto = newArrayList
		caracsEgipto.add("mucho calor");caracsEgipto.add("pirámides")
		var List<Pais> conexionesEgipto = newArrayList
		conexionesEgipto.add(conexionEgipto1) conexionesEgipto.add(conexionEgipto2) conexionesEgipto.add(conexionEgipto3)
		var Pais paisInicio = new Pais("Egipto", caracsEgipto, lugaresEgipto, conexionesEgipto)
		
		/*Paises sistema */
		var List<Pais> paises = newArrayList
		paises.add(conexionConAfag3) paises.add(conexionConAfag2) paises.add(conexionConAfag1) paises.add(paisInicio) paises.add(conexionEgipto1) paises.add(conexionEgipto2) paises.add(conexionEgipto3)
		var List<Pais> recorridoVillano = newArrayList
		recorridoVillano.add(conexionEgipto1) recorridoVillano.add(conexionConAfag3) 
		/*Sistema */
		var Caso caso= new Caso(paisInicio, recorridoVillano, gaston, inicioCaso, nombreCaso)
		var Sistema sistema = new Sistema(caso, paises, villanos)
		new MenuDeAcciones(this, sistema)
	}
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
}