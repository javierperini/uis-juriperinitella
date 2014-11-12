package Uis

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel

class Expediente extends WebPage{
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property CarmenApp carmen
	
	new(CarmenApp carmen) {
		this.carmen = carmen
		val Form<CarmenApp> villanosForm = new Form<CarmenApp>("expedienteApp", new CompoundPropertyModel<CarmenApp>(this.carmen)) 
		this.agregarBotonesFrontales(villanosForm)
		this.addChild(new Label("titulo", "Carmen Edicion"))
		this.agregarVillanosSistema(villanosForm)
		this.agregarBotonNuevo(villanosForm)
		this.addChild(villanosForm);
	}
	
	def agregarVillanosSistema(Form<CarmenApp> form) {
		val listView = new XListView("villanosSistema")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			
			item.addChild(new XButton("editar").onClick = [|])
			item.addChild(new XButton("eliminar").onClick = [|carmen.villanoSeleccionado = item.modelObject
															  carmen.eliminarVillanoSeleccionado()	
			])
		]
		form.addChild(listView)
		
	}
	
	def agregarBotonesFrontales(Form<CarmenApp> parent){
   	   parent.addChild(new XButton("mapaMundi")
			.onClick =  [| open()]
		)
//		parent.addChild(new XButton("expediente")
//			.onClick = [| ]
//		)
	}
	
	def open(){
		responsePage = new MapamundiPage(carmen)
	}
	
	def agregarBotonNuevo(Form<CarmenApp> form) {
		 form.addChild(new XButton("nuevoVillano")
			.onClick = [| ]
		)
	}
}