package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

class FinDelJuego extends SimpleWindow<ResolverAppModel>{
	
	String text
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle(modelObject.sistema.caso.nombreCaso + " - Resuelto")
		texto(mainPanel)
		button(mainPanel)
		
	}
	
	def button(Panel panel) {}
	
	def texto(Panel panel) {}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}