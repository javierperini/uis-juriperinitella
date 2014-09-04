package main.java.ui

import main.java.detective.Sistema
import main.java.personajes.Villano
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

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
		new Column<Villano>(villanos) => [
			title = "Villano" 
			bindContentsToProperty("nombre")
		]
		
		 
//		new Label(form).setText("Nombre: ")
//		new TextBox(form).bindValueToProperty("nombre")
//		new Label(form).setText("Sexo")
//		new TextBox(form).bindValueToProperty("sexo")
//		new Label(form).setText("Señas Particulares: ")
//		new Button(form) => [
//			setBackground(Color::LIGHT_GRAY)
//			caption = "Editar Señas Particulares"
//					onClick [ | new EditarVillano(owner, modelObject).open ]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}