package domain

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioAlimento {
	int id = 1
	static var RepositorioAlimento instance
	List<Alimento> alimentos = new ArrayList<Alimento>

	private new() {
	}

	static def getInstance() {
		if (instance.identityEquals(null)) {
			instance = new RepositorioAlimento
		}
		instance
	}

	def create(Alimento unAlimento) {
		this.validateCreate(unAlimento)
		if (alimentos.contains(unAlimento)) {
			throw new BusinessException("El alimento ya existe")
		}
		unAlimento.id = id
		alimentos.add(unAlimento)
		id++
	}

	def validateCreate(Alimento unaUnidad) {
		if (!unaUnidad.esValido) {
			throw new BusinessException("El alimento es invalido")
		}
	}

	def search(String unNombre, Double unaCantidad) {
		alimentos.filter [ alimento |
			this.match(unNombre, alimento.nombre) && this.matchNaN(unaCantidad, alimento.cantidad)
		].toList
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	def matchNaN(double expectedValue, double realValue) {
		if (expectedValue.identityEquals(null)) {
			return true
		}
		if (realValue.identityEquals(null)) {
			return false
		}
		
		if (Double.isNaN(expectedValue)) {
			return true
		} else {
			realValue === expectedValue
		}
	}
}
