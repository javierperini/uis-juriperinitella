package test.java.detective;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import main.java.detective.Caso;
import main.java.detective.Pais;
import main.java.detective.Sistema;
import main.java.lugares.Banco;
import main.java.lugares.Club;
import main.java.lugares.Embajada;
import main.java.lugares.Lugar;
import main.java.personajes.Villano;
import main.java.pista.PistaHobbie;
import main.java.pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class SistemaTest {
	
	private Sistema s;
	
	private List<Pais> paisesSistema = new ArrayList<Pais>();
	private List<Villano> villanosSistema = new ArrayList<Villano>();
	private Pais paisMock;
	private Villano villanoMock;

	/* Caso */
	private Caso caso;
	private List<Pais> recorridoVillano = new ArrayList<Pais>();
	private Pais argentina;
	private Pais brasil;
	private Pais chile;
	private Villano villano;
	private String inicioCaso;

		/* País inicial del caso */
	private Pais paisInicio;
	private List<String> caracteristicas = new ArrayList<String>();
	private List<Lugar> lugares = new ArrayList<Lugar>();
	private Banco banco;
	private Club club;
	private Embajada embajada; 
		/* RecorridoVillano */
	private PistaHobbie hobbie;
	private List<PistaHobbie> hobbies = new ArrayList<PistaHobbie>();
	private PistaSenia seniaPart;
	private List<PistaSenia> seniasPart = new ArrayList<PistaSenia>();

	
	@Before
	public void setUp() throws Exception{
		caracteristicas.add("Carac 1");caracteristicas.add("Carac 2");caracteristicas.add("Carac 3");
		banco = mock(Banco.class);
		club = mock(Club.class);
		embajada = mock(Embajada.class);
		lugares.add(banco);lugares.add(club);lugares.add(embajada);
		paisInicio = new Pais("Legolandia", caracteristicas, lugares);
		
		argentina = mock(Pais.class);
		brasil = mock(Pais.class);
		chile = mock(Pais.class);
		recorridoVillano.add(argentina);recorridoVillano.add(brasil);recorridoVillano.add(chile);
		
		hobbie = mock(PistaHobbie.class);
		hobbies.add(hobbie);
		seniaPart = mock(PistaSenia.class);
		seniasPart.add(seniaPart);
		villano = new Villano("Carmen Sandiego", "F", hobbies, seniasPart);
		inicioCaso = "Hola, esto es una prueba del inicio del caso";
		
		caso = new Caso(paisInicio, recorridoVillano, villano, inicioCaso);
		villanoMock = mock(Villano.class);
		paisesSistema.add(argentina);paisesSistema.add(brasil);paisesSistema.add(chile);
		villanosSistema.add(villanoMock);
		
		s = new Sistema(caso, paisesSistema, villanosSistema);
	}

	@Test
	public void testGetCaso() {
		assertEquals(s.getCaso(), caso);
	}

	@Test
	public void testGetPaisesSistema() {
		assertEquals(s.getPaisesSistema(), paisesSistema);
	}

	@Test
	public void testGetVillanosSistema() {
		assertEquals(s.getVillanosSistema(), villanosSistema);
	}

	@Test
	public void testGetVillanoSeleccionado() {
		s.setVillanoSeleccionado(villano);
		assertEquals(s.getVillanoSeleccionado(), villano);
	}

	@Test
	public void testGetPaisSeleccionado() {
		s.setPaisSeleccionado(paisInicio);
		assertEquals(s.getPaisSeleccionado(), paisInicio);
	}

	@Test
	public void testGetSeniasVillanoSeleccionado() {
		s.setVillanoSeleccionado(villano);
		s.setSeniasVillanoSeleccionado(villano.getSeniasPart().get(0));
		assertEquals(s.getSeniasVillanoSeleccionado(), villano.getSeniasPart().get(0));
	}

	@Test // Daban mal porque dependian de los hobbies seleccionados
	public void testGetHobbiesVillanoSeleccionado() {
		s.setVillanoSeleccionado(villano);
		s.setHobbiesVillanoSeleccionado(villano.getHobbies().get(0));
		assertEquals(s.getHobbiesVillanoSeleccionado(), villano.getHobbies().get(0));
	}

//	@Test
//	public void testGetVillanoEnCreacion() {
//		// ??
//		fail("Not yet implemented");
//	}
//	
//	@Test
//	public void testGetPaisEnCreacion() {
//		// ??
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSistemaCasoListOfPaisListOfVillano() {
//		// ké, me lo puso automaticamente junit
//		fail("Not yet implemented");
//	}
	
	@Test
	public void testViajar() {
		assertEquals(s.getPaisesVisitados().size(), 0);
		assertEquals(s.getPaisesSistema().size(), 3);
		s.viajar(brasil);
		assertEquals(s.getPaisesVisitados().size(), 1);
		
	}

	@Test
	public void testVolverAPaisAnterior() {
		s.viajar(brasil);
		assertEquals(s.getPaisesVisitados().size(), 1);
		assertEquals(s.getPaisesSistema().size(), 2);
		s.volverAPaisAnterior();
		assertEquals(s.getPaisesVisitados().size(), 0);
		assertEquals(s.getPaisesSistema().size(), 3);
	}

	@Test
	public void testIniciarJuego() {
		assertEquals(s.iniciarJuego(), "Hola, esto es una prueba del inicio del caso");
	}

//	@Test
//	public void testGenerarOrdenDeArrestro() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testCompletarHobbieOrdenDeArresto() {
		s.completarHobbieOrdenDeArresto(hobbie);
		assertEquals(s.getOrdenDeArresto().getPistasHobbie().size(), 1);
	}

	@Test
	public void testCompletarSeniaOrdenDeArresto() {
		s.completarSeniaOrdenDeArresto(seniaPart);
		assertEquals(s.getOrdenDeArresto().getPistasSenia().size(), 1);
	}

	@Test
	public void testGanoElJuego() {
	//	assertFalse(s.ganoElJuego());
	}

//	@Test
//	public void testAgregarVillanoALaLista() {
//		fail("Not yet implemented");
//	}

}
