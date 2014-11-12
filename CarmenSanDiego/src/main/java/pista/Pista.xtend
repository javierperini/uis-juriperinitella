package pista


import org.uqbar.commons.utils.Observable

@Observable
class Pista {
	@Property String pista
    new() {}
	new(String pista) {
		this.pista = pista
	}

}
