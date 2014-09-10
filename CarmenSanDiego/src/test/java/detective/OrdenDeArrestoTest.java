package test.java.detective;

import static org.junit.Assert.*;
import main.java.detective.OrdenDeArresto;
import main.java.personajes.Villano;
import main.java.pista.PistaHobbie;
import main.java.pista.PistaSenia;

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
