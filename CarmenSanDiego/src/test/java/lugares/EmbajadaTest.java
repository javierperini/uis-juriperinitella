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
import pista.PistaHobbie;
import pista.PistaLugar;
import pista.PistaSenia;

public class EmbajadaTest {

	private Embajada embajada;
	private Cuidador c;
	private Villano v;
	private Informante i;
	private List<Pista> pistas = new ArrayList<Pista>();
	private PistaLugar pl;
	private PistaSenia ps;
	private PistaHobbie ph;

	@Before
	public void setUp() throws Exception {
		/* Auxiliares */
		ph = new PistaHobbie("Jugar a la canasta");
		new PistaSenia("Lunar sobre la boca");
		v = new Villano("Carmen Sandiego", "F", null, null);
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");

		/* Biblioteca */
		pl = new PistaLugar("Se fue a la torre Eiffel");
		ps = new PistaSenia("Era muy alto");
		pistas.add(pl);
		pistas.add(ps);
		pistas.add(ph);
		embajada = new Embajada("Embajada", c, pistas);
	}

	@Test
	public void testGetOcupante() {
		assertEquals(embajada.getOcupante(), c);
	}

	@Test
	public void testGetPistas() {
		assertEquals(embajada.getPistas().size(), 3);
	}

	@Test
	public void testPistasCuidador() {
		assertEquals(embajada.interrogarOcupante().size(), 1);
		assertEquals(
				embajada.interrogarOcupante().get(0),
				"El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá");
	}

	@Test
	public void testPistasVillano() {
		embajada = new Embajada("Embajada", v, pistas);
		assertEquals(embajada.interrogarOcupante().size(), 1);
		assertEquals(embajada.interrogarOcupante().get(0), "Me encontraste!!");
	}

	@Test
	public void testImprimirPistasInformante() {
		embajada = new Embajada("Embajada", i, pistas);
		assertTrue(embajada.interrogarOcupante().size() == 3
				|| embajada.interrogarOcupante().size() == 4);
		assertEquals(embajada.interrogarOcupante().get(0),
				"El informante Anyi Tella Arena dice: ");
		assertEquals(embajada.interrogarOcupante().get(1),
				"Se fue a la torre Eiffel");
		assertEquals(embajada.interrogarOcupante().get(2), "Era muy alto");
	}

}