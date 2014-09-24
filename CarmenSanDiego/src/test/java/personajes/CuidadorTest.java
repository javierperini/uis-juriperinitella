package personajes;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import org.junit.Before;
import org.junit.Test;

public class CuidadorTest {

	private Cuidador c;

	@Before
	public void setUp() throws Exception {
		c = new Cuidador("Adrián Juri");
	}

	@Test
	public void testGetInformacion() {
		assertEquals(
				c.getInformacion(),
				"El cuidador Adrián Juri dice: Te equivocaste de país, el villano no paso por acá");
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
