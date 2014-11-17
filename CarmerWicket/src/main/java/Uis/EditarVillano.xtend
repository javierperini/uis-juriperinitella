package Uis

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import personajes.Villano
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.model.PropertyModel

class EditarVillano extends WebPage{
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property EdicionVillanoApp edicion
	@Property Boolean esNuevo
	@Property Expediente paginaAnterior
	
	new(Expediente page, EdicionVillanoApp edicion) {
		this.edicion = edicion
		this.paginaAnterior = page
		this.esNuevo = edicion.esNuevo()
		this.addChild(new Label("titulo", if (esNuevo) "Nuevo Villano" else "Editar Villano"))
		val Form<EdicionVillanoApp> villanosForm = new Form<EdicionVillanoApp>("edicionVillanoApp", new CompoundPropertyModel<EdicionVillanoApp>(this.edicion)) 
		this.agregarBotonesFrontales(villanosForm)
		this.agregarCamposEdicion(villanosForm)
		this.sexoPanel(villanosForm)
//		this.agregarVillanosSistema(villanosForm)
//		this.agregarBotonNuevo(villanosForm)
		this.addChild(villanosForm);
	}
	
	def agregarBotonesFrontales(Form<EdicionVillanoApp> it) {
		addChild(new XButton("Aceptar")
			.onClick = [| 
				if (esNuevo){
					edicion.crearVillano()
				}
				else{
					edicion.eliminarVillano()
					edicion.crearVillano()
				}
				volver
			]
		)
		addChild(new XButton("Cancelar") => [
			onClick = [| volver ]
		])
	}
	
	def volver() {
		responsePage = paginaAnterior
	}
	
	def sexoPanel(Form<EdicionVillanoApp> it){
		addChild(new Label("sex", this.edicion.villano.sexo))
		addChild(new DropDownChoice<EdicionVillanoApp>("sexoSeleccionado") => [
			choices = new PropertyModel(edicion, "sexos")
			choiceRenderer = choiceRenderer([m| m ])
		])
		addChild(new XButton("agregarSexo").onClick = [|  edicion.agregarSexo()])
	}
	
	def agregarCamposEdicion(Form<EdicionVillanoApp> parent) {
		parent.addChild(new TextField<String>("nombre"))
		
		val listSenias = new XListView("seniasParticulares")
		listSenias.populateItem = [ item |
				item.model = item.modelObject.asCompoundModel
				item.addChild(new Label("pista"))   
				item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarPistaSenia(item.modelObject)])
		]
		parent.addChild(new TextField<String>("nuevaPistaSenia"))
		parent.addChild(new XButton("agregar2").onClick = [|  edicion.agregarPistaSenia()])
				
		val listHobbies = new XListView("hobbies")
		listHobbies.populateItem = [ item |
				item.model = item.modelObject.asCompoundModel
				item.addChild(new Label("pista"))   
				item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarHobbie(item.modelObject)])
		]
		parent.addChild(new TextField<String>("nuevoHobbie"))
		parent.addChild(new XButton("agregar").onClick = [|  edicion.agregarHobbie()])
//			// FIJAR LO DE LA VARIABLE
//			
//		val listConexiones = new XListView("conexiones")
//			listConexiones.populateItem = [ item |
//				item.model = item.modelObject.asCompoundModel
//				item.addChild(new Label("nombre"))   
//				item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarConexion(item.modelObject) ])
//		]	
//
//    	parent.addChild(new DropDownChoice<EdicionApp>("paisSeleccionado") => [
//		choices = new PropertyModel(edicion.sistema,"paisesSistema")
//		choiceRenderer = choiceRenderer([m| m ])
//		]) 
//		// SACAR DE LAS CONEXIONES EL PAIS EDICION
//		parent.addChild(new XButton("agregarConexion").onClick = [|  edicion.agregarConexion()])
//		
//		val listLugares = new XListView("lugares")
//			listLugares.populateItem = [ item |
//				item.model = item.modelObject.asCompoundModel
//				item.addChild(new Label("nombre"))   
//				item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarLugar(item.modelObject) ])
//		]	
//		
//		parent.addChild(new DropDownChoice<EdicionApp>("lugarSeleccionado") => [
//		choices = new PropertyModel(edicion.sistema,"lugaresSistema")
//		choiceRenderer = choiceRenderer([m| m ])
//		])
//		parent.addChild(new XButton("agregarLugar").onClick = [|  edicion.agregarLugar()])
//		
		parent.addChild(listHobbies)
		parent.addChild(listSenias)
		}


	
//		parent.addChild(new CheckBox("recibeResumenCuenta"))
//		parent.addChild(new FeedbackPanel("feedbackPanel"))
//	}
	
}