package Uis

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.apache.wicket.model.PropertyModel
import org.uqbar.commons.model.UserException
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView

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
		this.addChild(villanosForm);
	}
	
	def agregarBotonesFrontales(Form<EdicionVillanoApp> it) {
		addChild(new Label("exceptions"))
		addChild(new XButton("Aceptar")
			.onClick = [| 
				try{
				edicion.setExceptions("")
				edicion.agregarNombre()
				if (esNuevo){
					edicion.validarVillanoiAgregar();
					edicion.crearVillano()
				}
				else{
					edicion.eliminarVillano()
					edicion.crearVillano()
				}	
				volver()
				}catch (UserException ex){
						edicion.setExceptions(ex.message)
						
				}]
		)
		addChild(new XButton("Cancelar") => [
			onClick = [| volver ]
		])
	}
	
	def volver() {
		responsePage = paginaAnterior
	}
	
	def sexoPanel(Form<EdicionVillanoApp> it){
		addChild(new Label("sexo"))
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
		parent.addChild(new XButton("agregar2").onClick = [|  
			try{ 
				edicion.setExceptions("")
				edicion.validarSeniasParticulares
				edicion.agregarPistaSenia()
			}catch (UserException ex){
					edicion.setExceptions(ex.message)
			}
		])
				
		val listHobbies = new XListView("hobbies")
		listHobbies.populateItem = [ item |
				item.model = item.modelObject.asCompoundModel
				item.addChild(new Label("pista"))   
				item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarHobbie(item.modelObject)])
		]
		parent.addChild(new TextField<String>("nuevoHobbie"))
		parent.addChild(new XButton("agregar").onClick = [|  
			try{ 
				edicion.setExceptions("")
				edicion.validarHobbies
				edicion.agregarHobbie()
			}catch (UserException ex){
					edicion.setExceptions(ex.message)
			}
		])
	
		parent.addChild(listHobbies)
		parent.addChild(listSenias)
		}


	
}