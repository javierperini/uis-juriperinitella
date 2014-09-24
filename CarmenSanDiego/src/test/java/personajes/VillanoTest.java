package personajes;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import pista.PistaHobbie;
import pista.PistaSenia;

public class VillanoTest {

	private Villano v;
	private List<PistaSenia> ls = new ArrayList<PistaSenia>();
	private PistaSenia ps;
	private List<PistaHobbie> lh = new ArrayList<PistaHobbie>();
	private PistaHobbie ph;

	@Before
	public void setUp() throws Exception {
		ph = new PistaHobbie("jugar a la canasta");
		lh.add(ph);
		ps = new PistaSenia("lunar sobre la boca");
		ls.add(ps);
		v = new Villano("Carmen Sandiego", "Femenino", lh, ls);
	}

	@Test
	public void testGetInformacion() {
		assertEquals(v.getInformacion(), "ALTO! Deténgase, villano!!!");
	}

	@Test
	public void testPuedeRevelarPista() {
		assertFalse(v.puedeRevelarPista());
	}

	@Test
	public void testGetSexo() {
		assertEquals(v.getSexo(), "Femenino");
	}

	@Test
	public void testGetHobbies() {
		assertEquals(v.getHobbies().get(0).getPista(), "jugar a la canasta");
	}

	@Test
	public void testGetSeniasPart() {
		assertEquals(v.getSeniasParticulares().get(0).getPista(),
				"lunar sobre la boca");
	}

	@Test
	public void testGetNombre() {
		assertEquals(v.getNombre(), "Carmen Sandiego");
	}

}
