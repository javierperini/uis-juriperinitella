package test.java.personajes;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import main.java.personajes.Villano;
import main.java.pista.PistaHobbie;
import main.java.pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class VillanoTest {
	
	private Villano v;
	private PistaSenia ps;
	private PistaHobbie ph;
	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();

	@Before
	public void setUp() throws Exception {
		ph = new PistaHobbie("jugar a la canasta");
		ps = new PistaSenia("lunar sobre la boca");
		v = new Villano("Carmen Sandiego", "femenino", ph, ps);
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
	}

	@Test
	public void testGetInformacion() {
		v.getInformacion();
		assertEquals("Me atrapaste!!", outContent.toString());
	}

	@Test
	public void testPuedeRevelarPista() {
		assertFalse(v.puedeRevelarPista());
	}

	@Test
	public void testGetSexo() {
		assertEquals(v.getSexo(), "femenino");
	}

	@Test
	public void testGetHobbies() {
		assertEquals(v.getHobbie(), "jugar a la canasta");
	}

	@Test
	public void testGetSeniasPart() {
		assertEquals(v.getSeniasPart(), "lunar sobre la boca");
	}

	@Test
	public void testGetNombre() {
		assertEquals(v.getNombre(), "Carmen Sandiego");
	}

}
