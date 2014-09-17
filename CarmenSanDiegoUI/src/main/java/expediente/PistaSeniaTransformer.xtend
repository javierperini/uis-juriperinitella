package expediente

import org.uqbar.arena.bindings.Transformer
import org.uqbar.commons.model.UserException
import pista.PistaSenia

class PistaSeniaTransformer implements Transformer<PistaSenia, String>{

	override getModelType() {
		PistaSenia
		}

	override getViewType() {
		String
	}

	override modelToView(PistaSenia valueFromModel) {
		valueFromModel.toString
	}

	override viewToModel(String valueFromView) {
		if (valueFromView == "")
			null
		else
			try
				new PistaSenia(valueFromView)
			catch (Exception e)//falta crea exception
				throw new UserException("", e)
	}
	

}
	
