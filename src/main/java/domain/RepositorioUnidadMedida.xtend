package domain

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioUnidadMedida {
	int id = 1
	static var RepositorioUnidadMedida instance
	Collection<UnidadMedida> unidades = new ArrayList<UnidadMedida>

	private new() {
	}

	static def getInstance() {
		if (instance.identityEquals(null)) {
			instance = new RepositorioUnidadMedida
		}
		instance
	}

	def create(UnidadMedida unaUnidad) {
		this.validateCreate(unaUnidad)
		if (unidades.contains(unaUnidad)) {
			throw new BusinessException("La unidad de medida ya existe")
		}
		unaUnidad.id = id
		unidades.add(unaUnidad)
		id++
	}

	def validateCreate(UnidadMedida unaUnidad) {
		if (!unaUnidad.esValida) {
			throw new BusinessException("Unidad de medida invalida")
		}
	}

	def searchById(Integer unId) {
		unidades.findFirst[unidad|unidad.id === unId]
	}

}
