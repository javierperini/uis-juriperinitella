package Uis

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import detective.Pais
import org.uqbar.commons.model.UserException
import org.apache.wicket.markup.html.form.CheckBox

class MapamundiPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property CarmenApp carmen

	public new(CarmenApp c) {

		this.carmen = c
		val Form<CarmenApp> paisesForm = new Form<CarmenApp>("mapaMundiApp", new CompoundPropertyModel<CarmenApp>(this.carmen))		
		this.agregarBotonesFrontales(paisesForm)
		this.agregarPaisesSistema(paisesForm)
		this.agregarBotonNuevo(paisesForm)
		this.addChild(paisesForm);
 

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
//			val checkResumen = new CheckBox("tengoConexiones")
//			checkResumen.setEnabled(false)
//			item.addChild(checkResumen)
			item.addChild(new XButton("editar").onClick = [|editar(item.modelObject)])
			item.addChild(new XButton("eliminar").onClick = [| 
		 //Agregar un checkbox para los paises con o sin conexiones		
				try{ 
					carmen.validarMapamundiEliminar(item.modelObject);
					
					carmen.borra(item.modelObject)
					} catch (UserException ex){
						carmen.setExceptions(ex.message)
					}
					])
		]
		form.addChild(listView)
		form.addChild(new Label("exceptions"))
		
	}
	
	

   def agregarBotonesFrontales(Form<CarmenApp> parent){

		parent.addChild(new XButton("expediente")
			.onClick = [| open(this.carmen)]
		)
	}
	
	def open(CarmenApp carmen){
		responsePage = new Expediente(carmen)
	}
	
	def editar(Pais p) {
		responsePage = new EditarPais(this,new EdicionApp(carmen,p))
	}
	
	
   	
   }

