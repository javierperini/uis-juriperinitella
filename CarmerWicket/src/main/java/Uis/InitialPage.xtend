package Uis

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.model.CompoundPropertyModel
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XButton

class InitialPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	@Property CarmenApp carmen
	
 	public new() {
		this.carmen = new CarmenApp
		val Form<CarmenApp> paisesForm = new Form<CarmenApp>("initialPage", new CompoundPropertyModel<CarmenApp>(this.carmen))		
		this.agregarBotonesFrontales(paisesForm)
		this.addChild(paisesForm);
 
	
    }
    
    def agregarBotonesFrontales(Form<CarmenApp> parent){
   	   parent.addChild(new XButton("mapaMundi")
			.onClick =  [| open(new MapamundiPage(this.carmen))]
		)
		parent.addChild(new XButton("expediente")
			.onClick = [| open(new Expediente(this.carmen))]
		)
	}
	
	def open(WebPage page){
		responsePage = page
	}
	
	
   	
   }

