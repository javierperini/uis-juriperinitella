package resolverMisterio

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label

class OrdenDeArrestoWindows extends SimpleWindow<ResolverAppModel> {
	
	new(WindowOwner parent, ResolverAppModel model) {
		super(parent, model)
	}
	override createContents(Panel mainPanel){
		val colPanel = new Panel(mainPanel)
			colPanel.setLayout(new ColumnLayout(2))
		 new Label(colPanel).setText("Estás Visitando: ")
		
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}