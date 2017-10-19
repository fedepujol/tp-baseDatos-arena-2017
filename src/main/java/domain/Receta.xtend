package domain

import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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

}
