package viewModel

import domain.Alimento
import domain.Categoria
import domain.RepositorioCategoria
import domain.RepositorioUnidadMedida
import domain.UnidadMedida
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import domain.Sector
import domain.RepositorioSector

@Observable
@Accessors
class AlimentoModel {
	Alimento alimento
	UnidadMedida unidadSeleccionada
	Categoria categoriaSeleccionada
	List<UnidadMedida> unidades
	List<Categoria> categorias
	Sector sectorSeleccionado
	List<Sector> sectores

	new(Alimento unAlimento) {
		alimento = unAlimento
		unidades = RepositorioUnidadMedida.instance.unidades.toList
		categorias = RepositorioCategoria.instance.categorias.toList
		sectores = RepositorioSector.instance.sectores.toList
	}

	def agregar(){
		alimento.unidad = unidadSeleccionada
		alimento.categoria = categoriaSeleccionada
		unidadSeleccionada = null
		categoriaSeleccionada = null
		alimento.sector = sectorSeleccionado
	}
	
	def crear() {
	}
}
