package main.java.ui

import java.awt.Color
import main.java.personajes.Villano
import main.java.pista.PistaHobbie
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EditarHobbies extends SimpleWindow<Villano>{
	
	new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		
	} 
	override createContents(Panel mainPanel) {
			this.setTitle("Editar Hobbies")
		// no funca ningun boton
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)

		var Table<PistaHobbie> tablaDeSenias = new Table<PistaHobbie>(mainPanel, PistaHobbie)
		tablaDeSenias.bindItemsToProperty("hobbies")
		tablaDeSenias.bindValueToProperty("hobbieAEliminar")
		tablaDeSenias.width = 200
		new Column<PistaHobbie>(tablaDeSenias) => [
			title = "Señas Hobbies" 
			bindContentsToProperty("pista")
		]

		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | modelObject.quitarHobbies()]
		]
		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new TextBox(col2) => [
			setWidth(100)
			val bindingMonto = bindValueToProperty("hobbieParaAgregar")
			bindingMonto.transformer =  new PistaHobbieTrasnformer
			
		]
		new Button(col2) => [
			setWidth(100)
			setBackground(Color::LIGHT_GRAY)
			caption = "Agregar"
					onClick [ | modelObject.agregarHobbies()] // NO FUNCA PORQUE HAY que usar un adapter
		]
		var ver = new Panel(mainPanel)
		new Button(ver) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			caption = "Aceptar"
					onClick [ | close ]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
		
	}