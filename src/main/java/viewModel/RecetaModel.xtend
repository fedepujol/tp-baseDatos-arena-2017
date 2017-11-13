package viewModel

import domain.Ingrediente
import domain.Receta
import domain.RepositorioReceta
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import domain.Alimento
import domain.RepoJDBC
import java.sql.ResultSet

@Observable
@Accessors
class RecetaModel {
	RepoJDBC repoJDBC
	Receta receta
	Receta recetaSeleccionada
	List<Receta> recetas
	List<Ingrediente> ingredientes
	String ingrediente
	
	List<String> resultadoIngredientes
	 
	
	
	new(Receta unaReceta){
		receta = unaReceta
		recetas = RepositorioReceta.instance.recetas.toList
//		ingredientes = RepositorioReceta.instance.getIngredienteByRecetaId(1).toList
	}
	
	def search(){
		println(ingrediente)
		repoJDBC = new RepoJDBC
		recetas = repoJDBC.buscarRecetas(ingrediente)
//		receta = new Receta(resultado.getString("Descripcion"))
//		resultadoIngredientes = repoJDBC.buscarIngredientes(resultado)
	}
}