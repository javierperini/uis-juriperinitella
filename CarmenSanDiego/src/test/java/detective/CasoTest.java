package detective;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import detective.Caso;
import detective.Pais;
import lugares.Banco;
import lugares.Biblioteca;
import lugares.Club;
import lugares.Lugar;
import personajes.Cuidador;
import personajes.Informante;
import personajes.Villano;
import pista.Pista;
import pista.PistaLugar;
import pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class CasoTest {

	private Caso caso;

	private Club cl;
	private Biblioteca bi;
	private Banco b;
	private ArrayList<Lugar> lugares;
	
	private Informante i;
	private Cuidador c;
	private Villano v;

	private ArrayList<Pista> pistas;
	private PistaSenia ps;
	private PistaLugar pl;

	private List<Pais> paises = new ArrayList<Pais>();
	private List<Pais> paisesBra = new ArrayList<Pais>();
	private List<Pais> paisesChi = new ArrayList<Pais>();
	private List<Pais> paisesArg = new ArrayList<Pais>();
	private Pais argentina;
	private Pais brasil;
	private Pais chile;
	
	private String carac1;
	private String carac2;
	private String carac3;
	private ArrayList<String> caracs;

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
		
		/*Caso*/
		this.caso= new Caso(argentina, paises, v, "Se robaron las papasFritas de todo MCDONALDS","Robo de PapasFritas");
	}

	@Test
	public void testPaisDeInicio() {
		assertEquals(argentina, caso.getPaisInicio());
	}
	@Test
	public void testRecorridoDelVillano(){
		assertEquals(2, caso.getReocorridoVillano().size());
		assertEquals(brasil, caso.getReocorridoVillano().get(0));
		assertEquals(chile, caso.getReocorridoVillano().get(1));
	}
	@Test
	public void testVillano(){
		assertEquals(v, caso.getVillano());
	}
	@Test
	public void testMensajeInicial(){
		assertEquals("Se robaron las papasFritas de todo MCDONALDS",caso.getInicioCaso());
	}

}
