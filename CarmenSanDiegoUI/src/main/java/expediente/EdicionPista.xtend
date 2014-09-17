package expediente

import org.uqbar.arena.bindings.Transformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import pista.Pista

class EdicionPista extends Dialog<ExpedientesAppModel> {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
	}
	def String listaABindear() {""}
	def String pistaSeleccionada() {""}
	def String tituloColumna() {""}
	def void quitarPista() {}
	def void agregarPista() {}
	def String pistaAAgregar() {""}
	def Transformer crearTransformer() {}
	
		override createContents(Panel mainPanel) {		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)

		var Table<Pista> tablaDePistas = new Table<Pista>(mainPanel, Pista)
		tablaDePistas.bindItemsToProperty(listaABindear())
		tablaDePistas.bindValueToProperty(pistaSeleccionada())
		tablaDePistas.width = 200
		tablaDePistas.height = 50
		new Column<Pista>(tablaDePistas) => [
			title = tituloColumna() 
			bindContentsToProperty("pista")
		]

		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
		//	setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | quitarPista()]
		]
		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new TextBox(col2) => [
			setWidth(100)
			val pistaNueva = bindValueToProperty(pistaAAgregar())
			pistaNueva.transformer =  crearTransformer()	
		]
		new Button(col2) => [
			setWidth(100)
			//setBackground(Color::LIGHT_GRAY)
			caption = "Agregar"
					onClick [ | agregarPista()] 
		]
		var ver = new Panel(mainPanel)
		new Button(ver) => [
			setWidth(220)
			//setBackground(Color::LIGHT_GRAY)
			caption = "Aceptar"
					onClick [ | close ]
		]
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}