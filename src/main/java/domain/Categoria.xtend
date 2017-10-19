package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Categoria {
	int id
	String nombre
	
	new(String unNombre){
		nombre = unNombre
	}
	
	def esValida(){
		nombre !== "" && nombre.length > 0
	}
}