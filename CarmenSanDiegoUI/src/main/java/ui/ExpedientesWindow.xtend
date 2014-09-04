package main.java.ui

import main.java.detective.Sistema
import main.java.personajes.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import main.java.pista.PistaSenia
import main.java.pista.PistaHobbie
import org.uqbar.arena.widgets.Button

class ExpedientesWindow extends SimpleWindow<Sistema> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
		title = "Expedientes"
	}
	
	override createContents(Panel mainPanel) {
//		this.setTitle("Expedientes - Nuevo Villano")
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))
		
		var Table<Villano> villanos = new Table<Villano>(colPanel, Villano)
		villanos.bindItemsToProperty("villanosSistema")
		villanos.bindValueToProperty("villanoSeleccionado")
		new Column<Villano>(villanos) => [
			title = "Villano" 
			bindContentsToProperty("nombre")
		]
		
		new Panel(colPanel) => [
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Nombre: ")
				new Label(it).setWidth(60).bindValueToProperty("villanoSeleccionado.nombre")
			]
			
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Sexo: ")
				new Label(it).setWidth(100).bindValueToProperty("villanoSeleccionado.sexo")
			]
			
			var Table<PistaSenia> seniasVillano = new Table<PistaSenia>(it, PistaSenia)
			seniasVillano.bindItemsToProperty("villanoSeleccionado.seniasPart")
			seniasVillano.bindValueToProperty("seniasVillanoSeleccionado")
			new Column<PistaSenia>(seniasVillano) => [
				title = "Señas" 
				bindContentsToProperty("pista")
			]
			
			var Table<PistaHobbie> hobbiesVillano = new Table<PistaHobbie>(it, PistaHobbie)
			hobbiesVillano.bindItemsToProperty("villanoSeleccionado.hobbies")
			hobbiesVillano.bindValueToProperty("hobbiesVillanoSeleccionado")
			new Column<PistaHobbie>(hobbiesVillano) => [
				title = "Hobbies" 
				bindContentsToProperty("pista")
			]	
		]
		
		new Button(colPanel) => [
				caption = "Nuevo"
				onClick [ | new NuevoVillano(owner, modelObject).open ]
		]
		new Button(colPanel) => [
				caption = "Editar"
				onClick [ | new EditarVillano(owner, modelObject.villanoSeleccionado).open ]
		]
		new Button(colPanel) => [
				caption = "Aceptar"
				onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}