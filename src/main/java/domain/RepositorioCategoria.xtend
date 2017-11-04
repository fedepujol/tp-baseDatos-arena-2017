package domain

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioCategoria {
	int id = 1
	Collection<Categoria> categorias = new ArrayList<Categoria>
	static var RepositorioCategoria instance

	private new() {
	}

	static def getInstance() {
		if (instance.identityEquals(null)) {
			instance = new RepositorioCategoria
		}
		instance
	}
	
	def create(Categoria unaCategoria) {
		this.validateCreate(unaCategoria)
		if (categorias.contains(unaCategoria)) {
			throw new BusinessException("La categoria ya existe")
		}
		unaCategoria.id = id
		categorias.add(unaCategoria)
		id++
	}

	def validateCreate(Categoria unaCategoria) {
		if (!unaCategoria.esValida) {
			throw new BusinessException("Categoria invalida")
		}
	}
	
	def searchById(Integer unId){
		categorias.findFirst[categoria | categoria.id === unId]
	}
}
