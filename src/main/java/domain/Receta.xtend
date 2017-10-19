package domain

import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Receta {
	int id
	String nombre
	String descripcion
	Map<Alimento, Double> ingredientes = new HashMap<Alimento, Double>

	new(String unNombre, String unaDescripcion, Map<Alimento, Double> unosIngredientes) {
		nombre = unNombre
		descripcion = unaDescripcion
		ingredientes = unosIngredientes
	}
	
	def esValida(){
		nombre.length > 1 && descripcion.length > 1 //&& ingredientes.size > 1
	}

	override String toString(){
		val result = new StringBuilder
		ingredientes.keySet.forEach[key|result.append(key.nombre)]
		result.toString
	}
}
