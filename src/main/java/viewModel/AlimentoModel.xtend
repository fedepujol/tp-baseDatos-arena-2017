package viewModel

import domain.Alimento
import domain.Categoria
import domain.RepositorioAlimento
import domain.RepositorioCategoria
import domain.RepositorioSector
import domain.RepositorioUnidadMedida
import domain.Sector
import domain.UnidadMedida
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class AlimentoModel {
	Alimento alimento
	List<UnidadMedida> unidades
	List<Categoria> categorias
	List<Sector> sectores

	new(Alimento unAlimento) {
		alimento = unAlimento
		unidades = RepositorioUnidadMedida.instance.unidades.toList
		categorias = RepositorioCategoria.instance.categorias.toList
		sectores = RepositorioSector.instance.sectores.toList
	}
	
	def crear() {
		RepositorioAlimento.instance.create(alimento)
	}
}
