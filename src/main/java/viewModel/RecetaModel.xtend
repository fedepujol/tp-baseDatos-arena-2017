package viewModel

import domain.Receta
import domain.RepositorioReceta
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class RecetaModel {
	Receta receta
	Receta recetaSeleccionada
	List<Receta> recetas
	
	new(Receta unaReceta){
		receta = unaReceta
		recetas = RepositorioReceta.instance.recetas.toList
	}
	
}