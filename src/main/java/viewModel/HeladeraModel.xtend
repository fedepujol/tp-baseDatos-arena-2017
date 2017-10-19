package viewModel

import domain.Alimento
import domain.RepositorioAlimento
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class HeladeraModel {
	Alimento alimentoSeleccionado
	List<Alimento> alimentos
	
	new(){
		alimentoSeleccionado = null	
	}
	
	def search(){
		alimentos = RepositorioAlimento.instance.search("")
	}
}