package detective;

import static org.junit.Assert.*;
import detective.OrdenDeArresto;
import personajes.Villano;
import pista.PistaHobbie;
import pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class OrdenDeArrestoTest {
	
	OrdenDeArresto orden;
	private PistaHobbie ph;
	private PistaSenia ps;
	private Villano v;
	
	@Before
	public void setUp() throws Exception {
		orden = new OrdenDeArresto();
		ph = new PistaHobbie("Le gusta coleccionar armas");
		ps = new PistaSenia("Tenía un parche en el ojo derecho");
		v = new Villano();
	}

	
	@Test
	public void testPistaHobbie() {
		orden.agregarPistaHobbie(ph);
		assertEquals(ph, orden.getPistasHobbie().get(0));
	}
	
	@Test
	public void testPistaSenia() {
		orden.agregarPistaSenia(ps);
		assertEquals(ps, orden.getPistasSenia().get(0));
	}
	
	@Test
	public void testVillano(){
		orden.setVillano(v);
		assertEquals(v, orden.getVillano());
	}

}
