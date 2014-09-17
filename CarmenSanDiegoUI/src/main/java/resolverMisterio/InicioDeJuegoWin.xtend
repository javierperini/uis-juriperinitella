package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import detective.Sistema
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

class InicioDeJuegoWin extends SimpleWindow<Sistema> {
	
	new(WindowOwner parent, Sistema sistema) {
		super(parent, sistema)
		
		}

	override createContents(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		title= modelObject.nombreCaso
		
		new Panel(mainPanel) => [
			layout = new VerticalLayout	 ]
		 modelObject.caso
		 new Label(mainPanel).setText("Detective, tenemos un caso para usted!!! ")
		 new Panel (mainPanel) => [
			layout = new HorizontalLayout()
			width= 100
			new Label(it).bindValueToProperty("caso.descripcion")
			 ]
		 new Button(mainPanel)=>[
		 	caption= "Aceptar  el Caso"
		 	onClick =[| new ResolverMisterioWindows(owner,modelObject).open]
		 ] 
		
	}
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}