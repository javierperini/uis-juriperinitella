package main.java.ui

import main.java.personajes.Villano
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.tables.Table
import main.java.pista.PistaSenia
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NuevoVillano extends SimpleWindow<Villano> {
	
	new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		title = "Nuevo Villano"
		taskDescription = "Crear Nuevo Villano"
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Nuevo Villano")
		val form = new Panel(mainPanel)
		form.setLayout(new ColumnLayout(2))

		new Label(form).setText("Nombre: ")
		new TextBox(form).bindValueToProperty("nombre")
		new Label(form).setText("Sexo")
		new TextBox(form).bindValueToProperty("sexo")
		new Label(form).setText("Señas Particulares: ")
		new Button(form) => [
			setBackground(Color::LIGHT_GRAY)
			caption = "Editar Señas Particulares"
					onClick [ | new EditarVillano(owner, modelObject).open ]
		]

		var Table<PistaSenia> tablaDeSenias = new Table<PistaSenia>(mainPanel, PistaSenia)
		tablaDeSenias.bindItemsToProperty("seniasPart")
		tablaDeSenias.width = 200
		
		new Column<PistaSenia>(tablaDeSenias) => [
			title = "Seña" 
			bindContentsToProperty("pista")
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
