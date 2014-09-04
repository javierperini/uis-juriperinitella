package main.java.ui

import main.java.detective.Sistema
import org.uqbar.arena.Application

class CarmenApplication extends Application{
	
	override createMainWindow() {
		new MenuDeAcciones(this, new Sistema)
	}
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
}