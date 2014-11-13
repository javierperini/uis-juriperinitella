package Uis

import org.apache.wicket.protocol.http.WebApplication
import org.uqbar.commons.utils.ApplicationContext
import detective.SetUpCarmen

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see Uis.Start#main(String[])
 */
class WicketApplication extends WebApplication {
	

	override getHomePage() {
		 InitialPage
	}
	
	override init() {
		super.init()
		ApplicationContext.instance.configureSingleton(SetUpCarmen, new SetUpCarmen)
		// add your configuration here
		
	}
	
	def static getApp() {
		get as WicketApplication
	}
	
}