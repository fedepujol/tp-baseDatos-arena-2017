package runnable

import domain.Alimento
import domain.Categoria
import domain.Receta
import domain.RepositorioAlimento
import domain.RepositorioCategoria
import domain.RepositorioReceta
import domain.RepositorioUnidadMedida
import domain.UnidadMedida
import java.util.HashMap
import java.util.Map
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap

class HeladeraBootstrap extends CollectionBasedBootstrap {

	new() {
	}

	override run() {
		val repoAlimentos = RepositorioAlimento.instance
		val repoMedidas = RepositorioUnidadMedida.instance
		val repoRecetas = RepositorioReceta.instance
		val repoCategorias = RepositorioCategoria.instance

		val kilo = new UnidadMedida("Kilo")
		val litro = new UnidadMedida("Litro")
		val unidadSola = new UnidadMedida("Unidad")

		val Map<Alimento, Double> ingrediente = new HashMap<Alimento, Double>
		ingrediente.put(new Alimento("Pollo", 1, kilo, new Categoria("Carnes")), 0.150)

		repoRecetas => [
			create(new Receta("Receta 1", "Descripcion 1", ingrediente))
		]

		repoCategorias => [
			create(new Categoria("Carnes"))
			create(new Categoria("Verduras"))
			create(new Categoria("Lacteos"))
			create(new Categoria("Gaseosas"))
		]

		repoMedidas => [
			create(kilo)
			create(litro)
			create(unidadSola)

		]

		repoAlimentos => [
			create(new Alimento("Carne", 1, kilo, new Categoria("Carnes")))
			create(new Alimento("Cepita", 1.50, litro, new Categoria("Lacteos")))
			create(new Alimento("Tomate", 1, unidadSola, new Categoria("Verduras")))
		]
	}

}
