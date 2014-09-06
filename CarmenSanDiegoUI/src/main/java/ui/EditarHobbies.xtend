package main.java.ui

import org.uqbar.arena.windows.WindowOwner
import main.java.personajes.Villano
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import main.java.pista.PistaHobbie
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List

class EditarHobbies extends SimpleWindow<Villano>{
	
	new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	override createContents(Panel mainPanel) {
			this.setTitle("Editar Señas")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)

////		var Table<PistaHobbie> tablaDeSenias = new Table<PistaHobbie>(mainPanel, PistaHobbie)
////		tablaDeSenias.bindItemsToProperty("seniasPart")
////		tablaDeSenias.bindValueToProperty("seniaPartAEliminar")
////		tablaDeSenias.width = 200
////		new Column<PistaHobbie>(tablaDeSenias) => [
////			title = "Señas particulares" 
////			bindContentsToProperty("pista")
////			
////		]
//
//		new Label(p) => [
//			setWidth(220)
//			setBackground(Color::LIGHT_GRAY)
//			setText("Caracteristicas")
//		]
//		
//		new List(p) => [
//			bindItemsToProperty("seniasPart")
//			bindValueToProperty("seniaPartAEliminar")	
//		]
//		
//		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
//		new Button(col) => [
//			setBackground(Color::LIGHT_GRAY)	// al pedo
//			caption = "Eliminar"
//					onClick [ | modelObject.quitarSeniaPart()]
//		]
//		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
//		new TextBox(col2) => [
//			setWidth(100)
//			bindValueToProperty("seniasPartParaAgregar")
//		]
//		new Button(col2) => [
//			setWidth(100)
//			setBackground(Color::LIGHT_GRAY)
//			caption = "Agregar"
//					onClick [ | modelObject.agregarSeniasPart()]
//		]
//		var ver = new Panel(mainPanel)
//		new Button(ver) => [
//			setWidth(220)
//			setBackground(Color::LIGHT_GRAY)
//			caption = "Aceptar"
//					onClick [ | close ]
//		]
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}