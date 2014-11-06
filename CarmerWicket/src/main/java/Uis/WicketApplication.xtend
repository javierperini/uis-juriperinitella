package Uis

import org.apache.wicket.protocol.http.WebApplication
import personajes.Villano

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see Uis.Start#main(String[])
 */
class WicketApplication extends WebApplication {
	
	Villano v=new Villano();
	
	override getHomePage() {
//		return HomePage
	}
	
	override init() {
		super.init()
		// add your configuration here
		
	}
	
}