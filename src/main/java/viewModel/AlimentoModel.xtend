package viewModel

import domain.Alimento
import domain.Categoria
import domain.RepositorioCategoria
import domain.RepositorioUnidadMedida
import domain.UnidadMedida
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class AlimentoModel {
	Alimento alimento
	UnidadMedida unidadSeleccionada
	Categoria categoriaSeleccionada
	List<UnidadMedida> unidades
	List<Categoria> categorias

	new(Alimento unAlimento) {
		alimento = unAlimento
		unidades = RepositorioUnidadMedida.instance.unidades.toList
		categorias = RepositorioCategoria.instance.categorias.toList
	}

	def agregar(){
		alimento.unidad = unidadSeleccionada
		alimento.categoria = categoriaSeleccionada
		unidadSeleccionada = null
		categoriaSeleccionada = null
	}
	
	def crear() {
	}
}
