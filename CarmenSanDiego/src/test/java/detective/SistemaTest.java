package detective;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import detective.Caso;
import detective.Pais;
import detective.Sistema;
import lugares.Banco;
import lugares.Club;
import lugares.Embajada;
import lugares.Lugar;
import personajes.Villano;
import pista.PistaHobbie;
import pista.PistaSenia;

import org.junit.Before;
import org.junit.Test;

public class SistemaTest {

	private Sistema s;

	private List<Pais> paisesSistema = new ArrayList<Pais>();
	private List<Villano> villanosSistema = new ArrayList<Villano>();
	// private Pais paisMock;
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

	private String nombreCaso;

	@Before
	public void setUp() throws Exception {
		caracteristicas.add("Carac 1");
		caracteristicas.add("Carac 2");
		caracteristicas.add("Carac 3");
		banco = mock(Banco.class);
		club = mock(Club.class);
		embajada = mock(Embajada.class);
		lugares.add(banco);
		lugares.add(club);
		lugares.add(embajada);
		paisInicio = new Pais("Legolandia", caracteristicas, lugares, null);

		argentina = mock(Pais.class);
		brasil = mock(Pais.class);
		chile = mock(Pais.class);
		recorridoVillano.add(argentina);
		recorridoVillano.add(brasil);
		recorridoVillano.add(chile);

		hobbie = mock(PistaHobbie.class);
		hobbies.add(hobbie);
		seniaPart = mock(PistaSenia.class);
		seniasPart.add(seniaPart);
		villano = new Villano("Carmen Sandiego", "F", hobbies, seniasPart);
		inicioCaso = "Hola, esto es una prueba del inicio del caso";
		nombreCaso = "Hola, esto es una prueba del nombre del caso";

		caso = new Caso(paisInicio, recorridoVillano, villano, inicioCaso,
				nombreCaso);
		villanoMock = mock(Villano.class);
		paisesSistema.add(argentina);
		paisesSistema.add(brasil);
		paisesSistema.add(chile);
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
	public void testIniciarJuego() {
		assertEquals(s.iniciarJuego(),
				"Hola, esto es una prueba del inicio del caso");
	}

	// @Test
	// public void testGanoElJuego() {
	// assertFalse(s.ganoElJuego());
	// }
}
