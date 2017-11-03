package viewModel

import domain.Ingrediente
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
	List<Ingrediente> ingredientes
	
	new(Receta unaReceta){
		receta = unaReceta
		recetas = RepositorioReceta.instance.recetas.toList
		ingredientes = RepositorioReceta.instance.getIngredienteByRecetaId(1).toList
	}
	
}