package resolverMisterio

import org.uqbar.arena.windows.WindowOwner
import detective.Sistema
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout

class ResolverMisterioWindows extends SimpleWindow<Sistema> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner,sistema)
		title="Resolviendo :" +sistema.nombreCaso
	}
	
	override createContents(Panel mainPanel){
		//mainPanel.setLayout(new Column)
		
		
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}