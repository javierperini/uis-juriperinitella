package test.java.detective;

import static org.junit.Assert.*;

import java.util.ArrayList;

import main.java.detective.Caso;
import main.java.detective.Pais;
import main.java.lugares.Banco;
import main.java.lugares.Biblioteca;
import main.java.lugares.Club;
import main.java.lugares.Lugar;
import main.java.personajes.Cuidador;
import main.java.personajes.Informante;
import main.java.personajes.Villano;
import main.java.pista.Pista;
import main.java.pista.PistaLugar;
import main.java.pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class CasoTest {

	private Club cl;
	private ArrayList<Lugar> lugares;
	private Biblioteca bi;
	private Banco b;
	private Informante i;
	private Cuidador c;
	private ArrayList<Pista> pistas;
	private PistaSenia ps;
	private PistaLugar pl;
	private ArrayList<Pais> paises2;
	private Pais brasil;
	private Pais chile;
	private ArrayList<Pais> paises;
	private Pais argentina;
	private Caso caso;
	private Villano v;

	@Before
	public void setUp() throws Exception {
	/*Pistas*/
		
		pistas= new ArrayList<Pista>();
		ps = new PistaSenia("Era muy alta");
		pl = new PistaLugar("Quería visitar la torre Eiffel");
		pistas.add(ps);
		pistas.add(pl);
		
		/*Personajes*/
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");
		v = new Villano();
		
		/* Banco */
		b = new Banco(c, pistas);
		
		/* Biblioteca */
		bi = new Biblioteca(i, pistas);
		
		/*Club*/
		cl= new Club(i,pistas);
		lugares= new ArrayList<Lugar>();
		lugares.add(b);
		lugares.add(bi);
		lugares.add(cl);
		
		/*Paises*/
		paises2= new ArrayList<Pais>();
		brasil= new Pais();
		brasil.setCaracteristica("Los monos,Las favelas y Ronaldo de Fiesta");
		brasil.setNombre("Brasil");
		brasil.setLugares(lugares);
		brasil.setPaisesLimitrofes(paises2);
		chile= new Pais();
		chile.setCaracteristica("Se viene el agua, La cordillera y el hijo de Memem");
		chile.setNombre("Chile");
		chile.setLugares(lugares);
		chile.setPaisesLimitrofes(paises2);
		paises= new ArrayList<Pais>(); 
		paises.add(brasil);
		paises.add(chile);
		argentina= new Pais();
		argentina.setCaracteristica("Obelisco,La Bombonera y Charly Garcia");
		argentina.setNombre("Argentina");
		argentina.setLugares(lugares);
		argentina.setPaisesLimitrofes(paises);
		
		/*Caso*/
		this.caso= new Caso(argentina, paises, v, "Se robaron las papasFritas de todo MCDONALS");
	}

	@Test
	public void testPaisDeInicio() {
		assertEquals(argentina,caso.getPaisInicio());
	}
	@Test
	public void testRecorridoDelVillano(){
		assertEquals(2,caso.getReocorridoVillano().size());
		assertEquals(brasil,caso.getReocorridoVillano().get(0));
		assertEquals(chile,caso.getReocorridoVillano().get(1));
	}
	@Test
	public void testVillano(){
		assertEquals(v,caso.getVillano());
	}
	@Test
	public void testMensajeInicial(){
		assertEquals("Se robaron las papasFritas de todo MCDONALS",caso.getInicioCaso());
	}

}
