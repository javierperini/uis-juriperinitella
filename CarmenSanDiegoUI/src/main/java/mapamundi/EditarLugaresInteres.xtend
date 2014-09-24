package mapamundi

import java.awt.Color
import lugares.Banco
import lugares.Biblioteca
import lugares.Club
import lugares.Embajada
import lugares.Lugar
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EditarLugaresInteres  extends SimpleWindow<MapamundiAppModel> {
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Lugares")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		new Label(p) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			setText("Lugares de Interes")
		]
		new List(p) => [
			height = 60
			bindItemsToProperty("paisSeleccionado.lugares").adapter = new PropertyAdapter(Lugar, "nombre")
			bindValueToProperty("lugarAEliminar")	
		]
		
		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Eliminar"
					onClick [ | modelObject.quitarLugar()]
		]
		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Selector(col2) => [
			setWidth(100)
			bindItemsToProperty("lugares")
			bindValueToProperty("nombreLugarParaAgregar")
		]
		new Button(col2) => [
			setWidth(100)
			setBackground(Color::LIGHT_GRAY)
			caption = "Agregar"
			bindEnabledToProperty("puedeAgregarLugar")
			bindEnabledToProperty("puedeEliminarLugar")
			// HORRIBLE, ARREGLAR
			onClick [ | if(modelObject.nombreLugarParaAgregar == "Club") {
							modelObject.setLugarParaAgregar (new Club("Club", null, null))
						}
						if(modelObject.nombreLugarParaAgregar == "Biblioteca") {
							modelObject.setLugarParaAgregar(new Biblioteca("Biblioteca", null, null))
						}
						if(modelObject.nombreLugarParaAgregar == "Banco") {
							modelObject.setLugarParaAgregar(new Banco("Banco", null, null))
						}
						if(modelObject.nombreLugarParaAgregar == "Embajada") {
							modelObject.setLugarParaAgregar(new Embajada("Embajada", null, null))
						}
						if(!modelObject.containsLugar(modelObject.lugarParaAgregar)) {
							modelObject.agregarLugar()
						} else {
							//tirar error por pais repetido											
						}
					]
		]
		var ver = new Panel(mainPanel)
		new Button(ver) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			caption = "Aceptar"
					onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) { }
	
	override protected createFormPanel(Panel arg0) { }


	
}