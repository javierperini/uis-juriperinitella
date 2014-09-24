package lugares;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import personajes.Cuidador;
import personajes.Informante;
import personajes.Villano;
import pista.Pista;
import pista.PistaLugar;
import pista.PistaSenia;

public class BancoTest {

	private Banco b;
	private Cuidador c;
	private Villano v;
	private Informante i;
	private List<Pista> pistas = new ArrayList<Pista>();
	private PistaSenia ps;
	private PistaLugar pl;

	@Before
	public void setUp() throws Exception {
		/* Auxiliares */
		c = new Cuidador("Pepito el pistolero");
		ps = new PistaSenia("Era muy alta");
		v = new Villano("Carmen Sandiego", "F", null, null);
		i = new Informante("Anyi Tella Arena");

		/* Banco */
		pl = new PistaLugar("Quería visitar la torre Eiffel");
		pistas.add(ps);
		pistas.add(pl);
		b = new Banco("Banco", c, pistas);
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
	public void testPistasCuidador() {
		assertEquals(b.interrogarOcupante().size(), 1);
		assertEquals(
				b.interrogarOcupante().get(0),
				"El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá");
	}

	@Test
	public void testPistasVillano() {
		b = new Banco("Banco", v, pistas);
		assertEquals(b.interrogarOcupante().size(), 1);
		assertEquals(b.interrogarOcupante().get(0), "ALTO! Deténgase, villano!!!");
	}

	@Test
	public void testImprimirPistasInformante() {
		b = new Banco("Banco", i, pistas);
		assertTrue(b.interrogarOcupante().size() == 3
				|| b.interrogarOcupante().size() == 4);
		assertEquals(b.interrogarOcupante().get(0),
				"El informante Anyi Tella Arena dice: ");
		assertEquals(b.interrogarOcupante().get(1), "Era muy alta");
		assertEquals(b.interrogarOcupante().get(2),
				"Quería visitar la torre Eiffel");
	}
}
