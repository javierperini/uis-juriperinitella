package main.java.ui

import main.java.detective.Sistema
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow

class MenuDeAcciones extends MainWindow<Sistema>{
	
	new() {
		super(new Sistema)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("¿Dónde está Carmen Sandiego?")
		mainPanel.setLayout(new HorizontalLayout)
		
		new Label(mainPanel).setText("¿Qué hacemos ahora, detective?")
		
		new Button(mainPanel) => [
			caption = "Resolver Misterio"
			onClick [ | new Jugar().startApplication ]
		]
		
		new Button(mainPanel) => [
			caption = "Mapamundi"
			onClick [ | new MapamundiWindow().startApplication ]
		]
		
		new Button(mainPanel) => [
			caption = "Expedientes"
			onClick [ | new ExpedientesWindow().startApplication ]
		]
		
	}

		def static main(String[] args) {

		new MenuDeAcciones().startApplication
	}	
}