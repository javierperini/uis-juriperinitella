package mapamundi

import java.awt.Color
import detective.Pais
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import expediente.EditarCaracteristicas

class EditarPais extends SimpleWindow<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
		
	override createContents(Panel mainPanel) {
		this.setTitle("Mapamundi - Editar País")

		new Label(mainPanel).setText("Nombre: ")
		new TextBox(mainPanel).bindValueToProperty("nombre")
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			text = "Características"
		]
		new List(mainPanel) => [
			// TITULO REEMPLAZADO CON LABEL 
			allowNull(false)
			bindItemsToProperty("caracteristicas")
		]

		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Características"
					onClick [ | new EditarCaracteristicas(owner, modelObject).open ]
		]
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			text = "Conexiones"
		]

		new List(mainPanel) => [
			bindItemsToProperty("conexiones")
		]

		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	// al pedo
			caption = "Editar Conexiones"
					onClick [ | new EditarConexiones(owner, modelObject).open ]
		]
		
		new Label(mainPanel) => [
			background = Color::MAGENTA
			text = "Lugares de interés"
		]

		new List(mainPanel) => [
			bindItemsToProperty("lugares")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Lugares"
					onClick [ | new EditarLugaresInteres(owner, modelObject).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ |  close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}
	
}