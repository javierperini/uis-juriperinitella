package edicionPais

import mapamundi.MapamundiPage
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.model.CompoundPropertyModel
import org.apache.wicket.model.PropertyModel
import org.uqbar.commons.model.UserException
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XAttributeModifier
import org.uqbar.wicket.xtend.XButton
import org.uqbar.wicket.xtend.XListView

class EditarPais extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	@Property EdicionApp edicion
	@Property boolean esNuevo
	@Property MapamundiPage paginaAnterior
	
	new(MapamundiPage paginaAnterior, EdicionApp edicion) {
		this.edicion=edicion
		this.paginaAnterior=paginaAnterior
		this.esNuevo= this.edicion.esNuevo()
		this.addChild(new Label("titulo", if (esNuevo) "Nuevo Pais" else "Editar Pais"))
		val Form<EdicionApp> edicionForm = new Form<EdicionApp>("edicionApp", new CompoundPropertyModel<EdicionApp>(this.edicion)) 
		this.agregarCamposEdicion(edicionForm)
		this.agregarAcciones(edicionForm)
		this.addChild(edicionForm);
	}
	
	def void agregarAcciones(Form<EdicionApp> parent) {
		
		val exceptionsLabel = new Label("exceptions")
		exceptionsLabel.add(new XAttributeModifier("class", [String saldo | if (edicion.exceptions.equals("")) "sinExcepcion "else "alert alert-danger posicionarLabel" ]))
		parent.addChild(exceptionsLabel)
		parent.addChild(new XButton("aceptar") => [
			onClick = [|
				try{
					edicion.setExceptions("")
					edicion.agregarNombre()
					if (esNuevo) {
						edicion.validarMapamundiAgregar(); 
						edicion.creaPais()
					} else {
						edicion.validarNombreVacio
						edicion.borra()
						edicion.creaPais()
					}
					volver()
					}catch (UserException ex){
						edicion.setExceptions(ex.message)
					}
				]				
		])
		parent.addChild(new XButton("cancelar") => [
			onClick = [|
				try{ if (!esNuevo) {
					edicion.setExceptions("")
					edicion.validarNombreVacio
					}
					volver
					}catch (UserException ex){
						edicion.setExceptions(ex.message)
					}]
		])
	}
	
	def volver() {
		responsePage = paginaAnterior
	}
	def agregarCamposEdicion(Form<EdicionApp> parent) {
		parent.addChild(new TextField<String>("nombre"))
		controlesCaracteristica(parent)
		controlesDeConexion(parent)
		controlesDeLugares(parent)
	}
		
	def controlesDeLugares(Form<EdicionApp> parent) {
		val listLugares = new XListView("lugares")
				listLugares.populateItem = [ item |
					item.model = item.modelObject.asCompoundModel
					item.addChild(new Label("nombre"))   
					item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarLugar(item.modelObject) ])
			]	
			
			parent.addChild(new DropDownChoice<EdicionApp>("lugarSeleccionado") => [
			choices = new PropertyModel(edicion.sistema,"lugaresSistema")
			choiceRenderer = choiceRenderer([m| m ])
			])
			parent.addChild(new XButton("agregarLugar").onClick = [|  
				try{
					edicion.validarLugares()
					edicion.agregarLugar()
				} catch (UserException ex){
					edicion.setExceptions(ex.message)
				}
			])
			parent.addChild(listLugares)
		}
		
	def controlesDeConexion(Form<EdicionApp> parent) {
			val listConexiones = new XListView("conexiones")
				listConexiones.populateItem = [ item |
					item.model = item.modelObject.asCompoundModel
					item.addChild(new Label("nombre"))   
					item.addChild(new XButton("eliminar").onClick = [|edicion.eliminarConexion(item.modelObject) ])
			]	
			
			    	parent.addChild(new DropDownChoice<EdicionApp>("paisSeleccionado") => [
			choices = new PropertyModel(edicion.sistema,"paisesSistema")
			choiceRenderer = choiceRenderer([m| m ])
			]) 
			parent.addChild(new XButton("agregarConexion").onClick = [|  
				try{ 
					edicion.setExceptions("")
					edicion.validarConexiones()
					edicion.agregarConexion()
				}catch(UserException ex){
					edicion.setExceptions(ex.message)
					
				}
			])
			parent.addChild(listConexiones)
		}
		
	def controlesCaracteristica(Form<EdicionApp> on) {
			val listCaracteristicas = new XListView("caracteristicas")
			listCaracteristicas.populateItem = [ item |
					item.model = item.modelObject.asCompoundModel
					item.addChild(new Label("pista"))   
					item.addChild(new XButton("eliminar").onClick = [| edicion.eliminarCaracteristica(item.modelObject)])
			]
			on.addChild(new TextField<String>("nuevaCaracteristica"))
			on.addChild(new XButton("agregar").onClick = [|  
					try{
						edicion.setExceptions("")
						edicion.validarCaracteristicas()
						edicion.agregarCaracteristica()
					} catch (UserException ex){
						edicion.setExceptions(ex.message)
					}
			])
			on.addChild(listCaracteristicas)
	}
}