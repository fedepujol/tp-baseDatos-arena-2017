package viewModel

import domain.Alimento
import domain.Categoria
import domain.Receta
import domain.RepositorioAlimento
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class HeladeraModel {
	Alimento example = new Alimento("", Double.NaN, null, new Categoria("Nula"))
	Alimento alimentoSeleccionado
	Receta recetaSeleccionada
	List<Alimento> alimentos
	
	new(){
		alimentoSeleccionado = null	
	}
	
	def search(){
		alimentos = RepositorioAlimento.instance.search(example.nombre, example.cantidad)
	}
	
	def clear(){
		example = new Alimento("", Double.NaN, null, new Categoria("Nula"))
		alimentoSeleccionado = null
		this.search()
	}
	
	def validateSearch(){
		if(example.nombre === null){
			example.cantidad = Double.NaN
		}
	}
}