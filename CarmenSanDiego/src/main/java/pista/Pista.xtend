package pista

import org.uqbar.commons.utils.Observable

@Observable
class Pista {
	@Property String pista

	new(String pista) {
		this.pista = pista
	}

}
