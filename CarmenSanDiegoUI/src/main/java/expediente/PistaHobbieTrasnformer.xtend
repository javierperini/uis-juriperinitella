package expediente

import org.uqbar.arena.bindings.Transformer
import org.uqbar.commons.model.UserException
import pista.PistaHobbie

class PistaHobbieTrasnformer implements Transformer<PistaHobbie, String> {

	override getModelType() {
		PistaHobbie
		}

	override getViewType() {
		String
	}

	override modelToView(PistaHobbie valueFromModel) {
		valueFromModel.toString
	}

	override viewToModel(String valueFromView) {
		if (valueFromView == "")
			null
		else
			try
				new PistaHobbie(valueFromView)
			catch (Exception e)//falta crea exception
				throw new UserException("El valor ingresado debe ser un número", e)
				}
	

}
	

	