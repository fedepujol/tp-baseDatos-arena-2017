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
import org.uqbar.commons.model.exceptions.UserException

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
		if (recetas.length == 0){
			throw new UserException("No hay recetas que contengan ese ingrediente")
		}
//		receta = new Receta(resultado.getString("Descripcion"))
//		resultadoIngredientes = repoJDBC.buscarIngredientes(resultado)
	}
	
	def buscarIngredientes(){
		repoJDBC = new RepoJDBC
		ingredientes = repoJDBC.buscarIngredientes(recetaSeleccionada.descripcion)
		println(ingredientes)
	}
	
	def clear1(){
		ingrediente = ""
		recetas = {}
	}
}