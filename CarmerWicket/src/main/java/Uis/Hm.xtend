package Uis

import org.apache.wicket.markup.html.WebPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods


class Hm extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	public new() {
		responsePage = new HomePage(new CarmenApp())
    }
   
}