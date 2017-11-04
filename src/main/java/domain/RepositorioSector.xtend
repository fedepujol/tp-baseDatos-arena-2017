package domain

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioSector {
	int id = 1
	static var RepositorioSector instance
	Collection<Sector> sectores = new ArrayList<Sector>

	private new() {
	}

	static def getInstance() {
		if (instance.identityEquals(null)) {
			instance = new RepositorioSector
		}
		instance
	}

	def create(Sector unSector) {
		this.validateCreate(unSector)
		if (sectores.contains(unSector)) {
			throw new BusinessException("El sector ya existe")
		}
		unSector.id = id
		sectores.add(unSector)
		id++
	}

	def validateCreate(Sector unSector) {
		if (!unSector.esValida) {
			throw new BusinessException("Sector invalido")
		}
	}

	def searchById(Integer unId) {
		sectores.findFirst[sector|sector.id === unId]
	}

}
