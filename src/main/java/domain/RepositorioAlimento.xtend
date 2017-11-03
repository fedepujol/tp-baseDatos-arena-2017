package domain

import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.exceptions.UserException

@Accessors
class RepositorioAlimento {
	int id = 1
	static var RepositorioAlimento instance
//	List<Alimento> alimentos = new ArrayList<Alimento>
	HashMap<Alimento, Double> alimentos = new HashMap<Alimento, Double>

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
//		if (alimentos.contains(unAlimento)) {
//			throw new BusinessException("El alimento ya existe")
//		}
		unAlimento.id = id
//		alimentos.add(unAlimento)
		id++
		if (alimentos.containsKey(unAlimento)) {
			alimentos.put(unAlimento, alimentos.get(unAlimento) + unAlimento.cantidad)
		} else {
			alimentos.put(unAlimento, unAlimento.cantidad)
		}
	}

	def validateCreate(Alimento unAlimento) {
		unAlimento.validateAlimento
		if (!unAlimento.esValido) {
			throw new UserException("El alimento es invalido")
		}
	}

	def search(String unNombre, Double unaCantidad) {
		alimentos.keySet.filter [ alimento |
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
