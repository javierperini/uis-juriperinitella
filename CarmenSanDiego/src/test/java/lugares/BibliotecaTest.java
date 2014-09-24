package lugares;

import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import lugares.Biblioteca;
import personajes.Cuidador;
import personajes.Informante;
import personajes.Villano;
import pista.Pista;
import pista.PistaHobbie;
import pista.PistaLugar;
import pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class BibliotecaTest {
	
	private Biblioteca b;
	private Cuidador c;
	private Villano v;
	private Informante i;
	private List<Pista> pistas = new ArrayList<Pista>();
	private PistaLugar pl;
	private PistaSenia ps;
	private PistaHobbie ph;
	private PistaSenia ps1;

	@Before
	public void setUp() throws Exception {
		/* Auxiliares */
		ph = new PistaHobbie("Jugar a la canasta");
		ps1 = new PistaSenia("Lunar sobre la boca");
		v = new Villano("Carmen Sandiego", "F", null, null);
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");
		
		/* Biblioteca */
		pl = new PistaLugar("Se fue a la torre Eiffel");
		ps = new PistaSenia("Era muy alto");
		pistas.add(pl);
		pistas.add(ps);
		pistas.add(ph);
		b = new Biblioteca("Biblioteca", c, pistas);
	}

	@Test
	public void testGetOcupante() {
		assertEquals(b.getOcupante(), c);
	}

	@Test
	public void testGetPistas() {
		assertEquals(b.getPistas().size(), 3);
	}

	@Test
	public void testPistasCuidador() {
		assertEquals(b.interrogarOcupante().size(), 1);
		assertEquals(b.interrogarOcupante().get(0), "El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá");
	}
	
	@Test
	public void testPistasVillano() {
		b = new Biblioteca("Biblioteca", v, pistas);
		assertEquals(b.interrogarOcupante().size(), 1);
		assertEquals(b.interrogarOcupante().get(0), "Me encontraste!!");
	}
	
	@Test
	public void testImprimirPistasInformante() {
		b = new Biblioteca("Biblioteca", i, pistas);
		assertTrue(b.interrogarOcupante().size() == 3 || b.interrogarOcupante().size() == 4);
		assertEquals(b.interrogarOcupante().get(0), "El informante Anyi Tella Arena dice: ");
		assertEquals(b.interrogarOcupante().get(1), "Se fue a la torre Eiffel");
		assertEquals(b.interrogarOcupante().get(2), "Era muy alto");
	}

}
