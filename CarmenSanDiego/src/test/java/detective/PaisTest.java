package test.java.detective;

import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

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
	private Informante i;

	private List<Pista> pistas = new ArrayList<Pista>();
	private PistaSenia ps;
	private PistaLugar pl;
	
	private ArrayList<Lugar> lugares = new ArrayList<Lugar>();
	private Banco ba;
	private Biblioteca bi;
	private Club cl;

	private ArrayList<String> caracs;
	private String carac1;
	private String carac2;
	private String carac3;

	private ArrayList<Pais> paises = new ArrayList<Pais>();
	private ArrayList<Pais> paisesBra = new ArrayList<Pais>();
	private ArrayList<Pais> paisesChi = new ArrayList<Pais>();
	private ArrayList<Pais> paisesArg = new ArrayList<Pais>();
	private Pais chile;
	private Pais brasil;
	private Pais argentina;

	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();


	@Before
	public void setUp() throws Exception{
		/*Pistas*/
		ps = new PistaSenia("Era muy alta");
		pl = new PistaLugar("Quería visitar la torre Eiffel");
		pistas.add(ps);
		pistas.add(pl);
		
		/*Personajes*/
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");
		
		/* Lugares */
		ba = new Banco(c, pistas);
		bi = new Biblioteca(i, pistas);
		
		/*Club*/
		cl= new Club(i,pistas);
		lugares.add(ba);
		lugares.add(bi);
		lugares.add(cl);
		
		/*Paises*/
			/*Brasil*/
		brasil= new Pais();
		brasil.setNombre("Brasil");
		carac1 = "Los monos";
		carac2 = "Las favelas";
		carac3 = "Ronaldo de fiesta";
		caracs = new ArrayList<String>();
		caracs.add(carac1);caracs.add(carac2);caracs.add(carac3);
		brasil.setCaracteristicas(caracs);
		brasil.setLugares(lugares);
			/*Chile*/
		chile= new Pais();
		chile.setNombre("Chile");
		carac1 = "Se viene el agua";
		carac2 = "La cordillera";
		carac3 = "El hijo de Menem";
		caracs = new ArrayList<String>();
		caracs.add(carac1);caracs.add(carac2);caracs.add(carac3);
		chile.setCaracteristicas(caracs);
		chile.setLugares(lugares);
			/*Argentina*/
		argentina= new Pais();
		argentina.setNombre("Argentina");
		carac1 = "Obelisco";
		carac2 = "La bombonera";
		carac3 = "Charly García";
		caracs = new ArrayList<String>();
		caracs.add(carac1);caracs.add(carac2);caracs.add(carac3);
		argentina.setCaracteristicas(caracs);
		argentina.setLugares(lugares);
		
		paisesBra.add(argentina);paisesBra.add(chile);
		paisesChi.add(argentina);paisesBra.add(brasil);
		paisesArg.add(brasil);paisesArg.add(chile);
		/*paises.add(argentina);*/paises.add(brasil);paises.add(chile);
		brasil.setPaisesLimitrofes(paisesBra);
		chile.setPaisesLimitrofes(paisesChi);
		argentina.setPaisesLimitrofes(paisesArg);
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
	
	}
	@Test
	public void testNombreDePais(){
		assertEquals("Argentina", argentina.getNombre());
		assertEquals("Brasil", brasil.getNombre());
		assertEquals("Chile", chile.getNombre());
	}
	
	@Test
	public void testCaracteristicasDelPais(){
		assertEquals("Obelisco", argentina.getCaracteristicas().get(0));
		assertEquals("La bombonera", argentina.getCaracteristicas().get(1));
		assertEquals("Charly García", argentina.getCaracteristicas().get(2));
		assertEquals("Los monos", brasil.getCaracteristicas().get(0));
		assertEquals("Las favelas", brasil.getCaracteristicas().get(1));
		assertEquals("Ronaldo de fiesta", brasil.getCaracteristicas().get(2));
		assertEquals("Se viene el agua", chile.getCaracteristicas().get(0));
		assertEquals("La cordillera", chile.getCaracteristicas().get(1));
		assertEquals("El hijo de Menem", chile.getCaracteristicas().get(2));
	 }
	
	@Test
	public void testPaisesLimitrofes(){
		assertEquals(brasil, argentina.getPaisesLimitrofes().get(0));
		assertEquals(chile, argentina.getPaisesLimitrofes().get(1));
	}
	@Test
	public void testIrALugar(){
		argentina.irALugar(3);
		assertEquals(cl.getClass(), argentina.getLugarActual().getClass());
		argentina.irALugar(2);
		assertEquals(bi.getClass(), argentina.getLugarActual().getClass());
		argentina.irALugar(1);
		assertEquals(ba.getClass(), argentina.getLugarActual().getClass());
	}
	@Test
	public void testHablarConPersonaje(){
		argentina.irALugar(1);
		argentina.hablarConElPersonaje();
		assertEquals("El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá\n", outContent.toString());
	}

}

