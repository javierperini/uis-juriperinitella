package main.java.ui

import main.java.detective.Sistema
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.Application
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import main.java.personajes.Villano

class MenuDeAcciones extends SimpleWindow<Sistema>{
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, sistema)
		title = "Que onda Carmen?"
		taskDescription = "¿Dónde está Carmen Sandiego?"
	}
	
	 override createContents(Panel mainPanel) {
		this.setTitle("¿Dónde está Carmen Sandiego?")
		mainPanel.setLayout(new VerticalLayout)
		
		new Panel(mainPanel) => [
			layout = new HorizontalLayout()
			new Label(mainPanel).setText("¿Qué hacemos ahora, detective?") 
		] 
		
		
		new Panel(mainPanel) => [
				new Button(mainPanel) => [
				caption = "Resolver Misterio"
				onClick [ | new MapamundiWindow(owner, modelObject).open ]//Este no va, no tiene que abrir al mapamundi.
			]
			new Button(mainPanel) => [
				caption = "Mapamundi"
				onClick [ | new MapamundiWindow(owner, modelObject).open ]
			]
			
			new Button(mainPanel) => [
				caption = "Expedientes"
				onClick [ | new ExpedientesWindow(owner, modelObject).open ] //Prueba en la creacion del villano.
			]
			
			// ----------------------- BOTONES DE PRUEBA --------------------------- 
			
			new Button(mainPanel) => [
				caption = "prueba nuevo villano"
				onClick [ | new NuevoVillano(owner, modelObject).open ]
			]
			
			new Button(mainPanel) => [
				caption = "prueba editar villano"
				onClick [ | new EditarVillano(owner, modelObject.villanoSeleccionado).open ]
			]
			
			new Button(mainPanel) => [
				caption = "prueba nuevo pais"
				onClick [ | new NuevoPais(owner, modelObject).open ]
			]
			
			new Button(mainPanel) => [
				caption = "prueba editar pais"
				onClick [ | new EditarPais(owner, modelObject.paisSeleccionado).open ]
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