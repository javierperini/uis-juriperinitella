package test.java.detective;



import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;

import main.java.detective.Pais;
import main.java.lugares.Banco;
import main.java.lugares.Biblioteca;
import main.java.lugares.Club;
import main.java.lugares.Lugar;
import main.java.personajes.Cuidador;
import main.java.personajes.Informante;
import main.java.pista.Pista;
import main.java.pista.PistaLugar;
import main.java.pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class PaisTest {
	private Cuidador c;
	private PistaSenia ps;
	private Informante i;
	private PistaLugar pl;
	private Banco b;
	private Biblioteca bi;
	private ArrayList<Pista> pistas;
	private ArrayList<Lugar> lugares;
	private Club cl;
	private ArrayList<Pais> paises;
	private Pais chile;
	private Pais brasil;
	private Pais argentina;
	private ArrayList<Pais> paises2;
	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();


	@Before
	public void setUp(){
		/*Pistas*/
		
		pistas= new ArrayList<Pista>();
		ps = new PistaSenia("Era muy alta");
		pl = new PistaLugar("Quería visitar la torre Eiffel");
		pistas.add(ps);
		pistas.add(pl);
		
		/*Personajes*/
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");
		
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
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
	
	}
	@Test
	public void testNombreDePais(){
		assertEquals("Argentina",argentina.getNombre());
		assertEquals("Brasil",brasil.getNombre());
		assertEquals("Chile",chile.getNombre());
	}
	
	@Test
	public void testCaracteristicasDelPais(){
		assertEquals("Obelisco,La Bombonera y Charly Garcia",argentina.getCaracteristica());
		assertEquals("Los monos,Las favelas y Ronaldo de Fiesta",brasil.getCaracteristica());
		assertEquals("Se viene el agua, La cordillera y el hijo de Memem",chile.getCaracteristica());
	 }
	
	@Test
	public void testPaisesLimitrofes(){
		assertEquals(brasil,argentina.getPaisesLimitrofes().get(0));
		assertEquals(chile,argentina.getPaisesLimitrofes().get(1));
	}
	@Test
	public void testIrALugar(){
		argentina.irALugar(3);
		assertEquals(cl.getClass(),argentina.getLugarActual().getClass());
		argentina.irALugar(2);
		assertEquals(bi.getClass(),argentina.getLugarActual().getClass());
		argentina.irALugar(1);
		assertEquals(b.getClass(),argentina.getLugarActual().getClass());
	}
	@Test
	public void testHablarConPersonaje(){
		argentina.irALugar(1);
		argentina.hablarConElPersonaje();
		assertEquals("El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá\n", outContent.toString());
	}

}
