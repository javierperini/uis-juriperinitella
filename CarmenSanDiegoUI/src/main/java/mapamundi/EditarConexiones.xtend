package mapamundi

import detective.Pais
import detective.Sistema
import java.awt.Color
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

class EditarConexiones extends SimpleWindow<MapamundiAppModel> {
	// borre el new anterior, es igual a los otros
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Conexiones")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		new Label(p) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			setText("Conexiones")
		]
		new List(p) => [
			height = 60
			bindItemsToProperty("paisSeleccionado.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
			bindValueToProperty("conexionAEliminar")

			var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
			new Button(col) => [
				setBackground(Color::LIGHT_GRAY)	// al pedo
				caption = "Eliminar"
						onClick [ | modelObject.quitarConexion()]
			]
			var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
			new Selector(col2) => [
				setWidth(100)
				bindItemsToProperty("sistema.paisesSistema").adapter = new PropertyAdapter(Pais, "nombre")
				bindValueToProperty("conexionParaAgregar")
			]
			new Button(col2) => [
				setWidth(100)
				setBackground(Color::LIGHT_GRAY)
				caption = "Agregar"
						onClick [ | if(modelObject.paisSeleccionado != modelObject.conexionParaAgregar){
										if(!modelObject.paisSeleccionado.conexiones.contains(modelObject.conexionParaAgregar)) {
											modelObject.agregarConexion()
											} else {
												//tirar error por pais repetido											
											}
									} else {
										//tirar error por ser el mismo pais
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
		]
	}
	
	override protected addActions(Panel arg0) { }
	override protected createFormPanel(Panel arg0) { }
}