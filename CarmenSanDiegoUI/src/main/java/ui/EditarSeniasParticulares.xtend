package main.java.ui

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel
import main.java.detective.Pais
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.ObservableProperty
import main.java.personajes.Villano
import java.awt.Color
import main.java.pista.PistaSenia

class EditarSeniasParticulares extends SimpleWindow<Villano> {
	
	new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		
	} 
	override createContents(Panel mainPanel) {
			this.setTitle("Editar Señas")
		// no funca ningun boton
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)

		var Table<PistaSenia> tablaDeSenias = new Table<PistaSenia>(mainPanel, PistaSenia)
		tablaDeSenias.bindItemsToProperty("seniasPart")
		tablaDeSenias.bindValueToProperty("seniaPartAEliminar")
		tablaDeSenias.width = 200
		new Column<PistaSenia>(tablaDeSenias) => [
			title = "Señas particulares" 
			bindContentsToProperty("pista")
		]

		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | modelObject.quitarSeniaPart]
		]
		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new TextBox(col2) => [
			setWidth(100)
			bindValueToProperty("seniaParaAgregar")
		]
		new Button(col2) => [
			setWidth(100)
			setBackground(Color::LIGHT_GRAY)
			caption = "Agregar"
					onClick [ | modelObject.agregarSeniasPart()] // NO FUNCA PORQUE HAY que usar un adapter
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
	
	
