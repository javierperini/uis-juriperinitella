package expediente

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import pista.PistaHobbie
import pista.PistaSenia

class EdicionVillano extends Dialog<ExpedientesAppModel> {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))

		new Label(colPanel).setText("Nombre: ")
		new TextBox(colPanel).bindValueToProperty("villanoSeleccionado.nombre")
		new Label(colPanel).setText("Sexo: ")
		new TextBox(colPanel).bindValueToProperty("villanoSeleccionado.sexo")
		
		var Table<PistaSenia> tablaDeSenias = new Table<PistaSenia>(mainPanel, PistaSenia)
		tablaDeSenias.bindItemsToProperty("villanoSeleccionado.seniasParticulares")
		tablaDeSenias.bindValueToProperty("pistaSeniaSeleccionada")
		tablaDeSenias.width = 200
		new Column<PistaSenia>(tablaDeSenias) => [
			title = "Señas particulares" 
			bindContentsToProperty("pista")
		]
		
		new Button(mainPanel) => [
			//setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Señas Particulares"
					onClick [ | new EditarSeniasParticulares(owner, modelObject).open ]
		]
		
		var Table<PistaHobbie> tablaDeHobbies = new Table<PistaHobbie>(mainPanel, PistaHobbie)
		tablaDeHobbies.bindItemsToProperty("villanoSeleccionado.hobbies")
		tablaDeHobbies.bindValueToProperty("pistaHobbieSeleccionada")
		tablaDeHobbies.width = 200
		new Column<PistaHobbie>(tablaDeHobbies) => [
			title = "Hobbies" 
			bindContentsToProperty("pista")
		]
		new Button(mainPanel) => [
		//	setBackground(Color::LIGHT_GRAY)	
			caption = "Editar hobbies"
					onClick [ | new EditarHobbies(owner, modelObject).open ]
		]

		botonAceptar(mainPanel)
	}
	
	def botonAceptar(Panel mainPanel) {}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}