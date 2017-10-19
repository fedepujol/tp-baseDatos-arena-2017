package viewModel

import domain.Receta
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class RecetaModel {
	Receta receta
	
	new(Receta unaReceta){
		receta = unaReceta
	}
	
}