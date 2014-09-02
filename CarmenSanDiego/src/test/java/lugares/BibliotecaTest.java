package test.java.lugares;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import main.java.lugares.Biblioteca;
import main.java.personajes.Cuidador;
import main.java.personajes.Informante;
import main.java.personajes.Villano;
import main.java.pista.Pista;
import main.java.pista.PistaHobbie;
import main.java.pista.PistaLugar;
import main.java.pista.PistaSenia;

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
	private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
	private final ByteArrayOutputStream errContent = new ByteArrayOutputStream();

	@Before
	public void setUp() throws Exception {
		/* Auxiliares */
		ph = new PistaHobbie("Jugar a la canasta");
		ps1 = new PistaSenia("Lunar sobre la boca");
		v = new Villano("Carmen Sandiego", "femenino", ph, ps1);
		c = new Cuidador("Pepito el pistolero");
		i = new Informante("Anyi Tella Arena");
		
		/* Biblioteca */
		pl = new PistaLugar("Se fue a la torre Eiffel");
		ps = new PistaSenia("Era muy alto");
		pistas.add(pl);
		pistas.add(ps);
		pistas.add(ph);
		b = new Biblioteca(c, pistas);
		
		System.setOut(new PrintStream(outContent));
		System.setErr(new PrintStream(errContent));
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
	public void testImprimirPistasCuidador() {
		b.imprimirPistas();
		assertEquals("El cuidador Pepito el pistolero dice: Te equivocaste de país, el villano no paso por acá\n", outContent.toString());
	}
	
	@Test
	public void testImprimirPistasVillano() {
		b = new Biblioteca(v, pistas);
		b.imprimirPistas();
		assertEquals("Me atrapaste!!", outContent.toString());
		
	}
	
	@Test
	public void testImprimirPistasInformante() {
		//falla si se muestra la tercera pista, ARREGLAR
		b = new Biblioteca(i, pistas);
		b.imprimirPistas();
		assertEquals("El informante Anyi Tella Arena dice: CUIDADO! Un cuchillo volador pasó muy cerca de tu oreja.\nSe fue a la torre Eiffel\nEra muy alto\n", outContent.toString());
	}

}