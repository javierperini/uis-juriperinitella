package personajes;

import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import personajes.Cuidador;

import org.junit.Before;
import org.junit.Test;

public class CuidadorTest {
	
	private Cuidador  c;
	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();

	@Before
	public void setUp() throws Exception {
		c = new Cuidador("Adrián Juri");
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
	}

	@Test
	public void testGetInformacion() {
		c.getInformacion();
		assertEquals("El cuidador Adrián Juri dice: Te equivocaste de país, el villano no paso por acá\n", outContent.toString());
	}

	@Test
	public void testPuedeRevelarPista() {
		assertFalse(c.puedeRevelarPista());
	}

	@Test
	public void testGetNombre() {
		assertEquals(c.getNombre(), "Adrián Juri");
	}

}
