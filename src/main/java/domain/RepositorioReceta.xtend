package domain

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioReceta {
	int id = 1
	Collection<Receta> recetas = new ArrayList<Receta>
	static var RepositorioReceta instance

	private new() {
	}

	static def getInstance() {
		if (instance.identityEquals(null)) {
			instance = new RepositorioReceta
		}
		instance
	}

	def create(Receta unaReceta) {
		this.validateCreate(unaReceta)
		if (recetas.contains(unaReceta)) {
			throw new BusinessException("La receta ya existe")
		}
		unaReceta.id = id
		recetas.add(unaReceta)
		id++
	}

	def validateCreate(Receta unaReceta) {
		if (!unaReceta.esValida) {
			throw new BusinessException("Receta invalida")
		}
	}
	
	def getIngredienteByRecetaId(Integer unId){
		val receta = recetas.findFirst[receta | receta.id == unId]
		receta.ingredientes
	}
}
