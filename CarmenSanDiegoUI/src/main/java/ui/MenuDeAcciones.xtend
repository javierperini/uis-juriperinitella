package ui

import detective.Sistema
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import mapamundi.MapamundiWindow
import expediente.ExpedientesWindow

class MenuDeAcciones extends SimpleWindow<Sistema>{
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
		title = "¿Dónde está Carmen Sandiego?"
	}
	
	 override createContents(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		
		new Panel(mainPanel) => [
			layout = new HorizontalLayout()
			new Label(mainPanel).setText("¿Qué hacemos ahora, detective?") 
		] 
		
		
		new Panel(mainPanel) => [
				new Button(mainPanel) => [
				caption = "Resolver Misterio"
				onClick [ | /**/ ]
			]
			new Button(mainPanel) => [
				caption = "Mapamundi"
				onClick [ | new MapamundiWindow(owner, modelObject).open ]
			]
			
			new Button(mainPanel) => [
				caption = "Expedientes"
				onClick [ | new ExpedientesWindow(owner, modelObject).open ] //Prueba en la creacion del villano.
			]
		]
	}
	
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
		
}