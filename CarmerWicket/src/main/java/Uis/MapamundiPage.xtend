package Uis

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import detective.Pais

class MapamundiPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property CarmenApp carmen

	public new(CarmenApp c) {
//		this.carmen = if (c == null ) new CarmenApp() else c
		this.carmen = c
		val Form<CarmenApp> paisesForm = new Form<CarmenApp>("mapaMundiApp", new CompoundPropertyModel<CarmenApp>(this.carmen))		
		this.agregarBotonesFrontales(paisesForm)
		this.agregarPaisesSistema(paisesForm)
		this.agregarBotonNuevo(paisesForm)
		this.addChild(paisesForm);
 
		// TODO Add your page's components here
    }
    
    public new() {
//		this.carmen = if (c == null ) new CarmenApp() else c
		this.carmen = new CarmenApp
		val Form<CarmenApp> paisesForm = new Form<CarmenApp>("mapaMundiApp", new CompoundPropertyModel<CarmenApp>(this.carmen))		
		this.agregarBotonesFrontales(paisesForm)
		this.agregarPaisesSistema(paisesForm)
		this.agregarBotonNuevo(paisesForm)
		this.addChild(paisesForm);
 
		// TODO Add your page's components here
    }
    
	def agregarBotonNuevo(Form<CarmenApp> form) {
		 form.addChild(new XButton("nuevoPais")
			.onClick = [|editar(new Pais) ]
		)
	
	}
	
	def agregarPaisesSistema(Form<CarmenApp> form) {
		val listView = new XListView("paisesSistema")
		listView.populateItem = [ item |
			item.model = item.modelObject.asCompoundModel
			item.addChild(new Label("nombre"))
			item.addChild(new XButton("editar").onClick = [|editar(item.modelObject)])
			item.addChild(new XButton("eliminar").onClick = [| carmen.paisSeleccionado = item.modelObject
															   carmen.eliminarPaisSeleccionado()])
		]
		form.addChild(listView)
	}
	
	

   def agregarBotonesFrontales(Form<CarmenApp> parent){
   	   //AGREGARLE COMPORTAMIENTO A LOS BOTONES
//   	   parent.addChild(new XButton("mapaMundi")
//			.onClick =  [| ]
//		)
		parent.addChild(new XButton("expediente")
			.onClick = [| open(this.carmen)]
		)
	}
	
	def open(CarmenApp carmen){
		responsePage = new Expediente(carmen)
	}
	
	def editar(Pais p) {
		responsePage = new EditarPais(p,this,carmen) 
	}
	
	
   	
   }

