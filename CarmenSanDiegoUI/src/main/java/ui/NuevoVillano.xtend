package main.java.ui

import java.awt.Color
import main.java.personajes.Villano
import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import main.java.detective.Sistema

class NuevoVillano extends SimpleWindow<Sistema> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
//		title = "Nuevo Villano"
//		taskDescription = "Crear Nuevo Villano"
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Nuevo Villano")
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))

		new Label(colPanel).setText("Nombre: ")
		new TextBox(colPanel).bindValueToProperty("villanoEnCreacion.nombre")
		new Label(colPanel).setText("Sexo: ")
		new TextBox(colPanel).bindValueToProperty("villanoEnCreacion.sexo")

		var Table<PistaSenia> tablaDeSenias = new Table<PistaSenia>(mainPanel, PistaSenia)
		tablaDeSenias.bindItemsToProperty("villanoEnCreacion.seniasPart")
		tablaDeSenias.width = 200
		new Column<PistaSenia>(tablaDeSenias) => [
			title = "Señas particulares" 
			bindContentsToProperty("pista")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Señas Particulares"
					onClick [ | new EditarSeniasParticulares(owner, modelObject.villanoEnCreacion).open ]
		]
		
		var Table<PistaHobbie> tablaDeHobbies = new Table<PistaHobbie>(mainPanel, PistaHobbie)
		tablaDeHobbies.bindItemsToProperty("villanoEnCreacion.hobbies")
		tablaDeHobbies.width = 200
		new Column<PistaHobbie>(tablaDeHobbies) => [
			title = "Hobbies" 
			bindContentsToProperty("pista")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar hobbies"
					onClick [ | new EditarHobbies(owner, modelObject.villanoEnCreacion).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			
					onClick [ |  // modelObject.agregarVillanoALaLista				ARREGLAR!!!
								close
							]
		]

	//		new ErrorsPanel(mainPanel, "nombre: ")
	//
	//		new Label(mainPanel).setText("Ingrese la longitud en millas")
	//
	//		new TextBox(mainPanel).bindValueToProperty("sexo")
	//
	//		new Button(mainPanel) => [
	//			caption = "Convertir a kilÃ³metros"
	//			onClick [ | this.modelObject.convertir ]
	//		]
	//
	//		new Label(mainPanel)
	//			.setBackground(Color::ORANGE)
	//			.bindValueToProperty("kilometros")
	//
	//		new Label(mainPanel).setText(" kilÃ³metros")
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}



}
