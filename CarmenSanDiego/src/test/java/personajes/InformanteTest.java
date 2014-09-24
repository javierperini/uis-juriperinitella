package personajes;

import static org.junit.Assert.*;
import personajes.Informante;

import org.junit.Before;
import org.junit.Test;

public class InformanteTest {

	private Informante i;

	@Before
	public void setUp() throws Exception {
		i = new Informante("Javier 'El buchón' Perini");
	}

	@Test
	public void testGetInformacion() {
		// ??
	}

	@Test
	public void testPuedeRevelarPista() {
		assertTrue(i.puedeRevelarPista());
	}

	@Test
	public void testGetNombre() {
		assertEquals(i.getNombre(), "Javier 'El buchón' Perini");
	}

}
