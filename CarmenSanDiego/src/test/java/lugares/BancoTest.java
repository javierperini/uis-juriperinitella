package test.java.lugares;

import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import main.java.lugares.Banco;
import main.java.personajes.Cuidador;
import main.java.personajes.Informante;
import main.java.personajes.Villano;
import main.java.pista.Pista;
import main.java.pista.PistaHobbie;
import main.java.pista.PistaLugar;
import main.java.pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class BancoTest {
	
	private Banco b;
	private Cuidador c;
	private Villano v;
	private Informante i;
	private List<Pista> pistas = new ArrayList<Pista>();
	private PistaHobbie ph;
	private PistaSenia ps;
	private PistaLugar pl;
	
	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();

	@Before
	public void setUp() throws Exception {
		/* Auxiliares */
		c = new Cuidador("Pepito el pistolero");
//		ph = new PistaHobbie("coleccionar monedas");
//		ps = new PistaSenia("Era muy alta");
//		REVISAR. ARREGLAR CONSTRUCTORES VILLANO
		v = new Villano();
		i = new Informante("Anyi Tella Arena");

		/* Banco */
		pl = new PistaLugar("Quería visitar la torre Eiffel");
		pistas.add(ps);
		pistas.add(pl);
		b = new Banco(c, pistas);
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
	}

	@Test
	public void testGetOcupante() {
		assertEquals(b.getOcupante(), c);
	}

	@Test
	public void testGetPistas() {
		assertEquals(b.getPistas().size(), 2);
	}

	@Test
	public void testImprimirPistasCuidador() {
		b.imprimirPistas();
		assertEquals("El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá\n", outContent.toString());
	}
	
	@Test
	public void testImprimirPistasVillano() {
		b = new Banco(v, pistas);
		b.imprimirPistas();
		assertEquals("Me atrapaste!!", outContent.toString());
		
	}
	
	@Test
	public void testImprimirPistasInformante() {
		b = new Banco(i, pistas);
		b.imprimirPistas();
		assertEquals("El informante Anyi Tella Arena dice: CUIDADO! Un cuchillo volador pasó muy cerca de tu oreja.\nEra muy alta\nQuería visitar la torre Eiffel\n", outContent.toString());
	}

}
