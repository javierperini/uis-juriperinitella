package Uis

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import personajes.Villano

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
			
			item.addChild(new XButton("editar").onClick = [|edit(item.modelObject)])
			item.addChild(new XButton("eliminar").onClick = [|carmen.eliminarVillano(item.modelObject)	
			])
		]
		form.addChild(listView)
		
	}
	
	def agregarBotonesFrontales(Form<CarmenApp> parent){
   	   parent.addChild(new XButton("mapaMundi")
			.onClick =  [| openMapamundiPage()]
		)
//		parent.addChild(new XButton("expediente")
//			.onClick = [| ]
//		)
	}
	
	def openMapamundiPage(){
		responsePage = new MapamundiPage(carmen)
	}
	
	def edit(Villano v){
		responsePage = new EditarVillano(this, new EdicionVillanoApp(carmen.sistema, v))
	}
	
	def agregarBotonNuevo(Form<CarmenApp> form) {
		form.addChild(new XButton("nuevoVillano")
			.onClick = [| edit(new Villano())])
		form.addChild(new XButton("viejoVillano")
			.onClick = [| ]
		)
	}
}