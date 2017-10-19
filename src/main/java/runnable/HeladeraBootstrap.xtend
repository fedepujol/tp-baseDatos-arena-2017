package runnable

import domain.Alimento
import domain.RepositorioAlimento
import domain.RepositorioUnidadMedida
import domain.UnidadMedida
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap

class HeladeraBootstrap extends CollectionBasedBootstrap {

	new() {
	}

	override run() {
		val repoAlimentos = RepositorioAlimento.instance
		val repoMedidas = RepositorioUnidadMedida.instance
		
		val kilo = new UnidadMedida("Kilo")
		val litro = new UnidadMedida("Litro")
		val unidad = new UnidadMedida("Unidad")
		
		
		repoMedidas => [
			create(kilo)
			create(litro)
			create(unidad)
			
		]
		
		repoAlimentos => [
			create(new Alimento("Carne", 1, kilo))
			create(new Alimento("Cepita", 1, litro))
			create(new Alimento("Tomate", 1, unidad))
		]
	}

}
