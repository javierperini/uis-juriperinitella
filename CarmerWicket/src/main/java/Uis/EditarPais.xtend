package Uis

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import detective.Pais
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.DropDownChoice
import org.uqbar.wicket.xtend.XListView
import org.uqbar.wicket.xtend.XButton

class EditarPais extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property CarmenApp carmen
	@Property boolean esNuevo
	@Property Pais paisEditar
	@Property MapamundiPage paginaAnterior
	
	new(Pais paisEditar,MapamundiPage paginaAnterior, CarmenApp carmen) {
		this.carmen=carmen
		this.paisEditar=paisEditar
		this.paginaAnterior=paginaAnterior
		this.esNuevo= this.carmen.esNuevo(paisEditar)
		this.addChild(new Label("titulo", if (esNuevo) "Nuevo Pais" else "Editar Pais"))
		val Form<Pais> edicionForm = new Form<Pais>("edicionApp", paisEditar.asCompoundModel) 
		this.agregarCamposEdicion(edicionForm)
		this.agregarAcciones(edicionForm)
		this.addChild(edicionForm);
	}
	
		def void agregarAcciones(Form<Pais> parent) {
		parent.addChild(new XButton("aceptar") => [
			onClick = [|
		
					if (esNuevo) {
						carmen.creaPais(paisEditar)
					} else {
						carmen.borra(paisEditar)
						carmen.creaPais(paisEditar)
					}
					volver()
			
				]				
		])
		parent.addChild(new XButton("cancelar") => [
			onClick = [| volver ]
		])
	}
	
	def volver() {
		responsePage = paginaAnterior
	}
	def agregarCamposEdicion(Form<Pais> parent) {
		parent.addChild(new TextField<String>("nombre"))
//			val listView = new XListView("caracteristicas")
//			listView.populateItem = [ item |
//				item.model = item.modelObject.asCompoundModel
//				item.addChild(new Label(item.modelObject))
//				item.addChild(new XButton("eliminar").onClick = [| carmen.caracteristicaSeleccionada = item.modelObject
//																   carmen.eliminarCaracteristica(paisEditar)])
//			]
//			parent.addChild(new TextField<String>("nuevaCaracteristica"))
//			
//			val listView2 = new XListView("conexiones")
//			listView2.populateItem = [ item |
//				item.model = item.modelObject.asCompoundModel
//				item.addChild(new Label(item.modelObject))
//				item.addChild(new XButton("eliminar").onClick = [|])
//			]
//			
//			parent.addChild(listView2)
//			parent.addChild(listView)
		}


//		parent.addChild(new DropDownChoice<Pais>("caracteristicas") => [
//			choices = loadableModel([| Pais.home.allInstances ])
//			choiceRenderer = choiceRenderer([Pais m| m])
//		]) 
//		parent.addChild(new CheckBox("recibeResumenCuenta"))
//		parent.addChild(new FeedbackPanel("feedbackPanel"))
//	}
		
		
		
}