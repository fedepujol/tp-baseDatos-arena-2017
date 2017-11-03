package domain

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Receta {
	int id
	String nombre
	String descripcion
	Collection<Ingrediente> ingredientes = new ArrayList<Ingrediente>

	new(String unNombre, String unaDescripcion, Collection<Ingrediente> unosIngredientes) {
		nombre = unNombre
		descripcion = unaDescripcion
		ingredientes = unosIngredientes
	}

	def esValida() {
		nombre.length > 1 && descripcion.length > 1 // && ingredientes.size > 1
	}
}
