package main.java.ui

import java.awt.Color
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

class EditarCaracteristicas extends SimpleWindow<Pais> {
	
	new(WindowOwner owner, Pais pais) {
		super(owner, pais)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Caracteristicas")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		new Label(p) => [
			setWidth(200)
			setBackground(Color::LIGHT_GRAY)
			setText("Caracteristicas")
		]
		new List(p) => [
			bindItemsToProperty("caracteristicas")
			bindValueToProperty("caracteristicaAEliminar")	
		]
		
		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | modelObject.quitarCaracteristica()]
		]

	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}