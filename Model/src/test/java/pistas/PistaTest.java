package pistas;

import static org.junit.Assert.*;
import pista.PistaHobbie;
import pista.PistaLugar;
import pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class PistaTest {
	
	private PistaHobbie ph;
	private PistaLugar pl;
	private PistaSenia ps;

	@Before
	public void setUp() throws Exception {
		ph = new PistaHobbie("Le gusta coleccionar armas");
		pl = new PistaLugar("Escuché que iba a visitar las pirámides");
		ps = new PistaSenia("Tenía un parche en el ojo derecho");
	}

	@Test
	public void testGetPista() {
		assertEquals(ph.getPista(), "Le gusta coleccionar armas");
		assertEquals(pl.getPista(), "Escuché que iba a visitar las pirámides");
		assertEquals(ps.getPista(), "Tenía un parche en el ojo derecho");
	}
	@Test
	public void testVillano(){
		//CUANDO ARREGLEN EL COSTRUCTOR DE VILLANO LO TESTEO
	}

}
