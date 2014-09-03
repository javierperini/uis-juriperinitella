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
//		assertEquals(null, orden.getPistaHobbie()); nos dijeron que no hagamos esto j3j3
		orden.setPistaHobbie(ph);
		assertEquals(ph, orden.getPistaHobbie());
	}
	
	@Test
	public void testPistaSenia() {
//		assertEquals(null, orden.getPistaSenia()); idem
		orden.setPistaSenia(ps);
		assertEquals(ps, orden.getPistaSenia());
	}
	
	@Test
	public void testVillano(){
//		assertEquals(null, orden.getVillano()); javi trolo
		orden.setVillano(v);
		assertEquals(v, orden.getVillano());
	}

}
